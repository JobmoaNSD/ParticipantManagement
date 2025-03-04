package com.jobmoa.app.view.chatBot;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class ChatBotService {

    @Autowired
    ChatBotFunction chatBotFunction;

    public String getChatGPTResponse(ChatRequest chatRequest) throws Exception {
        createMassage(chatRequest);

        return creatRun(chatRequest);
    }

    private void onModelChat(ChatRequest chatRequest) throws Exception {
        String userMessage = chatRequest.getUserMessage();
        String systemMessage = """
                역할:
                당신은 취업 전문 컨설턴트입니다.
                작성 방법:
                사용자가 제공하는 정보를 바탕으로 K-STAR-K 프레임워크에 맞는 자기소개서를 작성하세요.
                K-STAR-K 구조
                ✅ K(결론): 첫 문장에서 지원 직무와 관련된 경험을 요약하고, 사용자의 강점을 강조하세요.
                ✅ S(상황): 경험이 일어난 배경과 문제 상황을 1~2문장으로 설명하세요.
                ✅ T(과제): 해결해야 했던 문제와 사용자가 맡았던 역할을 1문장으로 작성하세요.
                ✅ A(행동): 문제 해결을 위해 수행한 구체적인 행동을 논리적으로 서술하세요.
                ✅ R(결과): 행동의 결과로 얻은 성과를 수치나 명확한 개선점과 함께 제시하세요.
                ✅ K(가능성): 마지막 문장에서 지원 직무에서 성장 가능성과 기여할 수 있는 점을 언급하세요.
                •	해당 직무에서 요구하는 KPI나 주요 업무를 반영하여, 사용자가 어떻게 기여할 수 있는지를 구체적으로 작성하세요.
                ________________________________________
                입력 정보
                •	자기소개서 문항
                o	자기소개 및 지원 동기
                o	주요 경력 및 프로젝트 경험
                o	기타 필요한 문항
                •	경험의 상세 설명
                o	경험이 일어난 배경과 상황
                o	맡은 역할 및 수행한 행동
                o	문제 해결 과정과 결과
                o	배운 점
                •	경험의 핵심 키워드
                o	이 경험을 대표하는 키워드 3~5개
                •	희망하는 직무
                o	지원하려는 직무명
                o	해당 직무의 주요 업무
                •	글자 수 제한
                o	예: 800자, 1000자 등
                ________________________________________
                추가 요청 사항
                •	사용자의 답변이 부족하거나 모호하면, 더 나은 글을 작성하기 위해 구체적인 질문을 하세요.
                •	가독성이 좋고 자연스럽게 읽히도록 작성하세요.
                •	자기소개서 문항에 맞춰 자연스럽게 연결하여 작성하세요.
                •	'~였습니다' 같은 일본어 번역체 표현은 사용하지 마세요.
                ________________________________________
                이제 사용자가 입력하는 정보를 기반으로 K-STAR-K 자기소개서를 작성하세요.
                """;
        // 요청 JSON 생성
        String requestBodyJson = """
            {
                "model":"gpt-4o",
                "messages":[
                    {"role": "system", "content": "%s"},
                    {"role": "user", "content": "%s"}
                  ]
            }
            """.formatted(systemMessage,userMessage);

        String requestHttp = """
                /chat/completions
                """;

        log.info(" getChatGPTResponse requestBodyJson : [{}]",requestBodyJson);
        chatBotFunction.chatBotRequestJson(requestBodyJson,requestHttp);
    }

    private void createMassage(ChatRequest chatRequest) throws Exception {
        String userMessage = chatRequest.getUserMessage();
        String threadId = chatRequest.getThreadId();

        // 요청 JSON 생성
        String requestBodyJson = """
            {
              "role": "user",
              "content": "%s"
            }
            """.formatted(threadId,userMessage);

        String requestHttp = """
                /threads/%s/messages
                """.formatted(threadId);

        log.info(" createMassage threadId : [{}]",threadId);
        log.info(" createMassage requestBodyJson : [{}]",requestBodyJson);
        chatBotFunction.chatBotRequestJson(requestBodyJson,requestHttp);
    }

    private String creatRun(ChatRequest chatRequest) throws Exception {
        String threadId = chatRequest.getThreadId();
        String assistantsId = chatRequest.getAssistantsId();

        // 요청 JSON 생성
        String requestBodyJson = """
        {
            "assistant_id":"%s"
        }
        """.formatted(assistantsId);

        String requestHttp = """
                /threads/%s/runs
                """.formatted(threadId);

        log.info(" creatRun requestBodyJson : [{}]",requestBodyJson);
        return chatBotFunction.chatBotRequestJson(requestBodyJson,requestHttp);
    }
}
