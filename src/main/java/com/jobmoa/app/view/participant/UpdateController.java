package com.jobmoa.app.view.participant;

import com.jobmoa.app.biz.particcertif.ParticcertifDTO;
import com.jobmoa.app.biz.particcertif.ParticcertifService;
import com.jobmoa.app.biz.participant.ParticipantService;
import com.jobmoa.app.biz.participantBasic.BasicDTO;
import com.jobmoa.app.biz.participantBasic.BasicService;
import com.jobmoa.app.biz.participantCounsel.CounselDTO;
import com.jobmoa.app.biz.participantCounsel.CounselService;
import com.jobmoa.app.biz.participantEmployment.EmploymentDTO;
import com.jobmoa.app.biz.participantEmployment.EmploymentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
    public String updateBasicPage(Model model, BasicDTO basicDTO, ParticcertifDTO particcertifDTO){
        //기본 정보를 받아온다.
        basicDTO = basicService.selectOne(basicDTO);
        log.info("basicDTO : [{}]", basicDTO);

        //받아온 기본 정보의 jobno(구직번호)를 particcertif에 추가한다.
        int jobno = particcertifDTO.getParticcertifJobNo();
        particcertifDTO.setParticcertifJobNo(jobno);

        //구직번호를 추가한 자격증 데이터를 불러오고
        particcertifDTO = particcertifService.selectOne(particcertifDTO);
        log.info("particcertifDTO : [{}]", particcertifDTO);

        //기본 정보와 자격증 정보를 전달한다.
        model.addAttribute("basic", basicDTO);

        //다만 자격증 정보의 경우 없으면 전달하지 않는다.
        model.addAttribute("particcertif", particcertifDTO.getParticcertifCertif());

        return "views/UpdateBasicPage";
    }

    @GetMapping("/updatecounsel.login")
    public String updateCounselPage(Model model, CounselDTO counselDTO){
        //상담 정보를 불러온다.
        counselDTO = counselService.selectOne(counselDTO);
        log.info("counselDTO : [{}]", counselDTO);

        //불러온 상담 정보를 전달한다.
        model.addAttribute("counsel", counselDTO);
        return "views/UpdateCounselPage";
    }

    @GetMapping("/updateemployment.login")
    public String updateEmploymentPage(Model model, EmploymentDTO employmentDTO){
        //취업 정보를 불러온다.
        employmentDTO = employmentService.selectOne(employmentDTO);
        log.info("employmentDTO : [{}]", employmentDTO);

        //상담 정보를 전달한다.
        model.addAttribute("employment", employmentDTO);
        return "views/UpdateEmploymentPage";
    }


    //update Mappings
    @PostMapping("/updatebasic.login")
    public String update(Model model, BasicDTO basicDTO, ParticcertifDTO particcertifDTO){
        return "views/UpdateBasicPage";
    }

    @PostMapping("/updatecounsel.login")
    public String update(Model model, CounselDTO counselDTO){
        return "views/UpdateCounselPage";
    }

    @PostMapping("/updateemployment.login")
    public String update(Model model, EmploymentDTO employmentDTO){
        return "views/UpdateEmploymentPage";
    }

}
