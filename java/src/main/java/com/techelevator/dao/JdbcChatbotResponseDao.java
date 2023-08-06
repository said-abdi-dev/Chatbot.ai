package com.techelevator.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import com.techelevator.model.ChatbotResponse;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcChatbotResponseDao implements ChatbotResponseDao{

    JdbcTemplate jdbcTemplate;
    private ChatbotResponseDao chatbotResponseDao;
    String userInput = "";

    @Override
    public ChatbotResponse createResponse (String userInput) {
        String sql = "";
        return new ChatbotResponse(userInput);
    };

//    @Override
//    public String getInput(String usersInput) {
//        String sql = "select topics.chatbot_response from topics\n" +
//                "JOIN subjects on subjects.subject_id = topics.subject_id\n" +
//                "WHERE subject_name = ? AND topic_name = ?";
//
//        String sqlSubjectNames = "select subject_name from subjects";
//        String sqlTopicNames = "select topic_name from topics where subject_id = ?";
//
//        List<String> listOfSubjects = new ArrayList<>();
//
//        SqlRowSet rows = jdbcTemplate.queryForRowSet(sqlSubjectNames);
//        //gets our list of subjects
//        while(rows.next()) {
//            String subjectName = rows.getString("subject_name");
//            listOfSubjects.add(subjectName);
//        }
//
//        //iterate through subjects listand see if subject is includes
//        //if not throw an error
//
//        //if true, then store the subject name in a variable
//        //new list for correct responses
//        //get responses topics, except UNIQUE for that specific subject name
//
//
//        //
//
//
//return null;
//    }
}
