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

//

    @Override
    public String[] getResponseFromInput(ChatbotResponse chatbotResponse) {

        String[] returnResponseAndContext = new String[3];
        String response = "";

        returnResponseAndContext[1] = chatbotResponse.getSubjectContext();
        returnResponseAndContext[2] = chatbotResponse.getTopicContext();

        //if they're empty, rewrite them for page load.
        if (returnResponseAndContext[1] == "") {
            returnResponseAndContext[1] = "subjectnotfound";
        }
        if (returnResponseAndContext[2] == "") {
            returnResponseAndContext[2] = "topicnotfound";
        }

        //changes the values within the array as desired based on checks
        checkForSubjectAndTopic(chatbotResponse.getSubjectContext(), chatbotResponse.getTopicContext(), chatbotResponse.getUserInput());

        //sets topic to topicNotFound(aka null)
        //SUBJECT not found
        if (returnResponseAndContext[1] == "subjectnotfound") {
            String sql = "SELECT response FROM responses WHERE response_id = (SELECT response_id from topics WHERE subject_name = 'subjectnotfound' LIMIT 1)";
            response = jdbcTemplate.queryForObject(sql,String.class);
        }
        //TOPIC not found, subject found
        else if (returnResponseAndContext[1] != "subjectnotfound" && returnResponseAndContext[2] == "topicnotfound") {
            String sql =  "SELECT response FROM responses WHERE response_id = (SELECT response_id from topics WHERE topic_name = 'topicnotfound' LIMIT 1)";
            response = jdbcTemplate.queryForObject(sql,String.class) + returnResponseAndContext[1];
        }
        else if (returnResponseAndContext[1] == "subjectnotfound" && returnResponseAndContext[2] == "topicnotfound") {
        }
        //TOPIC AND SUBJECT found
        else if (returnResponseAndContext[1] != "" && returnResponseAndContext[2] != "") {
            String sql = "SELECT response FROM responses WHERE response_id = (SELECT response_id FROM topics WHERE subject_name = ? AND topic_name = ?)";
            response =  jdbcTemplate.queryForObject(sql, String.class, returnResponseAndContext[1],returnResponseAndContext[2]);
        }
        else {
            response = "invalid input";
        }
        returnResponseAndContext[0] = response;
        return returnResponseAndContext;
    }

    public String[] checkForSubjectAndTopic(String subjectContext, String topicContext, String userInput) {
        String foundSubject = subjectContext;
        String foundTopic = topicContext;
        int foundTopicsResponseId = -1;

        String[] inputWords = userInput.split("\\s+");

        // Look for subject
        String sqlGetSubjectNames = "SELECT subject_name FROM subjects";
        SqlRowSet rowsOfSubjects = jdbcTemplate.queryForRowSet(sqlGetSubjectNames);

        while (rowsOfSubjects.next()) {
            String currentSubjectName = rowsOfSubjects.getString("subject_name");
            for (String word : inputWords) {
                if (currentSubjectName.equalsIgnoreCase(word)) {
                    foundSubject = currentSubjectName;
                    break;
                } else {
                    foundSubject = "subjectnotfound";
                }
            }
        }

        // Look for topic
        String sqlGetTopicsFromSubject = "SELECT topic_name FROM topics WHERE subject_name = ?";
        SqlRowSet rowsOfTopics = jdbcTemplate.queryForRowSet(sqlGetTopicsFromSubject, foundSubject);

        while (rowsOfTopics.next()) {
            String currentTopicName = rowsOfTopics.getString("topic_name");
            for (String word : inputWords) {
                if (currentTopicName.equalsIgnoreCase(word)) {
                    foundTopic = currentTopicName;
                    String sqlGetFoundTopicId = "SELECT topic_id FROM topics WHERE topic_name = ? AND subject_name = ?";
                    foundTopicsResponseId = jdbcTemplate.queryForObject(sqlGetFoundTopicId, Integer.class, foundTopic, foundSubject);

                    String sqlGetFoundTopicResponseById = "SELECT response_id FROM topics WHERE topic_id = ?";
                    foundTopicsResponseId = jdbcTemplate.queryForObject(sqlGetFoundTopicResponseById, Integer.class, foundTopicsResponseId);

                    break;
                } else {
                    foundTopic = "topicnotfound";
                }
            }
        }
        return new String[]{foundSubject, foundTopic, String.valueOf(foundTopicsResponseId)};
    }
    }