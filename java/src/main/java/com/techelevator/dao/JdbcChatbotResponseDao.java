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
            if (userInputNoSpaces.contains(subjectName)){
                foundSubject = subjectName;
                break;
            }
        }
        //gets all topic names for given subject
        String sqlGetTopicsFromSubject = "SELECT topic_name FROM topics WHERE subject_name = ?";
        SqlRowSet rows2 = jdbcTemplate.queryForRowSet(sqlGetTopicsFromSubject,foundSubject);
        String foundTopicName = "";
        int foundTopicId = -1;
        while(rows2.next()) {
            String topicName = rows2.getString("topic_name");
            if (userInputNoSpaces.contains(topicName)){
                foundTopicName = topicName;
                String sqlGetFoundTopicId = "SELECT topic_id FROM topics WHERE topic_name = ? AND subject_name = ?";
                foundTopicId = jdbcTemplate.queryForObject(sqlGetFoundTopicId, Integer.class, foundTopicName, foundSubject);
                break;
            }
        }

        if (foundSubject != "" && foundTopicName != "") {
            String sql = "select response from responses\n" +
                    "WHERE topic_id = ?";
           result =  jdbcTemplate.queryForObject(sql, String.class, foundTopicId);
        }
        else {
           result = "invalid input";
        }
        return result;
    }

}
