package com.techelevator.model;

public class ChatbotResponse {

    //PRIVATE VARIABLES

    private String[] userInputAndContext;

    private String userInput;
    private String subjectContext;
    private String topicContext;
    private String response;


    //CONSTRUCTORS
    public ChatbotResponse() {
    }

    public ChatbotResponse(String userInput, String subjectContext, String topicContext) {
        this.userInput = userInput;
        this.subjectContext = subjectContext;
        this.topicContext = topicContext;
    }

    //GETTERS & SETTERS
    public String getUserInput() {
        return userInput;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    public void setUserInput(String userInput) {
        this.userInput = userInput;
    }

    public String[] getUserInputAndContext() {
        return userInputAndContext;
    }

    public void setUserInputAndContext(String[] userInputAndContext) {
        this.userInputAndContext = userInputAndContext;
    }

    public String getSubjectContext() {
        return subjectContext;
    }

    public void setSubjectContext(String subjectContext) {
        this.subjectContext = subjectContext;
    }

    public String getTopicContext() {
        return topicContext;
    }

    public void setTopicContext(String topicContext) {
        this.topicContext = topicContext;
    }






}