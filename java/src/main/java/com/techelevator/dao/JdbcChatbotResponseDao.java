package com.techelevator.dao;

import com.techelevator.model.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import com.techelevator.model.ChatbotResponse;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Component
public class JdbcChatbotResponseDao implements ChatbotResponseDao {

    private JdbcTemplate jdbcTemplate;
    private ChatbotResponseDao chatbotResponseDao;

    public JdbcChatbotResponseDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public String[] getResponseFromInput(ChatbotResponse chatbotResponse) {

        String[] returnResponseAndContext = new String[3];
        String response = "";

        returnResponseAndContext[1] = chatbotResponse.getSubjectContext();
        returnResponseAndContext[2] = chatbotResponse.getTopicContext();


        //changes the values within the array as desired based on checks
        returnResponseAndContext = checkForSubjectAndTopic(chatbotResponse.getSubjectContext(), chatbotResponse.getTopicContext(), chatbotResponse.getUserInput());
    //    [input, subject, topic. response_id]
        chatbotResponse.setSubjectContext(returnResponseAndContext[1]);
        chatbotResponse.setTopicContext(returnResponseAndContext[2]);


        if (!returnResponseAndContext[1].equals("0") && !returnResponseAndContext[2].equals("0")) {
            String sql = "SELECT response FROM responses WHERE response_id = (SELECT response_id FROM topics WHERE subject_name = ? AND topic_name = ?)";

            response =  jdbcTemplate.queryForObject(sql, String.class, returnResponseAndContext[1],returnResponseAndContext[2]);
        } else if (returnResponseAndContext[1].equals("0") && !returnResponseAndContext[2].equals("0") ) {
            response = "I'm sorry, I don't have quite enough information about what you're looking to learn about." +
            "Could you be a little more specific? Or try wording your question in a different way.";
        } else if (!returnResponseAndContext[1].equals("0") && returnResponseAndContext[2].equals("0")) {
            response = "I can see you're asking about " + returnResponseAndContext[1] + ", but could you a little " +
            "more specific what you'd like to know about " + returnResponseAndContext[1] + "?";
        } else {
            response = "We couldn't understand your request. We recommend asking questions about a certain subject, " +
            "and a topic of that subject. Such as 'The definition of JavaScript' or 'What are some features of Vue?'";
        }
        returnResponseAndContext[0] = response;
        return returnResponseAndContext;
    }

    public String[] checkForSubjectAndTopic(String usersSubjectContext, String usersTopicContext, String userInput) {
        String foundSubject = usersSubjectContext; // equal to last return subject, or 0
        String foundTopic = usersTopicContext; // equal to last returned valid topic, or 0

        String[] inputWords = userInput.split("\\s+");

        // Check user input against subjects in the database
        String sqlGetSubjectNames = "SELECT subject_name FROM subjects";
        SqlRowSet rowsOfSubjects = jdbcTemplate.queryForRowSet(sqlGetSubjectNames);

        while (rowsOfSubjects.next()) {
            String currentSubjectName = rowsOfSubjects.getString("subject_name");
            for (String word : inputWords) {
                if (currentSubjectName != null && currentSubjectName.equals(word)) {
                    foundSubject = currentSubjectName;
                    break;
                }
            }

        }

            String sqlGetTopicsFromSubject = "SELECT topic_name, topic_id FROM topics WHERE subject_name = ?";
            SqlRowSet rowsOfTopics = jdbcTemplate.queryForRowSet(sqlGetTopicsFromSubject, foundSubject);


            while (rowsOfTopics.next()) {
                String currentTopicName = rowsOfTopics.getString("topic_name");

                for (String word : inputWords) {
                    if (currentTopicName != null && currentTopicName.equals(word)) {
                        foundTopic = currentTopicName;
                        break;
                    }
                }
        }
        return new String[]{userInput, foundSubject, foundTopic};
    }
}