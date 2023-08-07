package com.techelevator.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PathVariable;

import com.techelevator.model.ChatbotResponse;
import com.techelevator.dao.ChatbotResponseDao;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = "/")
@CrossOrigin
public class ChatbotResponseController {

    private ChatbotResponseDao chatbotResponseDao;

    public ChatbotResponseController(ChatbotResponseDao chatbotResponseDao ){
        this.chatbotResponseDao = chatbotResponseDao;
    }
    @RequestMapping(path = "{userInput}", method = RequestMethod.GET)
    public ChatbotResponse getChatbotResponse (@PathVariable String userInput ){

        ChatbotResponse chatbotResponse = new ChatbotResponse();
        String chatbotReply = chatbotResponseDao.getResponseFromInput(userInput);

        chatbotResponse.setUserInput(userInput);
        chatbotResponse.setChatbotResponse(chatbotReply);
        return chatbotResponse;
    }

}
