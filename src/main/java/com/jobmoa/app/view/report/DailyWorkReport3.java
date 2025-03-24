package com.jobmoa.app.view.report;

import com.jobmoa.app.biz.bean.LoginBean;
import com.jobmoa.app.biz.login.MemberDTO;
import com.jobmoa.app.biz.login.MemberServiceImpl;
import com.jobmoa.app.biz.report.ReportDTO;
import com.jobmoa.app.biz.report.ReportServiceImpl;
import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.apache.catalina.Session;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.List;

@Slf4j
@Controller
public class DailyWorkReport3 {

    @Autowired
    private ResourceLoader resourceLoader;  // Spring의 ResourceLoader 주입

    @Autowired
    private ReportServiceImpl reportService;

    @Autowired
    private MemberServiceImpl memberService;

    private byte[] templateBytes;  // 템플릿 파일을 캐싱할 바이트 배열

    // 서버 시작 시 템플릿 파일을 한 번만 읽어 캐싱
    @PostConstruct
    public void init() {
        log.info("Initializing Excel template...");
        try (InputStream is = resourceLoader.getResource("classpath:excelTemplates/template.xlsx").getInputStream()) {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            byte[] buffer = new byte[1024];
            int len;
            while ((len = is.read(buffer)) > -1) {
                baos.write(buffer, 0, len);
            }
            templateBytes = baos.toByteArray();
            log.info("Excel template loaded into memory successfully, size: {} bytes", templateBytes.length);
        } catch (IOException e) {
            throw new RuntimeException("Failed to load Excel template during initialization", e);
        }
    }

    // 보고서 페이지 요청 처리
    @GetMapping("report.login")
    public String reportPage(Model model, MemberDTO memberDTO, HttpSession session) {

        LoginBean loginBean = (LoginBean) session.getAttribute("JOBMOA_LOGIN_DATA");

        String branch = loginBean.getMemberBranch();

        memberDTO.setMemberCondition("loginSelectAll");
        memberDTO.setMemberBranch(branch);
        List<MemberDTO> memberList = memberService.selectAll(memberDTO);

        log.info("memberList : [{}]",memberList);
        model.addAttribute("users", memberList);

        return "views/DailyWorkReportPage";
    }

    // 엑셀 다운로드 요청 처리
    @GetMapping("downloadExcel.login")
    public void downloadExcel(HttpServletResponse response, ReportDTO reportDTO){
        createExcel(response,reportDTO);
    }

    private void createExcel(HttpServletResponse response, ReportDTO reportDTO){
        // 1. 캐싱된 템플릿을 메모리에서 로드
        try (XSSFWorkbook workbook = new XSSFWorkbook(new ByteArrayInputStream(templateBytes))) {
            Sheet sheet = workbook.getSheetAt(0); // 첫 번째 시트 사용
            int year = reportDTO.getYear() == null ?0:Integer.parseInt(reportDTO.getYear());
//            String year = reportDTO.getYear() == null ?0:reportDTO.getYear();
            String branch = reportDTO.getBranch() == null ?"":reportDTO.getBranch();

            //상단 일일보고 제목을 지정
            setCellValue(setRowValue(sheet,0), 0, branch+"지점 국민취업지원제도 업무진행현황 일일보고");
            log.info("createExcel branch : [{}]",branch);

            //배정 인원
            reportDTO.setReportCondition("reportSelectAssignOne");
            ReportDTO assignOne = reportService.selectOne(reportDTO);
            setCellValue(setRowValue(sheet,8),2,assignOne.getType1());
            setCellValue(setRowValue(sheet,8),4,assignOne.getType2());
            log.info("createExcel assignOne : [{}],[{}]",assignOne.getType1(), assignOne.getType2());

            //민간위탁기관 평가 실적
            //제목을 지정
            setCellValue(setRowValue(sheet,24), 0, year+"년 민간위탁기관 평가 실적");
            //요청 년도 참여자 생성
            reportDTO.setReportCondition("reportSelectStatusAll");
            List<ReportDTO> datas = reportService.selectAll(reportDTO);
            log.info("createExcel datas : [{}]",datas);
            createRow(sheet,27,datas,reportDTO.getReportCondition());


            //요청 년도의 참여자 진행현황을 출력
            //제목을 지정
            setCellValue(setRowValue(sheet,37), 1, year+"년 참여자 진행현황 (국민취업지원제도)");
            //요청 년도 참여자 생성
            reportDTO.setReportCondition("reportSelectProgressAll");
            datas = reportService.selectAll(reportDTO);
            log.info("createExcel datas : [{}]",datas);
            createRow(sheet,40,datas,reportDTO.getReportCondition());

            //요청 이전 년도의 참여자 진행현황을 출력
            //제목을 지정
            setCellValue(setRowValue(sheet,50), 1, (year-1)+"년 참여자 진행현황 (국민취업지원제도)");
            //이전 년도 생성해서 추가
            reportDTO.setYear((year-1)+"");
            //요청 년도 참여자 생성
            reportDTO.setReportCondition("reportSelectProgressAll");
            datas = reportService.selectAll(reportDTO);
            log.info("createExcel datas : [{}]",datas);
            createRow(sheet,53,datas,reportDTO.getReportCondition());

            // 수식이 포함된 셀들의 계산을 실행
            // 1. 워크북의 CreationHelper를 얻어옴
            // 2. FormulaEvaluator 생성
            // 3. evaluateAll()로 모든 수식을 재계산
            workbook.getCreationHelper()
                    .createFormulaEvaluator()
                    .evaluateAll();

            /*
             * 수식 계산 방법은 크게 두 가지가 있습니다:
             * 1. evaluateAll(): 워크북의 모든 수식을 한 번에 계산
             * 2. evaluate(Cell): 특정 셀의 수식만 계산
             *
             * evaluateAll()은 다음과 같은 경우에 유용합니다:
             * - 여러 시트에 걸쳐 수식이 있는 경우
             * - 수식들이 서로 연관되어 있는 경우
             * - 수식이 많은 경우 한 번에 처리 가능
             */

            // 4. 파일 다운로드 설정
            String fileName = URLEncoder.encode(branch + "_일일보고서_" + LocalDate.now() + ".xlsx", "UTF-8");
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
            workbook.write(response.getOutputStream());
        } catch (Exception e) {
            throw new RuntimeException("엑셀 파일 처리 중 오류가 발생했습니다.", e);
        }
    }

    private void createRow(Sheet sheet, int startRow, List<ReportDTO> datas, String condition) {
        log.info("createRow Start... : [{}]",condition);
        // 2. startRow 데이터 시작 위치 설정 (템플릿에 따라 조정)
        // 3. 데이터 채우기
        if(condition.equals("reportSelectStatusAll")){
            for (ReportDTO data : datas) {
                //row 값 가져오기
                Row row = setRowValue(sheet,startRow);

                //행을 초기화 하여 값을 출력
                int colIndex = 0;
                setStatus(row,colIndex,data);
                startRow++;
            }
        }
        else if(condition.equals("reportSelectProgressAll")){
            for (ReportDTO data : datas) {
                //row 값 가져오기
                Row row = setRowValue(sheet,startRow);

                //행을 초기화 하여 값을 출력
                int colIndex = 0;
                setProgress(row,colIndex,data);
                startRow++;
            }
        }
        log.info("createRow End... : [{}]",condition);

    }

    private Row setRowValue(Sheet sheet, int startRow) {
        Row row = sheet.getRow(startRow); // 기존 행 가져오기
        if (row == null) {
            row = sheet.createRow(startRow); // 행이 없으면 새로 생성
        }
        return row;
    }

    // 셀 값을 설정하며 기존 스타일 유지
    private void setCellValue(Row row, int columnIndex, Object value) {
        Cell cell = row.getCell(columnIndex);
        if (cell == null) {
            cell = row.createCell(columnIndex); // 셀이 없으면 생성
        }
        // 기존 스타일 유지
        CellStyle existingStyle = cell.getCellStyle();
        if (value instanceof String) {
            cell.setCellValue((String) value);
        } else if (value instanceof Integer) {
            cell.setCellValue((Integer) value);
        } else if (value instanceof Double) {
            cell.setCellValue((Double) value);
        }
        // 스타일 재적용
        if (existingStyle != null) {
            cell.setCellStyle(existingStyle);
        }
    }

    private void setProgress(Row row, int colIndex, ReportDTO data){
        setCellValue(row, colIndex++, data.getCounselorName());        // 이름
        setCellValue(row, colIndex++, data.getCancelCount());          // 취소자
        setCellValue(row, colIndex++, data.getTotalParticipants());    // 참여자 합계
        setCellValue(row, colIndex++, data.getCurrentProgress());      // 현진행자
        setCellValue(row, colIndex++, data.getThirdStageCount());     // 3단계 진행자
        setCellValue(row, colIndex++, data.getCompletedCount());      // 기간만료
        setCellValue(row, colIndex++, data.getDiscontinuedCount());   // 중단
        setCellValue(row, colIndex++, data.getNonApprovedEmployment()); // 성과 불인정 취업
        setCellValue(row, colIndex++, data.getApprovedEmployment());   // 성과 인정 취업
        setCellValue(row, colIndex++, data.getReferralEmployment());   // 알선취업
        setCellValue(row, colIndex++, data.getEvaluationEmploymentRate()); // 평가 취업률
        setCellValue(row, colIndex++, data.getReferralEmploymentRate());   // 알선취업률
        setCellValue(row, colIndex++, data.getBetterJobRate());           // 229만원 이상 취업률
        setCellValue(row, colIndex++, data.getRetentionRate());           // 고용유지율
        setCellValue(row, colIndex++, data.getEarlyEmploymentRate());     // 조기취업실적
        setCellValue(row, colIndex++, data.getIncentiveOccurrenceRate()); // 취업인센티브 발생률
        setCellValue(row, colIndex, data.getIncentiveNotOccurred());    // 취업인센티브 미발생자
    }
    private void setStatus(Row row, int colIndex, ReportDTO data){
        setCellValue(row, colIndex++, data.getCounselorName());        // 이름
        setCellValue(row, colIndex++, data.getCompletedCount());          // 종료참여자
        setCellValue(row, colIndex++, data.getTotalEmployment());         // 취업자
        setCellValue(row, colIndex++, data.getReferralEmployment());      // 알선취업
        setCellValue(row, colIndex++, data.getApprovedEmployment());      // 성과 인정 취업
        setCellValue(row, colIndex++, data.getNonApprovedEmployment());   // 성과 불인정 취업
        setCellValue(row, colIndex++, data.getEmploymentRetention());     // 고용유지
        setCellValue(row, colIndex++, data.getBetterJobCount());          // 229만원 이상 취업자
        setCellValue(row, colIndex++, data.getEmploymentRate());          // 취업률
        setCellValue(row, colIndex++, data.getEvaluationEmploymentRate()); // 평가 취업률
        setCellValue(row, colIndex++, data.getReferralEmploymentRate());   // 알선취업률
        setCellValue(row, colIndex++, data.getBetterJobRate());           // 229만원 이상 취업률
        setCellValue(row, colIndex++, data.getRetentionRate());           // 고용유지율
        colIndex++;//위치를 맞추기 위해 한번더 +1을 실행
        colIndex++;//위치를 맞추기 위해 한번더 +1을 실행
        setCellValue(row, colIndex++, data.getIncentiveOccurrenceRate()); // 취업인센티브 발생률
        setCellValue(row, colIndex, data.getIncentiveNotOccurred());      // 취업인센티브 미발생자
    }
}