package com.jobmoa.app.view.report;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

@Slf4j
@Controller
public class DailyWorkReport3 {

    @Autowired
    private ResourceLoader resourceLoader;  // Spring의 ResourceLoader 주입

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
    public String reportPage() {
        return "views/DailyWorkReportPage";
    }

    // 엑셀 다운로드 요청 처리
    @GetMapping("downloadExcel.login")
    public void downloadExcel(HttpServletResponse response){
        createExcel(response);
    }

    private void createExcel(HttpServletResponse response){
        // 1. 캐싱된 템플릿을 메모리에서 로드
        try (Workbook workbook = new XSSFWorkbook(new ByteArrayInputStream(templateBytes))) {
            Sheet sheet = workbook.getSheetAt(0); // 첫 번째 시트 사용

            // 2. 데이터 시작 위치 설정 (템플릿에 따라 조정)
            int startRow = 27; // 예: 13행부터 데이터 입력

            // 3. 데이터 채우기
            for (int i = 0; i < 10; i++) {
                Row row = sheet.getRow(startRow); // 기존 행 가져오기
                if (row == null) {
                    row = sheet.createRow(startRow); // 행이 없으면 새로 생성
                }
                setCellValue(row, 0, "startRow :" + startRow + " 테스트 " + i);
                setCellValue(row, 1, "startRow :" + startRow + " 테스트 " + i);
                setCellValue(row, 3, "startRow :" + startRow + " 테스트 " + i);
                setCellValue(row, 5, "startRow :" + startRow + " 테스트 " + i);
                startRow++;
            }

            // 4. 파일 다운로드 설정
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=filled_template.xlsx");
            workbook.write(response.getOutputStream());
        } catch (Exception e) {
            throw new RuntimeException("엑셀 파일 처리 중 오류가 발생했습니다.", e);
        }
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
}