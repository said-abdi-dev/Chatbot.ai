package com.techelevator.dao;

import com.techelevator.model.ChatbotResponse;

public interface ChatbotResponseDao {
    public String[] getResponseFromInput(ChatbotResponse chatbotResponse);
    public String getSuggestions(ChatbotResponse chatbotResponse);
}
