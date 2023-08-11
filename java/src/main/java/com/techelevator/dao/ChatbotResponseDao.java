package com.techelevator.dao;

import com.techelevator.model.ChatbotResponse;

public interface ChatbotResponseDao {
//    String getInput(String usersInput);

    //  public ChatbotResponse createResponse();

    public String[] getResponseFromInput(ChatbotResponse chatbotResponse);
}
