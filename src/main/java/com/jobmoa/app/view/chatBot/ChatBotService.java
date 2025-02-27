package com.jobmoa.app.view.chatBot;

import lombok.extern.slf4j.Slf4j;
import okhttp3.*;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Value;

@Slf4j
@Service
public class ChatBotService {

    private static final String OPENAI_API_URL = "https://api.openai.com/v1/chat/completions";

    @Value("")//openAI 에서 발급된 API 키 입력
    private String openAiApiKey;

    public String getChatGPTResponse(String userMessage) throws Exception {
        OkHttpClient client = new OkHttpClient();

        log.info("userMessage : [{}]",userMessage);
        log.info("OPENAI_API_URL : [{}]",OPENAI_API_URL);
        log.info("openAiApiKey : [{}]",openAiApiKey);

        // 요청 JSON 생성
        String requestBodyJson = """
            {
              "model": "gpt-4o",
              "messages": [
                {"role": "user", "content": "%s"}
              ]
            }
            """.formatted(userMessage);
        // HTTP 요청 생성
        RequestBody body = RequestBody.create(
                requestBodyJson, MediaType.get("application/json; charset=utf-8")
        );

        Request request = new Request.Builder()
                .url(OPENAI_API_URL)
                .addHeader("Authorization", "Bearer " + openAiApiKey)
                .post(body)
                .build();

        // API 호출 및 응답 처리
        try (Response response = client.newCall(request).execute()) {
            if (!response.isSuccessful()) {
                throw new Exception("Failed: " + response.message());
            }

            return response.body().string(); // 응답 반환
        }
    }

}
