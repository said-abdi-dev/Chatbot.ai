package com.techelevator.dao;

import com.techelevator.model.ChatbotResponse;

import java.util.List;

public interface ChatbotResponseDao {
    public String[] getResponseFromInput(ChatbotResponse chatbotResponse);
    public List<String> getSuggestions(String input);
}
