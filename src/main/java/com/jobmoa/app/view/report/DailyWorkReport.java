//// 패키지 선언
//package com.jobmoa.app.view.report;
//
//// 필요한 라이브러리 임포트
//import jakarta.servlet.http.HttpServletResponse;
//import lombok.extern.slf4j.Slf4j;
//import org.apache.poi.ss.usermodel.*;
//import org.apache.poi.ss.util.CellRangeAddress;
//import org.apache.poi.ss.util.CellReference;
//import org.apache.poi.ss.util.RegionUtil;
//import org.apache.poi.xssf.usermodel.XSSFWorkbook;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import java.io.IOException;
//import java.net.URLEncoder;
//import java.nio.charset.StandardCharsets;
//import java.time.LocalDateTime;
//import java.time.format.DateTimeFormatter;
//import java.util.Locale;
//
//// Lombok 로깅 어노테이션과 스프링 컨트롤러 어노테이션
//@Slf4j
//@Controller
//public class DailyWorkReport {
//    // 엑셀 관련 상수 정의
//    private static final String SHEET_NAME = "국민취업지원제도 업무진행현황";
//    private static final String FILE_PREFIX = "국민취업지원제도_일일업무일지_";
//    private static final String DATE_FORMAT_PATTERN = "yyyy년 MM월 dd일 E요일";
//    private static final int DEFAULT_COLUMN_WIDTH = 17;
//    private static final short DEFAULT_COLUMN_HEIGHT = 517;
//
//    // 셀 병합 범위 정의
//    private static final String[] CELL_MERGE_RANGES = {
//            //report title
//            "A1:M2", "A3:M3", "N1:N3", "O2:O3", "P2:P3", "Q2:Q3",
//            //report 1. 배정 현황
//            "A4:Q4", "A5:F7", "G5:J7", "L5:N7", "K5:k7", "O5:Q7",
//            "A8:B8", "C8:D8", "E8:F8", "A9:B9", "C9:D9", "E9:F9",
//            "G8:H8", "I8:J8", "G9:H9", "I9:J9", "K8:K9", "L8:N9",
//            "O8:Q9",
//            //report 2. 알선취업 성과 현황
//            "A10:Q10", "B11:E11", "B12:C12", "D12:E12",
//            "F11:I11", "F12:G12", "H12:I12",
//            "J11:M11", "J12:K12", "L12:M12",
//            "N11:Q11", "N12:O12", "P12:Q12",
//            "B13:C13", "D13:E13", "F13:G13", "H13:I13", "J13:K13", "L13:M13", "N13:O13", "P13:Q13",
//            "B14:C14", "D14:E14", "F14:G14", "H14:I14", "J14:K14", "L14:M14", "N14:O14", "P14:Q14",
//            "B15:C15", "D15:E15", "F15:G15", "H15:I15", "J15:K15", "L15:M15", "N15:O15", "P15:Q15",
//            "B16:C16", "D16:E16", "F16:G16", "H16:I16", "J16:K16", "L16:M16", "N16:O16", "P16:Q16",
//            "B17:C17", "D17:E17", "F17:G17", "H17:I17", "J17:K17", "L17:M17", "N17:O17", "P17:Q17",
//            "B18:C18", "D18:E18", "F18:G18", "H18:I18", "J18:K18", "L18:M18", "N18:O18", "P18:Q18",
//            "B19:C19", "D19:E19", "F19:G19", "H19:I19", "J19:K19", "L19:M19", "N19:O19", "P19:Q19",
//            "B20:C20", "D20:E20", "F20:G20", "H20:I20", "J20:K20", "L20:M20", "N20:O20", "P20:Q20",
//            "B21:C21", "D21:E21", "F21:G21", "H21:I21", "J21:K21", "L21:M21", "N21:O21", "P21:Q21",
//            "B22:C22", "D22:E22", "F22:G22", "H22:I22", "J22:K22", "L22:M22", "N22:O22", "P22:Q22",
//            "B23:C23", "D23:E23", "F23:G23", "H23:I23", "J23:K23", "L23:M23", "N23:O23", "P23:Q23"
//            //Report 3. 총괄 진행현황
//            //Report 4. 기타사항
//    };
//
//    // 테두리를 적용할 단일 셀 정의
//    private static final String[] BORDER_CELLS = {
//            "N1:N3", "O2:O3", "P2:P3", "Q2:Q3", "O1", "P1", "Q1",
//            //report 1. 배정 현황
//            "A4:Q4", "A5:F7", "G5:J7", "L5:N7", "K5:k7", "O5:Q7",
//            "A8:B8", "C8:D8", "E8:F8", "A9:B9", "C9:D9", "E9:F9",
//            "G8:H8", "I8:J8", "G9:H9", "I9:J9", "K8:K9", "L8:N9",
//            "O8:Q9",
//            //report 2. 알선취업 성과 현황
//            "A11","A12","A13","A14","A15","A16","A17","A18","A19","A20","A21","A22","A23",
//            "A10:Q10", "B11:E11", "B12:C12", "D12:E12",
//            "F11:I11", "F12:G12", "H12:I12",
//            "J11:M11", "J12:K12", "L12:M12",
//            "N11:Q11", "N12:O12", "P12:Q12",
//            "B13:C13", "D13:E13", "F13:G13", "H13:I13", "J13:K13", "L13:M13", "N13:O13", "P13:Q13",
//            "B14:C14", "D14:E14", "F14:G14", "H14:I14", "J14:K14", "L14:M14", "N14:O14", "P14:Q14",
//            "B15:C15", "D15:E15", "F15:G15", "H15:I15", "J15:K15", "L15:M15", "N15:O15", "P15:Q15",
//            "B16:C16", "D16:E16", "F16:G16", "H16:I16", "J16:K16", "L16:M16", "N16:O16", "P16:Q16",
//            "B17:C17", "D17:E17", "F17:G17", "H17:I17", "J17:K17", "L17:M17", "N17:O17", "P17:Q17",
//            "B18:C18", "D18:E18", "F18:G18", "H18:I18", "J18:K18", "L18:M18", "N18:O18", "P18:Q18",
//            "B19:C19", "D19:E19", "F19:G19", "H19:I19", "J19:K19", "L19:M19", "N19:O19", "P19:Q19",
//            "B20:C20", "D20:E20", "F20:G20", "H20:I20", "J20:K20", "L20:M20", "N20:O20", "P20:Q20",
//            "B21:C21", "D21:E21", "F21:G21", "H21:I21", "J21:K21", "L21:M21", "N21:O21", "P21:Q21",
//            "B22:C22", "D22:E22", "F22:G22", "H22:I22", "J22:K22", "L22:M22", "N22:O22", "P22:Q22",
//            "B23:C23", "D23:E23", "F23:G23", "H23:I23", "J23:K23", "L23:M23", "N23:O23", "P23:Q23"
//            //Report 3. 총괄 진행현황
//            //Report 4. 기타사항
//    };
//
//    // 보고서 페이지 요청 처리
//    @GetMapping("report.login")
//    public String reportPage() {
//        return "views/DailyWorkReportPage";
//    }
//
//    // 엑셀 다운로드 요청 처리
//    @GetMapping("downloadExcel.login")
//    public void downloadExcel(HttpServletResponse response) throws IOException {
//        // try-with-resources를 사용하여 워크북 자동 닫기
//        try (Workbook workbook = createWorkbook()) {
//            setupResponse(response, generateFileName());
//            workbook.write(response.getOutputStream());
//        }
//    }
//
//    // 워크북 생성 및 초기 설정
//    private Workbook createWorkbook() {
//        Workbook workbook = new XSSFWorkbook();
//        Sheet sheet = workbook.createSheet(SHEET_NAME);
//        sheet.setDefaultColumnWidth(DEFAULT_COLUMN_WIDTH);
//        sheet.setDefaultRowHeight(DEFAULT_COLUMN_HEIGHT);
//
//        CellStyle centerStyle = createCenterAlignedStyle(workbook);
//        CellStyle leftStyle = createCenterAlignedStyle(workbook);
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(DATE_FORMAT_PATTERN, Locale.KOREAN);
//
//        //Report Creat Start
//
//        //Report Header
//        createTitle(sheet, centerStyle, formatter);
//
//        //Report 1. 배정 현황
//        createAssignmentStatusReport(sheet, leftStyle);
//
//        //Report 2. 알선취업 성과 현황
//        createEmploymentPerformanceReport(sheet, centerStyle);
//
//        //Report 3. 총괄 진행현황
//        createOverallProgressReport(sheet, centerStyle);
//
//        //Report 4. 기타사항
//        createMiscellaneousReport(sheet, centerStyle);
//
//        //Report Creat End
//
//        applyMergesAndBorders(sheet);
//
//        return workbook;
//    }
//
//    // 가운데 정렬 스타일 생성
//    private CellStyle createCenterAlignedStyle(Workbook workbook) {
//        CellStyle style = workbook.createCellStyle();
//        style.setAlignment(HorizontalAlignment.CENTER);
//        style.setVerticalAlignment(VerticalAlignment.CENTER);
//        return style;
//    }
//
//    // 왼쪽 정렬 스타일 생성
//    private CellStyle createLeftAlignedStyle(Workbook workbook) {
//        CellStyle style = workbook.createCellStyle();
//        style.setAlignment(HorizontalAlignment.LEFT);
//        style.setVerticalAlignment(VerticalAlignment.CENTER);
//        return style;
//    }
//
//    // 제목 및 헤더 생성
//    private void createTitle(Sheet sheet, CellStyle style, DateTimeFormatter formatter) {
//        setCellValue(sheet, 0, "A", "지점 국민취업지원제도 업무진행현황 일일보고", style);
//        setCellValue(sheet, 2, "A", LocalDateTime.now().format(formatter), style);
//        setCellValue(sheet, 0, "N", "결\n재", style);
//        setCellValue(sheet, 0, "O", "지점관리자", style);
//        setCellValue(sheet, 0, "P", "대표", style);
//        setCellValue(sheet, 0, "Q", "회장", style);
//    }
//
//    //Report 1. 배정 현황
//    private void createAssignmentStatusReport(Sheet sheet, CellStyle style){
//        setCellValue(sheet,3,"A","1. 배정 현황",style);
//        setCellValue(sheet,4,"A","2024년 총 서비스 대상 인원(전산 배정 인원)",style);
//        setCellValue(sheet,7,"A","합계",style);
//        setCellValue(sheet,8,"A","",style);
//        setCellValue(sheet,7,"C","Ⅱ유형",style);
//        setCellValue(sheet,8,"C","",style);
//        setCellValue(sheet,7,"E","Ⅰ유형",style);
//        setCellValue(sheet,8,"E","",style);
//        setCellValue(sheet,4,"G","금일 배정인원",style);
//        setCellValue(sheet,7,"G","Ⅱ유형",style);
//        setCellValue(sheet,8,"G","",style);
//        setCellValue(sheet,7,"I","Ⅰ유형",style);
//        setCellValue(sheet,8,"I","",style);
//        setCellValue(sheet,4,"K","상담사수",style);
//        setCellValue(sheet,7,"K","",style);
//        setCellValue(sheet,4,"L","평균\n배정인원",style);
//        setCellValue(sheet,7,"L","",style);
//        setCellValue(sheet,4,"O","배정목표",style);
//        setCellValue(sheet,7,"O","100",style);
//    }
//
//    //Report 2. 알선취업 성과 현황
//    private void createEmploymentPerformanceReport(Sheet sheet, CellStyle style){
//        setCellValue(sheet,9,"A","2. 알선취업 성과 현황",style);
//        setCellValue(sheet,10,"A","구분",style);
//        setCellValue(sheet,11,"A","상담사",style);
//        setCellValue(sheet,10,"B","금일 누적 실적",style);
//        setCellValue(sheet,11,"B","일반 취업",style);
//        setCellValue(sheet,11,"D","알선 취업",style);
//        setCellValue(sheet,10,"F","금주 누적 실적",style);
//        setCellValue(sheet,11,"F","일반 취업",style);
//        setCellValue(sheet,11,"H","알선 취업",style);
//        setCellValue(sheet,10,"J","금월 누적 실적",style);
//        setCellValue(sheet,11,"J","일반 취업",style);
//        setCellValue(sheet,11,"L","알선 취업",style);
//        setCellValue(sheet,10,"N","금년 누적 실적",style);
//        setCellValue(sheet,11,"N","일반 취업",style);
//        setCellValue(sheet,11,"P","알선 취업",style);
//        setCellValue(sheet,22,"A","합계",style);
//
//    }
//
//    //Report 3. 총괄 진행현황
//    private void createOverallProgressReport(Sheet sheet, CellStyle style){
//
//    }
//
//    //Report 4. 기타사항
//    private void createMiscellaneousReport(Sheet sheet, CellStyle style){
//
//    }
//
//    // 셀 값 설정 헬퍼 메소드
//    private void setCellValue(Sheet sheet, int rowNum, String colLetter, String value, CellStyle style) {
//        Cell cell = getCell(sheet, rowNum, CellReference.convertColStringToIndex(colLetter));
//        cell.setCellValue(value);
//        cell.setCellStyle(style);
//    }
//
//    // 셀 병합 및 테두리 적용
//    private void applyMergesAndBorders(Sheet sheet) {
//        // 셀 병합 및 테두리 범위에 대한 처리
//        // 셀 병합 적용
//        for (String range : CELL_MERGE_RANGES) {
//                CellRangeAddress rangeAddress = CellRangeAddress.valueOf(range);
//                sheet.addMergedRegion(rangeAddress);
//        }
//
//        // 셀 테두리 적용
//        for (String cell : BORDER_CELLS) {
//            applyBorders(sheet, CellRangeAddress.valueOf(cell));
//        }
//    }
//
//    // 테두리 스타일 적용
//    private void applyBorders(Sheet sheet, CellRangeAddress range) {
//        RegionUtil.setBorderBottom(BorderStyle.THIN, range, sheet);
//        RegionUtil.setBorderTop(BorderStyle.THIN, range, sheet);
//        RegionUtil.setBorderLeft(BorderStyle.THIN, range, sheet);
//        RegionUtil.setBorderRight(BorderStyle.THIN, range, sheet);
//    }
//
//    // 셀 생성 또는 가져오기
//    private Cell getCell(Sheet sheet, int rownum, int cellnum) {
//        Row row = getRow(sheet,rownum);
//
//        Cell cell = row.getCell(cellnum);
//        if (cell == null) {
//            cell = row.createCell(cellnum);
//        }
//        return cell;
//    }
//
//    private Row getRow(Sheet sheet, int rownum) {
//        Row row = sheet.getRow(rownum);
//        if (row == null) {
//            row = sheet.createRow(rownum);
//        }
//        return row;
//    }
//
//    // 파일명 생성
//    private String generateFileName() {
//        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern(DATE_FORMAT_PATTERN, Locale.KOREAN));
//        return URLEncoder.encode(FILE_PREFIX + timestamp + ".xlsx", StandardCharsets.UTF_8)
//                .replaceAll("\\+", "%20");
//    }
//
//    // HTTP 응답 설정
//    private void setupResponse(HttpServletResponse response, String fileName) {
//        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
//        response.setHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\"");
//        response.setHeader("Content-Transfer-Encoding", "binary");
//    }
//}