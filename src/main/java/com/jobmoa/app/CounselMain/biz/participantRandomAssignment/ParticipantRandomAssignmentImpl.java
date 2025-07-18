package com.jobmoa.app.CounselMain.biz.participantRandomAssignment;

import com.jobmoa.app.CounselMain.biz.particcertif.ParticcertifDTO;
import com.jobmoa.app.CounselMain.biz.particcertif.ParticcertifServiceImpl;
import com.jobmoa.app.CounselMain.biz.participantCounsel.CounselDAO;
import com.jobmoa.app.CounselMain.biz.participantCounsel.CounselDTO;
import com.jobmoa.app.CounselMain.biz.participantEducation.EducationDTO;
import com.jobmoa.app.CounselMain.biz.participantEducation.EducationServiceImpl;
import com.jobmoa.app.CounselMain.biz.participantEmployment.EmploymentDAO;
import com.jobmoa.app.CounselMain.biz.participantEmployment.EmploymentDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Slf4j
@Service("praService")
public class ParticipantRandomAssignmentImpl implements ParticipantRandomAssignmentService {

    @Autowired
    private ParticipantRandomAssignmentDAO praDAO;

    @Override
    public boolean insert(ParticipantRandomAssignmentDTO praDTO) {
        log.info("insert SQL ParticipantRandomAssignmentDTO : [{}]",praDTO);
        if(praDTO == null || praDTO.getCondition() == null) {
            return false;
        }
        return praDAO.insert(praDTO);
    }

    @Override
    public boolean update(ParticipantRandomAssignmentDTO praDTO) {
        log.info("update SQL ParticipantRandomAssignmentDTO : [{}]",praDTO);
        if(praDTO == null || praDTO.getCondition() == null) {
            return false;
        }
        return praDAO.update(praDTO);
    }

    @Override
    public boolean delete(ParticipantRandomAssignmentDTO praDTO) {
        log.info("delete SQL ParticipantRandomAssignmentDTO : [{}]",praDTO);
//        if(praDTO == null || praDTO.getCondition() == null) {
//            return false;
//        }
        return false;
    }

    @Override
    public ParticipantRandomAssignmentDTO selectOne(ParticipantRandomAssignmentDTO praDTO) {
        if (praDTO == null || praDTO.getCondition() == null){
            return null;
        }
        return praDAO.selectOne(praDTO);
    }

    @Override
    public List<ParticipantRandomAssignmentDTO> selectAll(ParticipantRandomAssignmentDTO basicDTO) {
        return List.of();
    }
}
