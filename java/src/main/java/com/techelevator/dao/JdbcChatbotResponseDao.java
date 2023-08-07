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

        String userInputNoSpaces = usersInput.replace(" ","");

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
        String sqlGetTopicsFromSubject = "select topic_name from topics where subject_name = ?";
        SqlRowSet rows2 = jdbcTemplate.queryForRowSet(sqlGetTopicsFromSubject,foundSubject);
        String foundTopic = "";
        while(rows2.next()) {
            String topicName = rows2.getString("topic_name");
            if (userInputNoSpaces.contains(topicName)){
                foundTopic = topicName;
                break;
            }
        }

        if (foundSubject != "" && foundTopic != "") {
            String sql = "select topics.chatbot_response from topics\n" +
                    "JOIN subjects on subjects.subject_name = topics.subject_name\n" +
                    "WHERE topics.subject_name = ? AND topic_name = ?";
           result =  jdbcTemplate.queryForObject(sql, String.class, foundSubject, foundTopic);
        }
        else {
           result = "invalid input";
        }
        return result;
    }



}
