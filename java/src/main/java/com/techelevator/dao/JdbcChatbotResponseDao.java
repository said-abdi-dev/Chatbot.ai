package com.techelevator.dao;

import com.techelevator.model.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import com.techelevator.model.ChatbotResponse;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcChatbotResponseDao implements ChatbotResponseDao{

    private JdbcTemplate jdbcTemplate;
    private ChatbotResponseDao chatbotResponseDao;

    public JdbcChatbotResponseDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public String getResponseFromInput(String usersInput) {
        String result = "";

        String userInputNoSpaces = usersInput.toLowerCase().replace(" ","");

        //gets all subject names
        String sqlGetSubjectNames = "SELECT subject_name FROM subjects";
        SqlRowSet rows = jdbcTemplate.queryForRowSet(sqlGetSubjectNames);
        String foundSubject = "";
        //check if subject exists in usersInput

        while(rows.next()) {

            String subjectName = rows.getString("subject_name");
            if (userInputNoSpaces.contains(subjectName)) {
                if (subjectName.length() > foundSubject.length()) {
                    foundSubject = subjectName;
                String subjectName = rows.getString("subject_name");
                if (userInputNoSpaces.contains(subjectName)) {
                    if (subjectName.length() > foundSubject.length()) {
                        foundSubject = subjectName;
                    }
                }

            }
        }
        if (foundSubject == "") {
            foundSubject = "subjectnotfound";
        }
        //gets all topic names for given subject
        String sqlGetTopicsFromSubject = "SELECT topic_name FROM topics WHERE subject_name = ?";
        SqlRowSet rows2 = jdbcTemplate.queryForRowSet(sqlGetTopicsFromSubject,foundSubject);
        String foundTopicName = "";
        int foundTopicId = -1;
        while(rows2.next()) {
            String topicName = rows2.getString("topic_name");
            if (userInputNoSpaces.contains(topicName)){
                if(topicName.length() > foundTopicName.length()) {
                    foundTopicName = topicName;
                    String sqlGetFoundTopicId = "SELECT topic_id FROM topics WHERE topic_name = ? AND subject_name = ?";
                    foundTopicId = jdbcTemplate.queryForObject(sqlGetFoundTopicId, Integer.class, foundTopicName, foundSubject);
                }
            }
        }
        //sets topic to topicNotFound(aka null)
        if (foundTopicName == "") {
            foundTopicName = "topicnotfound";
        }
        //SUBJECT not found
        if (foundSubject == "subjectnotfound") {
            String sql = "SELECT response from responses WHERE response_id = (SELECT response_id from topics WHERE subject_name = 'subjectnotfound' LIMIT 1)";
            result = jdbcTemplate.queryForObject(sql,String.class);
        }
        //TOPIC not found, subject found
        else if (foundSubject != "subjectnotfound" && foundTopicName == "topicnotfound") {
           String sql =  "SELECT response from responses WHERE response_id = (SELECT response_id from topics WHERE topic_name = 'topicnotfound' LIMIT 1)";
           result = jdbcTemplate.queryForObject(sql,String.class) + foundSubject;
        }
        else if (foundSubject == "subjectnotfound" && foundTopicName == "topicnotfound") {

        if (foundSubject != "" && foundTopicName != "") {
            String sql = "select response from responses\n" +
                    "WHERE topic_id = ?";
            result =  jdbcTemplate.queryForObject(sql, String.class, foundTopicId);
        }
        //TOPIC AND SUBJECT found
        else if (foundSubject != "" && foundTopicName != "") {
            String sql = "SELECT response FROM responses WHERE response_id = (SELECT response_id FROM topics WHERE subject_name = ? AND topic_name = ?)";
           result =  jdbcTemplate.queryForObject(sql, String.class, foundSubject,foundTopicName);
>>>>>>> de28bcc564390dd3faa075a4aac4dfa1a7161594
        }
        else {
            result = "invalid input";
        }
        return result;
    }

}