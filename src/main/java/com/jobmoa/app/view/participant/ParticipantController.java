package com.jobmoa.app.view.participant;

import com.jobmoa.app.biz.bean.LoginBean;
import com.jobmoa.app.biz.bean.PaginationBean;
import com.jobmoa.app.biz.particcertif.ParticcertifDTO;
import com.jobmoa.app.biz.particcertif.ParticcertifService;
import com.jobmoa.app.biz.participant.ParticipantDTO;
import com.jobmoa.app.biz.participant.ParticipantService;
import com.jobmoa.app.biz.participantBasic.BasicDTO;
import com.jobmoa.app.biz.participantBasic.BasicService;
import com.jobmoa.app.biz.participantCounsel.CounselDTO;
import com.jobmoa.app.biz.participantCounsel.CounselService;
import com.jobmoa.app.biz.participantEmployment.EmploymentDTO;
import com.jobmoa.app.biz.participantEmployment.EmploymentService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Slf4j
@Controller
public class ParticipantController {

    @Autowired
    private ParticipantService participantService;

    @Autowired
    private BasicService basicService;

    @Autowired
    private CounselService counselService;

    @Autowired
    private EmploymentService employmentService;

    @Autowired
    private ParticcertifService particcertifService;

    //Page 이동
    @GetMapping("participant.login")
    public String participantPageController(Model model, HttpSession session, ParticipantDTO participantDTO, PaginationBean paginationBean){
        log.info("-----------------------------------");
        log.info("Start participantController");

        //session 에 있는 로그인 데이터
        LoginBean loginBean = (LoginBean)session.getAttribute("JOBMOA_LOGIN_DATA");
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

    @GetMapping("newparticipant.login")
    public String newParticipantsController(){
        return "views/NewParticipantsPage";
    }

    @PostMapping("newParticipantsInsert.login")
    public String newParticipantsController(Model model, HttpSession session,
                                            BasicDTO basicDTO, CounselDTO counselDTO, EmploymentDTO employmentDTO, ParticcertifDTO particcertifDTO){
        log.info("-----------------------------------");
        log.info("Start newParticipantsInsertController");
        String url = "participant.login";
        String icon = "error";
        String title = "참여자 등록 실패";
        String message = "";

        //넘어올 정보는 기본정보, 상담정보, 취업정보, 자격증정보
        //session에서 로그인 정보를 불어온다.
        LoginBean loginBean = (LoginBean)session.getAttribute("JOBMOA_LOGIN_DATA");
        //불러온 정보(ID,지점)을 변수에 추가한다.
        String loginId = loginBean.getMemberUserID();
        String loginBranch = loginBean.getMemberBranch();
        log.info("loginId, loginBranch: [{}], [{}]", loginId,loginBranch);
        // 각 로그인 정보는 기본정보에 담아준다.
        basicDTO.setBasicUserid(loginId);
        basicDTO.setBasicBranch(loginBranch);

        //기본정보는 참여자가 비어 있지 않다면 DAO로 바로 넘겨준다.
        if(basicDTO != null && basicDTO.getBasicPartic() != null){
            //기본정보의 저장에 문제가 있다면 False 를 반환 받아 나머지 정보는 저장되지 않게 한다.
            if(basicService.insert(basicDTO) == false){
                log.error("basicService insert error");
                message = "기본정보 등록에 실패하였습니다.";
                log.error(message);
                return "views/info";
            }

            //기본정보가 문제없이 저장되었다면 JOBNO를 받아 변수에 추가한다.
            int jobno = basicService.selectOne(basicDTO).getBasicJobNo();
            //JOBNO를 상담정보, 취업정보, 자격증정보에 각각 추가한다.
            counselDTO.setCounselJobNo(jobno);
            employmentDTO.setEmploymentJobNo(jobno);
            particcertifDTO.setParticcertifJobNo(jobno);
            //3가지 정보들을 DB 저장한다.
        }


        log.info("-----------------------------------");
        return "views/info";
    }

}
