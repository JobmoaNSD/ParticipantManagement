package com.jobmoa.app.view.participant;

import com.jobmoa.app.biz.bean.LoginBean;
import com.jobmoa.app.biz.particcertif.ParticcertifDTO;
import com.jobmoa.app.biz.particcertif.ParticcertifService;
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
public class UpdateController {
    @Autowired
    private BasicService basicService;

    @Autowired
    private CounselService counselService;

    @Autowired
    private EmploymentService employmentService;

    @Autowired
    private ParticcertifService particcertifService;

    //Page Moves
    @GetMapping("/updatebasic.login")
    public String updateBasicPage(Model model, HttpSession session, BasicDTO basicDTO, ParticcertifDTO particcertifDTO){
        //session내에 있는 로그인 정보를 불러온다.
        LoginBean loginBean = (LoginBean)session.getAttribute("JOBMOA_LOGIN_DATA");
        //condition을 추가하여 sql문을 확인할 수 있도록한다.
        basicDTO.setBasicCondition("basicSelectPKONE");
        log.info("loginBean : [{}]", loginBean); // login 정보 로그
        // 로그인 정보에 있는 사용자 아이디를 추가
        basicDTO.setBasicUserid(loginBean.getMemberUserID());
        // 구직번호와 맞는 기본정보 하나를 받아온다.
        basicDTO = basicService.selectOne(basicDTO);
        log.info("basicDTO : [{}]", basicDTO);

        //받아온 기본 정보의 jobno(구직번호)를 particcertif에 추가한다.
        int jobno = basicDTO.getBasicJobNo();
        //검색할 DB를 확인하기 위해 condition 값을 추가.
        particcertifDTO.setParticcertifCondition("particcertifSelectALLParticOne");
        particcertifDTO.setParticcertifJobNo(jobno);

        //구직번호를 추가한 자격증 데이터를 불러오고
        List<ParticcertifDTO> datas = particcertifService.selectAll(particcertifDTO);
        log.info("datas : [{}]", datas);
        log.info("particcertifDTO : [{}]", particcertifDTO);
        //자격증을 JSON배열로 변경하여 전달
        String particcertifArr = "[";
        //datas 가 null 이 아니거나 size가 0 이상이면 반복문을 실행
        if(datas != null || !datas.isEmpty()){
            //반복문을 돌려서 자격증을 하나씩 꺼낸다.
            for(ParticcertifDTO dto : datas){
                //꺼내온 자격증을 Json형식으로 만들어 저장한다.
                particcertifArr += "{\"particcertifPartNo\":\"" + dto.getParticcertifPartNo() + "\""
                        +",\"particcertif\":\"" + dto.getParticcertifCertif()+ "\""
                        + "},";
            }
            //마지막 ,는 필요없기 때문에 제외하고 ]를 닫는다.
            int lastIndex = particcertifArr.lastIndexOf(",");
            if (lastIndex != -1) {
                particcertifArr = particcertifArr.substring(0, lastIndex);
            }
            log.info("particcertifArr : [{}]", particcertifArr);
        }
        particcertifArr += "]";

        //기본 정보와 자격증 정보를 전달한다.
        model.addAttribute("basic", basicDTO);
        model.addAttribute("particcertifs", particcertifArr);

        return "views/UpdateBasicPage";
    }

    @GetMapping("/updatecounsel.login")
    public String updateCounselPage(Model model, CounselDTO counselDTO){
        //상담 정보를 불러온다.
        counselDTO.setCounselCondition("counselSelectOne");
        counselDTO = counselService.selectOne(counselDTO);
        log.info("counselDTO : [{}]", counselDTO);

        //불러온 상담 정보를 전달한다.
        model.addAttribute("counsel", counselDTO);
        return "views/UpdateCounselPage";
    }

    @GetMapping("/updateemployment.login")
    public String updateEmploymentPage(Model model, EmploymentDTO employmentDTO, CounselDTO counselDTO){
        //취업 정보를 불러온다.
        employmentDTO.setEmploymentCondition("employmentSelectOne");
        employmentDTO = employmentService.selectOne(employmentDTO);
        log.info("updateEmploymentPage employmentDTO : [{}]", employmentDTO);

        //상담정보에서 진행단계를 불러오기 위해 counselDTO 에서 jobno(구직번호)로 검색
        counselDTO.setCounselCondition("counselSelectOneEmployment");
        counselDTO.setCounselJobNo(employmentDTO.getEmploymentJobNo());
        counselDTO = counselService.selectOne(counselDTO);
        //DTO 확인용 로그
        log.info("updateEmploymentPage counselDTO : [{}]", counselDTO);
        //만약 counselDTO 가 null 이라면 "" 공백
        //아니라면 counselProgress 를 반환
        String counselProgress = counselDTO == null ? "" : counselDTO.getCounselProgress();

        //취업 정보를 전달한다.
        model.addAttribute("employment", employmentDTO);
        //상담 정보의 참여 유형도 전달
        model.addAttribute("counselProgress", counselProgress);
        return "views/UpdateEmploymentPage";
    }


    //update Mappings
    @PostMapping("/updatebasic.login")
    public String update(Model model, HttpSession session, BasicDTO basicDTO, ParticcertifDTO particcertifDTO){
        //업데이트 여부에 따라 페이지가 다르기 때문에 각 변수를 선언
        String url = "updatebasic.login";
        String icon = "seuccess";
        String title = "";
        String message = "";
        int jobNo = getJobNo(basicDTO.getBasicJobNo(), basicDTO, session);

        //구직번호가 없다면 오류를 반환하고 조회페이지로 반환
        log.info("기본정보 jobNo : [{}]", jobNo);
        if(jobNo <= 0){
            url = "participant.login";
            icon = "error";
            title = "구직번호를 찾을 수 없습니다.";
            message = "";
            infoModel(model, url, icon, title, message);
            return "views/info";
        }

        boolean basicFlag = basicService.update(basicDTO);
        log.info("basicUpdate basicFlag : [{}]", basicFlag);

        //자격증 확인용 flag
        boolean particcertifFlag = false;

        //삭제전 구직번호를 추가해준다.
        particcertifDTO.setParticcertifJobNo(jobNo);

        //자격증을 추가하기전에 삭제를 진행한다.(service 파트에서 이뤄질 예정)
        particcertifFlag = particcertifService.insert(particcertifDTO);

        log.info("basicUpdate particcertifFlag : [{}]", particcertifFlag);

        url = "participant.login";
        icon = "success";
        title = "변경 완료";
        message = "수정이 완료되었습니다.";

        if(!basicFlag){
            url += "updatebasic.login?basicJobNo="+jobNo;
            icon = "error";
            title = "기본정보 업데이트 실패";
            message = "기본정보 등록중 문제가 발생했습니다.";
        }
        else if(!particcertifFlag){
            url += "?basicJobNo="+jobNo;
            icon = "error";
            title = "자격증 추가 실패";
            message = "자격증 등록중 문제가 발생했습니다.";
        }

        //확인용 로그
        infoModel(model, url, icon, title, message);

        return "views/info";
    }

    @PostMapping("/updatecounsel.login")
    public String update(Model model, HttpSession session, BasicDTO basicDTO, CounselDTO counselDTO){
        //info 페이지로 넘길 변수 선언
        String url = "updatecounsel.login";
        String icon = "";
        String title = "";
        String message = "";

        boolean flag = false;

        //확인을 위해 상담정보의 구직번호를 따로 받는다.
        int counselJobNo = counselDTO.getCounselJobNo();
        int counselCounselNo = counselDTO.getCounselCounselNo();
        //상담번호가 0이 아니라면 구직번호 여부를 확인한다.
        if(counselCounselNo > 0){
            //받은 로그인 정보를 토대로 기본정보에서 구직번호가 있는지 확인한다.
            //상담정보의 구직번호와 검색한 구직번호가 0보다 크다면 업데이트를 진행
            if (getJobNo(counselJobNo, basicDTO, session) > 0 && counselJobNo > 0) {
                //상담정보 업데이트로 데이터를 전달하고
                counselDTO.setCounselCondition("counselUpdate");
                flag = counselService.update(counselDTO);
            }

            url = "participant.login";
            icon = "success";
            title = "상담정보 변경 완료";

            if(!flag){
                url += "?counselJobNo="+counselJobNo;
                icon = "error";
                title = "상담정보 변경 실패";

            }
        }
        //만약 상담번호가 0이라면 신규 상담으로 확인하여 상담정보에 추가한다.
        else if(counselCounselNo <= 0){
            url = "participant.login";
            icon = "success";
            title = "상담정보 추가 완료";
            if(!counselService.insert(counselDTO)){
                url += "?counselJobNo="+counselJobNo;
                icon = "error";
                title = "상담정보 추가 실패";
            }
        }

        infoModel(model, url, icon, title, message);

        return "views/info";
    }

    @PostMapping("/updateemployment.login")
    public String update(Model model, HttpSession session, BasicDTO basicDTO, EmploymentDTO employmentDTO, CounselDTO counselDTO){
        //info 페이지로 넘길 변수 선언
        String url = "updateemployment.login";
        String icon = "";
        String title = "";
        String message = "";

        boolean flag = false;

        int employmentEnployNo = employmentDTO.getEmploymentEnployNo();
        int employmentJobNo = employmentDTO.getEmploymentJobNo();
        int jobNo = getJobNo(employmentJobNo, basicDTO, session);

        //취업번호가 0보다 크다면 업데이트
        if(employmentEnployNo > 0){
            //검색된 구직번호가 0보다 크다면 취업정보의 업데이트를 진행한다.
            if(jobNo > 0){
                flag = employmentService.update(employmentDTO);
            }

            url = "participant.login";
            icon = "success";
            title = "취업정보 수정 완료";

            if(!flag){
                url += "?employmentEnployNo="+employmentEnployNo;
                icon = "error";
                title = "취업정보 수정 실패";
            }
            counselDTO.setCounselJobNo(jobNo);
            counselDTO.setCounselCondition("counselUpdateProgress");
            counselService.update(counselDTO);
        }
        //취업번호가 0보다 작거나 같다면 신규 등록
        else if(employmentEnployNo <= 0){
            //취업번호가 없다면 신규 등록으로 추가를 진행한다.
            url = "participant.login";
            icon = "success";
            title = "취업정보 추가 완료";
            if(!employmentService.insert(employmentDTO)){
                url += "?employmentEnployNo="+employmentJobNo;
                icon = "error";
                title = "취업정보 추가 실패";
            }
        }

        infoModel(model, url, icon, title, message);

        return "views/info";
    }

    private int getJobNo(int jobNo, BasicDTO basicDTO, HttpSession session){
        LoginBean loginBean = (LoginBean)session.getAttribute("JOBMOA_LOGIN_DATA");
        String loginId = loginBean.getMemberUserID();
        log.info("getJobNo loginId : [{}]", loginId);
        //받은 로그인 정보를 토대로 기본정보에서 구직번호가 있는지 확인한다.
        basicDTO.setBasicCondition("basicSelectOneJOBNO");
        basicDTO.setBasicJobNo(jobNo);
        basicDTO.setBasicUserid(loginId);
        basicDTO = basicService.selectOne(basicDTO);

        if(basicDTO != null){
            jobNo = basicDTO.getBasicJobNo();
        }
        log.info("getJobNo jobNo : [{}]", jobNo);
        return jobNo;
    }

    private void infoModel(Model model, String url, String icon, String title, String message){
        log.info("infoModel url : [{}]", url);
        log.info("infoModel icon : [{}]", icon);
        log.info("infoModel title : [{}]", title);
        log.info("infoModel message : [{}]", message);
        model.addAttribute("url", url);
        model.addAttribute("icon", icon);
        model.addAttribute("title", title);
        model.addAttribute("message", message);
    }

}
