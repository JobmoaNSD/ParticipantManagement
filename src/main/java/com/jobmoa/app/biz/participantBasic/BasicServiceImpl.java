package com.jobmoa.app.biz.participantBasic;

import com.jobmoa.app.biz.particcertif.ParticcertifDAO;
import com.jobmoa.app.biz.particcertif.ParticcertifDTO;
import com.jobmoa.app.biz.particcertif.ParticcertifService;
import com.jobmoa.app.biz.participantCounsel.CounselDAO;
import com.jobmoa.app.biz.participantCounsel.CounselDTO;
import com.jobmoa.app.biz.participantCounsel.CounselService;
import com.jobmoa.app.biz.participantEducation.EducationDAO;
import com.jobmoa.app.biz.participantEducation.EducationDTO;
import com.jobmoa.app.biz.participantEducation.EducationService;
import com.jobmoa.app.biz.participantEmployment.EmploymentDAO;
import com.jobmoa.app.biz.participantEmployment.EmploymentDTO;
import com.jobmoa.app.biz.participantEmployment.EmploymentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service("basicService")
public class BasicServiceImpl implements BasicService {

    @Autowired
    private BasicDAO basicDAO;

    @Autowired
    private CounselDAO counselDAO;

    @Autowired
    private EmploymentDAO employmentDAO;

    @Autowired
    private ParticcertifDAO particcertifDAO;

    @Autowired
    private EducationDAO educationDAO;

    @Override
    public boolean insert(BasicDTO basicDTO) {
        log.info("basic insert SQL basicDTO : [{}]",basicDTO);
        return basicDAO.insert(basicDTO);
    }


    //신규 참여자 등록 insert
    public boolean insert(BasicDTO basicDTO, CounselDTO counselDTO,
                          EmploymentDTO employmentDTO, ParticcertifDTO particcertifDTO, EducationDTO educationDTO) {
        boolean flag = false;
        if(basicDAO.insert(basicDTO)){
            //기본정보가 문제없이 저장되었다면 JOBNO를 받아 변수에 추가한다.
            basicDTO.setBasicCondition("basicSelectJOBNO");
            int jobno = basicDAO.selectOne(basicDTO).getBasicJobNo();
            //JOBNO를 상담정보, 취업정보, 자격증정보에 각각 추가한다.
            counselDTO.setCounselJobNo(jobno);
            counselDTO.setCounselCondition("counselUpdate");

            employmentDTO.setEmploymentJobNo(jobno);
            employmentDTO.setEmploymentCondition("employmentUpdate");

            particcertifDTO.setParticcertifJobNo(jobno);
            particcertifDTO.setParticcertifCondition("particcertifInsert");

            educationDTO.setEducationJobNo(jobno);
            educationDTO.setEducationCondition("educationInsert");
            //3가지 정보들을 DB 저장한다.
            if(!counselDAO.update(counselDTO)){
                log.error("구직 번호 [{}] 상담 정보 등록 실패", jobno);
                throw new RuntimeException("구직 번호 ["+jobno+"] 상담 정보 등록 실패");
            }
            if(!employmentDAO.update(employmentDTO)){
                log.error("구직 번호 [{}] 취업 정보 등록 실패", jobno);
                throw new RuntimeException("구직 번호 ["+jobno+"] 취업 정보 등록 실패");
            }
            if(!particcertifDAO.insert(particcertifDTO)){
                log.error("구직 번호 [{}] 자격증 정보 등록 실패", jobno);
                throw new RuntimeException("구직 번호 ["+jobno+"] 자격증 정보 등록 실패");
            }
            if(!educationDAO.insert(educationDTO)){
                log.error("구직 번호 [{}] 직업훈련 정보 등록 실패", jobno);
                throw new RuntimeException("구직 번호 ["+jobno+"] 직업훈련 정보 등록 실패");
            }
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean update(BasicDTO basicDTO) {
        log.info("basic update SQL basicDTO : [{}]",basicDTO);
        if(basicDTO == null || basicDTO.getBasicCondition() == null) {
            return false;
        }
        return basicDAO.update(basicDTO);
    }

    @Override
    public boolean delete(BasicDTO basicDTO) {

        return false;
    }

    @Override
    public BasicDTO selectOne(BasicDTO basicDTO) {
        BasicDTO data = null;
        // 기본정보 DTO 가 null 이거나 기본정보의 condition 값이 null 이라면 null을 반환한다.
        if (basicDTO == null || basicDTO.getBasicCondition() == null){
            return data;
        }
        log.info("basic selectOne SQL basicDTO : [{}]",basicDTO);
        //기본 정보 DTO가 있고 condition 값이 있다면 select 를 진행
        data = basicDAO.selectOne(basicDTO);
        return data;
    }

    @Override
    public List<BasicDTO> selectAll(BasicDTO basicDTO) {
        return List.of();
    }
}
