package com.jobmoa.app.jobPlacement.view.async;

import com.jobmoa.app.jobPlacement.biz.jobPlacement.JobPlacementDTO;
import com.jobmoa.app.jobPlacement.biz.jobPlacement.JobPlacementService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.sql.SQLException;

@Slf4j
@RestController
public class JobPlacementResumeEmailRequestAsync {

    @Autowired
    private JobPlacementService jobPlacementService;

    @PostMapping(value = "/resumeRequest", produces = "application/json;charset=UTF-8")
    public ResponseEntity<String> resumeRequestAsync(@RequestBody JobPlacementDTO jobPlacementDTO) {
        log.info("JobPlacementResumeEmailRequestAsync resumeRequestAsync Start");
        log.info("JobPlacementResumeEmailRequestAsync resumeRequestAsync jobPlacementDTO : [{}]",jobPlacementDTO);
        jobPlacementDTO.setCondition("resumeRequestInsertAsync");

        String responseJson = "{\"statusData\":\"%s\",\"message\":\"%s\"}";

        try{
            boolean flag = jobPlacementService.insert(jobPlacementDTO);
            if(!flag) {
                responseJson = String.format(responseJson,"error","이력서 요청중 오류가 발생했습니다.");
                throw new SQLException(responseJson);
            }

            responseJson = String.format(responseJson,"success","이력서 요청이 완료되었습니다. 상담사 확인 후 메일 발송되실겁니다.");
            log.info("JobPlacementResumeEmailRequestAsync resumeRequestAsync responseJson : [{}]",responseJson);
            log.info("JobPlacementResumeEmailRequestAsync resumeRequestAsync End");
            return ResponseEntity.status(200).body(responseJson);
        }
        catch(SQLException e){
            log.error("JobPlacementResumeEmailRequestAsync resumeRequestAsync SQLException Error : {}",e.getMessage());
            responseJson = String.format(responseJson,"error","이력서 요청 실패. 서버 문제로 이력서 요청에 실패했습니다.");
            return ResponseEntity.status(400).body(responseJson);
        }
        catch(Exception e){
            log.error("JobPlacementResumeEmailRequestAsync resumeRequestAsync Exception Error : {}",e.getMessage());
            responseJson = String.format(responseJson,"error","이력서 요청 실패. 서버 요청에 문제가 발생했습니다.");
            return ResponseEntity.status(500).body(responseJson);
        }
    }
}
