//// 패키지 선언
//package com.jobmoa.app.view.report;
//
//// 필요한 라이브러리 임포트
//
//import jakarta.servlet.http.HttpServletResponse;
//import lombok.extern.slf4j.Slf4j;
//import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
//import org.apache.poi.ss.usermodel.*;
//import org.apache.poi.xssf.usermodel.XSSFWorkbook;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.core.io.ClassPathResource;
//import org.springframework.core.io.Resource;
//import org.springframework.core.io.ResourceLoader;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//
//import java.io.File;
//import java.io.FileNotFoundException;
//import java.io.IOException;
//import java.io.InputStream;
//
//// Lombok 로깅 어노테이션과 스프링 컨트롤러 어노테이션
//@Slf4j
//@Controller
//public class DailyWorkReport2 {
//
//    @Autowired
//    private ResourceLoader resourceLoader;  // Spring의 ResourceLoader 주입
//
//    // 보고서 페이지 요청 처리
//    @GetMapping("report.login")
//    public String reportPage() {
//        return "views/DailyWorkReportPage";
//    }
//
//    // 엑셀 다운로드 요청 처리
//    @GetMapping("downloadExcel.login")
//    public void downloadExcel(HttpServletResponse response) throws IOException, InvalidFormatException {
//        // 1. 템플릿 파일 읽기
//        try(InputStream is = resourceLoader.getResource("classpath:excelTemplates/template.xlsx").getInputStream();
//            Workbook workbook = new XSSFWorkbook(is)){
//            Sheet sheet = workbook.getSheetAt(0); // 첫 번째 시트 사용
//
//            // 2. 데이터 시작 위치 설정 (템플릿에 따라 조정)
//            int startRow = 12; // 예: 13행부터 데이터 입력
//            //        List<YourEntity> dataList = yourService.getAllData();
//
//            // 3. 데이터 채우기
//            for (int i = 0; i < 10; i++ ) {
//                Row row = sheet.getRow(startRow); // 기존 행 가져오기
//                if (row == null) {
//                    row = sheet.createRow(startRow); // 행이 없으면 새로 생성
//                }
//                setCellValue(row, 0, "startRow :"+startRow+ "테스트 " + i);
//                setCellValue(row, 1, "startRow :"+startRow+ "테스트 " + i);
//                setCellValue(row, 3, "startRow :"+startRow+ "테스트 " + i);
//                setCellValue(row, 5, "startRow :"+startRow+ "테스트 " + i);
//                startRow++;
//            }
//
//            // 4. 파일 다운로드 설정
//            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
//            response.setHeader("Content-Disposition", "attachment; filename=filled_template.xlsx");
//            workbook.write(response.getOutputStream());
//        }
//        catch(Exception e){
//            throw new RuntimeException("엑셀 파일 처리 중 오류가 발생했습니다.", e);
//        }
//    }
//    // 셀 값을 설정하며 기존 스타일 유지
//    private void setCellValue(Row row, int columnIndex, Object value) {
//        Cell cell = row.getCell(columnIndex);
//        if (cell == null) {
//            cell = row.createCell(columnIndex); // 셀이 없으면 생성
//        }
//        // 기존 스타일 유지
//        CellStyle existingStyle = cell.getCellStyle();
//        if (value instanceof String) {
//            cell.setCellValue((String) value);
//        } else if (value instanceof Integer) {
//            cell.setCellValue((Integer) value);
//        } else if (value instanceof Double) {
//            cell.setCellValue((Double) value);
//        }
//        // 스타일 재적용
//        if (existingStyle != null) {
//            cell.setCellStyle(existingStyle);
//        }
//    }
//}