package com.jobmoa.app.jobPlacement.view.jobPlacement;

import com.jobmoa.app.CounselMain.biz.bean.PaginationBean;
import com.jobmoa.app.jobPlacement.biz.jobPlacement.JobPlacementDTO;
import com.jobmoa.app.jobPlacement.biz.jobPlacement.JobPlacementService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Slf4j
@Controller
public class JobPlacementController {

    @Autowired
    private JobPlacementService jobPlacementService;

    // 추후 참여자에게 작성을 할 수 있기에 주석 처리
/*    @GetMapping("/placementMain")
    public String jobPlacementMainPage(){
        log.info("jobPlacementMainPage 메서드 호출됨");

        String viewPage = "jobPlacementView/participant";
        log.info("jobPlacementMainPage 반환할 뷰 이름: {}", viewPage);

        return viewPage;
    }    */

    @GetMapping("/")
    public String jobPlacementIndexPage(){
        log.info("jobPlacementIndexPage 메서드 호출됨");

        String viewPage = "redirect:/jobPlacement/placementList";
        log.info("jobPlacementIndexPage 반환할 뷰 이름: {}", viewPage);

        return viewPage;
    }

    @GetMapping("/placementList")
    public String jobPlacementListPage(Model model, JobPlacementDTO jobPlacementDTO, PaginationBean paginationBean) {
        log.info("jobPlacementListPage Start");

        //사용자가 선택한 페이지 수가 없다면 기본 페이지 1 고정
        int page = jobPlacementDTO.getPage() <= 0 ? 1 : jobPlacementDTO.getPage();
        log.info("jobPlacementListPage page : [{}]", page);

        //사용자가 볼 게시글의 개수 0이라면 10 고정
        int pageRows = jobPlacementDTO.getPageRows() <= 0 ? 10 : jobPlacementDTO.getPageRows();
        log.info("jobPlacementListPage pageRows : [{}]", pageRows);

        // 사용자에게 보여질 버튼 개수
        int limitButton = 10;

        boolean isFilter = false;
        //검색 필터 사용 여부 체크
        String searchType = jobPlacementDTO.getSearchType();
        int ageStartFilter = jobPlacementDTO.getAgeStartFilter();
        int ageEndFilter = jobPlacementDTO.getAgeEndFilter();
        int desiredSalaryStartFilter = jobPlacementDTO.getDesiredSalaryStartFilter();
        int desiredSalaryEndFilter = jobPlacementDTO.getDesiredSalaryEndFilter();
        String genderFilter = jobPlacementDTO.getGenderFilter();

        //나이 필터, 희망 연봉 필터, 성별 필터가 비어 있지 않다면 필터 사용으로 간주한다.
        if(ageStartFilter != 0 || ageEndFilter != 0 || desiredSalaryStartFilter != 0 || desiredSalaryEndFilter != 0 || genderFilter != null || searchType != null){
            searchType = searchType.trim();
            searchType = searchType.replaceAll("[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9\\s]", "");

            isFilter = true;
            log.info("jobPlacementListPage isFilter : [{}]", isFilter);
            log.info("jobPlacementListPage ageStartFilter : [{}]", ageStartFilter);
            log.info("jobPlacementListPage ageEndFilter : [{}]", ageEndFilter);
            log.info("jobPlacementListPage desiredSalaryStartFilter : [{}]", desiredSalaryStartFilter);
            log.info("jobPlacementListPage desiredSalaryEndFilter : [{}]", desiredSalaryEndFilter);
            log.info("jobPlacementListPage genderFilter : [{}]", genderFilter);
            log.info("jobPlacementListPage searchType : [{}]", searchType);
        }
        jobPlacementDTO.setFilterFlag(isFilter);

        //글 개수 쿼리 컨디션
        jobPlacementDTO.setCondition("selectExternalCount");

        // 게시글 개수
        JobPlacementDTO jobPlacementTotalCountDTO = jobPlacementService.selectOne(jobPlacementDTO);

        if(jobPlacementTotalCountDTO != null){
            int totalCount = jobPlacementTotalCountDTO.getTotalCount();
            log.info("ParticipantManagement totalCount : [{}]", totalCount);

            paginationBean.paginationProject(page,pageRows,limitButton,totalCount);
            // -------------------------페이지네이션 끝------------------------------
            // 한 페이지에 보여줄 데이터를 출력하기 위해 OFFSET PAGEROWS 를 추가
            jobPlacementDTO.setStartPage(paginationBean.getStartPage());
            jobPlacementDTO.setEndPage(paginationBean.getEndPage());
            jobPlacementDTO.setPageRows(pageRows);


            // DB(J_참여자관리)로부터 참여자 목록 조회
            jobPlacementDTO.setCondition("selectExternalAll");
            List<JobPlacementDTO> jobPlacementDatas = jobPlacementService.selectAll(jobPlacementDTO);

            // ParticipantDTO에서 이름 설정
            for (JobPlacementDTO p : jobPlacementDatas) {
                String originalName = p.getParticipant(); // 참여자 이름 가져오기
                if (originalName != null && !originalName.isEmpty()) {
                    // 첫 글자 제외하고 나머지를 "O"로 변환
                    String maskedName = originalName.charAt(0) + originalName.substring(1).replaceAll(".", "O");
                    p.setParticipant(maskedName); // 이름 업데이트
                }
            }

            // JSP로 데이터 전달
            model.addAttribute("jobPlacementDatas", jobPlacementDatas);

        }
        // 현재 페이지
        model.addAttribute("page", page);
        // 시작 버튼
        model.addAttribute("startButton", paginationBean.getStartButton());
        // 끝 버튼
        model.addAttribute("endButton", paginationBean.getEndButton());
        // 실제 버튼 개수
        model.addAttribute("totalButton", paginationBean.getTotalButton());
        log.info("jobPlacementListPage End");

        log.info("jobPlacementListPage 메서드 호출됨");

        String viewPage = "jobPlacementView/company-list";
        log.info("jobPlacementListPage 반환할 뷰 이름: {}", viewPage);

        return viewPage;
    }

    @GetMapping("/placementDetail")
    public String jobPlacementDetailPage(Model model, JobPlacementDTO jobPlacementDTO){
        log.info("jobPlacementDetailPage 메서드 호출됨");

        jobPlacementDTO.setCondition("selectExternalDetail");

        JobPlacementDTO data = jobPlacementService.selectOne(jobPlacementDTO);

        String originalName = data.getParticipant();

        if (originalName != null && !originalName.isEmpty()) {
            // 첫 글자 제외하고 나머지를 "O"로 변환
            String maskedName = originalName.charAt(0) + originalName.substring(1).replaceAll(".", "O");
            data.setParticipant(maskedName); // 이름 업데이트
        }


        model.addAttribute("data", data);

        String viewPage = "jobPlacementView/company-detail";
        log.info("jobPlacementDetailPage 반환할 뷰 이름: {}", viewPage);
        return viewPage;
    }
}