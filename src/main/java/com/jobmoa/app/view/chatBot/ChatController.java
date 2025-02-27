package com.jobmoa.app.view.chatBot;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Slf4j
@Controller
public class ChatController {

    @GetMapping("/chatgpt")
    public String chatBot(){
        return "chatBot/TestChatBot2";
    }

}
