package com.jobmoa.app.view.chatBot;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class chatAjax {

    @Autowired
    private ChatBotService chatBotService;//chatGPT 요청 객체

    @PostMapping("/api")
    public ResponseEntity<String> chat(@RequestBody ChatRequest request) {
        log.info("userMessage : [{}]",request);
        try {
            // OpenAI API에 요청을 전달하고 응답받기
            String response = chatBotService.getChatGPTResponse(request);
            // JSON 파싱을 위한 객체
            ObjectMapper objectMapper = new ObjectMapper();
            //받은 데이터를 objectMapper JSON 배열로 반환
            JsonNode root = objectMapper.readTree(response);
            //반환받은 데이터의 choices 0(첫번째) 배열을 가져오고 해당 배열중 message 값에 본문만 출력
//            response = root.get("choices").get(0).get("message").get("content").asText();
//            response = root.get("choices").get(0).get("message").toString();
            response = root.get("instructions").toString();
            log.info("response : [{}]",response);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            log.error("Error: {}", e.getMessage());
            return ResponseEntity.status(500).body("Error: " + e.getMessage());
        }
    }
}
