package com.techelevator.controller;

import com.techelevator.dao.ChatbotResponseDao;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = "/")
public class ChatbotResponseController {

    private ChatbotResponseDao chatbotResponseDao;

    public ChatbotResponseController(ChatbotResponseDao chatbotResponseDao ){
        this.chatbotResponseDao = chatbotResponseDao;
    }
    @RequestMapping(path = "{userInput}", method = RequestMethod.GET)

    public  String getChatbotResponse (@PathVariable String userInput ){

        return chatbotResponseDao.getInput(userInput);
    }

}
