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

        String [] userInputArr = usersInput.split(" ");

        //gets all subject names
        String sqlSubjectNames = "select subject_name from subjects";
        List<String> listOfSubjects = new ArrayList<>();
        SqlRowSet rows = jdbcTemplate.queryForRowSet(sqlSubjectNames);
        while(rows.next()) {
            String subjectName = rows.getString("subject_name");
            listOfSubjects.add(subjectName);
        }
        //gets all topic names
        String sqlTopicNames = "select topic_name from topics where subject_name = ?";
        List<String> listOfTopics = new ArrayList<>();
        SqlRowSet rows2 = jdbcTemplate.queryForRowSet(sqlTopicNames,userInputArr[0]);
        while(rows2.next()) {
            String topicName = rows2.getString("topic_name");
            listOfTopics.add(topicName);
        }
        if (listOfSubjects.contains(userInputArr[0]) && listOfTopics.contains(userInputArr[1])) {
            String sql = "select topics.chatbot_response from topics\n" +
                    "JOIN subjects on subjects.subject_name = topics.subject_name\n" +
                    "WHERE topics.subject_name = ? AND topic_name = ?";

           return  jdbcTemplate.queryForObject(sql, String.class, userInputArr[0],userInputArr[1]);
        }
        else {
            return "invalid input";
        }
    }



}
