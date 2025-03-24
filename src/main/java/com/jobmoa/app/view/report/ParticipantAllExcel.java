package com.jobmoa.app.view.report;

import com.jobmoa.app.biz.bean.LoginBean;
import com.jobmoa.app.biz.participant.ParticipantDTO;
import com.jobmoa.app.biz.participant.ParticipantServiceImpl;
import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.List;

@Slf4j
@Controller
public class ParticipantAllExcel {
    @Autowired
    private ResourceLoader resourceLoader;  // Spring의 ResourceLoader 주입

    @Autowired
    private ParticipantServiceImpl participantService;

    private byte[] templateBytes;  // 템플릿 파일을 캐싱할 바이트 배열

    // 서버 시작 시 템플릿 파일을 한 번만 읽어 캐싱
    @PostConstruct
    public void init() {
        log.info("Initializing Excel template...");
        try (InputStream is = resourceLoader.getResource("classpath:excelTemplates/template2.xlsx").getInputStream()) {
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

    @GetMapping("/participantExcel.login")
    public void participantExcel(HttpServletResponse response, ParticipantDTO participantDTO, HttpSession session){
        LoginBean loginBean = (LoginBean) session.getAttribute("JOBMOA_LOGIN_DATA");
        participantDTO.setParticipantUserid(loginBean.getMemberUserID());
        participantDTO.setParticipantBranch(loginBean.getMemberBranch());
        participantDTO.setParticipantCondition("participantExcel");
        createExcel(response,participantDTO);
    }

    private void createExcel(HttpServletResponse response,ParticipantDTO participantDTO){
        // 1. 캐싱된 템플릿을 메모리에서 로드
        try (XSSFWorkbook workbook = new XSSFWorkbook(new ByteArrayInputStream(templateBytes))) {
            if (templateBytes == null) {
                throw new IllegalStateException("템플릿 파일이 로드되지 않았습니다.");
            }
            Sheet sheet = workbook.getSheetAt(0); // 첫 번째 시트 사용
            List<ParticipantDTO> datas = null;
            try{
                datas = participantService.selectAll(participantDTO);
            } catch (Exception e){
                log.error(e.getMessage());
            }
            log.info("createExcel datas : [{}]",datas);
            createRow(sheet,1,datas);

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
            String fileName = URLEncoder.encode(participantDTO.getParticipantUserid() + "_전체참여자_" + LocalDate.now() + ".xlsx", "UTF-8");
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
            workbook.write(response.getOutputStream());
        } catch (Exception e) {
            throw new RuntimeException("엑셀 파일 처리 중 오류가 발생했습니다.", e);
        }
    }

    private void createRow(Sheet sheet, int startRow, List<ParticipantDTO> datas) {
        // 2. startRow 데이터 시작 위치 설정 (템플릿에 따라 조정)
        // 3. 데이터 채우기

            for (ParticipantDTO data : datas) {
                //row 값 가져오기
                Row row = setRowValue(sheet,startRow);

                //행을 초기화 하여 값을 출력
                int colIndex = 0;
                setProgress(row,colIndex,data);
                startRow++;
            }

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
        if (value == null) {
            cell.setCellValue(0); // 0으로 설정
        }
        else if (value instanceof String) {
            cell.setCellValue((String) value);
        }
        else if (value instanceof Integer) {
            cell.setCellValue((Integer) value);
        }
        else if (value instanceof Double) {
            cell.setCellValue((Double) value);
        }
        else {
            // 다른 타입의 경우 문자열로 변환
            cell.setCellValue(String.valueOf(value));
        }
        // 스타일 재적용
        if (existingStyle != null) {
            cell.setCellStyle(existingStyle);
        }
    }

    private void setProgress(Row row, int colIndex, ParticipantDTO data) {
        setCellValue(row, colIndex++, data.getParticipantJobNo());      // 구직번호
        setCellValue(row, colIndex++, data.getParticipantRegDate());    // 등록일
        setCellValue(row, colIndex++, data.getParticipantUserid());     // 전담자_계정
        setCellValue(row, colIndex++, data.getParticipantPartic());     // 참여자
        setCellValue(row, colIndex++, data.getParticipantDob());        // 생년월일
        setCellValue(row, colIndex++, data.getParticipantGender());     // 성별
        setCellValue(row, colIndex++, data.getParticipantRecruit());    // 모집경로
        setCellValue(row, colIndex++, data.getParticipantPartType());   // 참여유형
        setCellValue(row, colIndex++, data.getParticipantSchool());     // 학교명
        setCellValue(row, colIndex++, data.getParticipantSpecialty());  // 전공
        setCellValue(row, colIndex++, data.getParticipantAddress());    // 주소
        setCellValue(row, colIndex++, data.getParticipantAntecedents()); // 경력
        setCellValue(row, colIndex++, data.getParticipantSpecific());   // 특정계층
        setCellValue(row, colIndex++, data.getParticipantPlacement());  // 알선요청
        setCellValue(row, colIndex++, data.getParticipantJobSkill());   // 취업역량
        setCellValue(row, colIndex++, data.getParticipantLastCons());   // 최근상담일
        setCellValue(row, colIndex++, data.getParticipantProgress());   // 진행단계
        setCellValue(row, colIndex++, data.getParticipantInItCons());   // 초기상담일
        setCellValue(row, colIndex++, data.getParticipantJobEX());      // 구직만료일
        setCellValue(row, colIndex++, data.getParticipantIAPDate());    // IAP수료일
        setCellValue(row, colIndex++, data.getParticipantStepPro());    // [3단계진입일]
        setCellValue(row, colIndex++, data.getParticipantEXPDate());    // 기간만료일
        setCellValue(row, colIndex++, data.getParticipantJobWant());    // 희망직무
        setCellValue(row, colIndex++, data.getParticipantSalWant());    // 희망급여
        setCellValue(row, colIndex++, data.getParticipantStartDate());  // 취창업일
        setCellValue(row, colIndex++, data.getParticipantProcDate());   // 취창업처리일
        setCellValue(row, colIndex++, data.getParticipantEmpType());    // 취업유형
        setCellValue(row, colIndex++, data.getParticipantLoyer());      // 취업처
        setCellValue(row, colIndex++, data.getParticipantSalary());     // 임금
        setCellValue(row, colIndex++, data.getParticipantJobRole());    // 직무
        setCellValue(row, colIndex++, data.getParticipantIncentive());  // 취업인센티브_구분
        setCellValue(row, colIndex++, data.getParticipantJobcat());     // 일경험분류
        setCellValue(row, colIndex++, data.getParticipantMemo());       // 메모
        setCellValue(row, colIndex++, data.getParticipantOthers());     // 기타
        setCellValue(row, colIndex++, data.isParticipantClose());      // 마감
        setCellValue(row, colIndex++, data.getParticipantQuit());       // 퇴사일
        setCellValue(row, colIndex++, data.getParticipantBranch());     // 지점
        setCellValue(row, colIndex++, data.getParticipantEndDate());    // 중단종료일
        setCellValue(row, colIndex, data.getParticipantEmploymentService()); // 간접고용서비스

    }
}
