package com.techelevator.model;

public class ChatbotResponse {

    private String chatbotResponse;

    //PRIVATE VARIABLES
    private String userInput;

    //CONSTRUCTORS
    public ChatbotResponse() {
    }

    public ChatbotResponse(String userInput) {
        this.userInput = userInput;
    }

    //GETTERS & SETTERS
    public String getUserInput() {
        return userInput;
    }


    public void setUserInput(String userInput) {
        this.userInput = userInput;
    }

    public String getChatbotResponse() {
        return chatbotResponse;
    }

    public void setChatbotResponse(String chatbotResponse) {
        this.chatbotResponse = chatbotResponse;
    }
}