package com.jobmoa.app.view.chatBot;

import lombok.Data;

@Data
public class ChatRequest {
    private String userMessage;
    private String threadId;
    private String assistantsId;
    private String runId;

}
