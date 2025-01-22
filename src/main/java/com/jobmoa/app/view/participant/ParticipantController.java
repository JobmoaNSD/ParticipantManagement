package com.jobmoa.app.view.participant;

import com.jobmoa.app.biz.common.LoginBean;
import com.jobmoa.app.biz.common.PaginationBean;
import com.jobmoa.app.biz.participant.ParticipantDTO;
import com.jobmoa.app.biz.participant.ParticipantService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Slf4j
@Controller
public class ParticipantController {

    @Autowired
    private ParticipantService participantService;

    //Page 이동
    @GetMapping("participant.do")
    public String participantPageController(Model model, HttpSession session, LoginBean loginBean, ParticipantDTO participantDTO, PaginationBean paginationBean){
        log.info("-----------------------------------");
        log.info("Start participantController");

        //session 에 있는 로그인 데이터
        loginBean = (LoginBean)session.getAttribute("JOBMOA_LOGIN_DATA");
        String loginId = loginBean.getMemberUserID();

        // -------------------------페이지네이션 시작------------------------------
        //참여자 정보 불러올때 사용하기 위해 전담자 아이디를 불러온다.
        participantDTO.setParticipantUserid(loginId);
        log.info("Login ID : [{}]", loginId);

        // 사용자가 선택한 페이지 수가 없다면 기본 페이지 1 고정
        int page = participantDTO.getPage() <= 0 ? 1 : participantDTO.getPage();
        log.info("participantController page : [{}]", page);

        //사용자가 볼 게시글의 개수 0이라면 10 고정
        int pageRows = participantDTO.getPageRows() <= 0 ? 10 : participantDTO.getPageRows();
        log.info("participantController pageRows : [{}]", pageRows);

        // 사용자에게 보여질 버튼 개수
        int limitButton = 10;

        // 게시글 전체 개수
        int totalCount = participantService.selectOne(participantDTO).getTotalCount();
        log.info("totalCount : [{}]", totalCount);

        paginationBean.paginationProject(page,pageRows,limitButton,totalCount);
        // -------------------------페이지네이션 끝------------------------------
        // 한 페이지에 보여줄 데이터를 출력하기 위해 OFFSET PAGEROWS 를 추가
        participantDTO.setStartPage(paginationBean.getStartPage());
        participantDTO.setEndPage(paginationBean.getEndPage());
        participantDTO.setPageRows(pageRows);

        // 위 정보를 토대로 게시글 받아 온다.
        List<ParticipantDTO> datas = participantService.selectAll(participantDTO);

        model.addAttribute("datas", datas);
        model.addAttribute("page", page);
        // 시작 버튼
        model.addAttribute("startButton", paginationBean.getStartButton());
        // 끝 버튼
        model.addAttribute("endButton", paginationBean.getEndButton());
        // 실제 버튼 개수
        model.addAttribute("totalButton", paginationBean.getTotalButton());

        log.info("End participantController");
        log.info("-----------------------------------");
        return "views/participantMain";
    }

    @GetMapping("newparticipant.do")
    public String newParticipantsController(){

        return "views/NewParticipantsPage";
    }

}
