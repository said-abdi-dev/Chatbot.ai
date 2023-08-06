package com.techelevator.dao;

import com.techelevator.model.ChatbotResponse;

public interface ChatbotResponseDao {
//    String getInput(String usersInput);

    ChatbotResponse createResponse(String userInput);
}
