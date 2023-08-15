package com.techelevator.dao;

import com.techelevator.model.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import com.techelevator.model.ChatbotResponse;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Arrays;

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

        // Extract context from chatbotResponse
        String usersSubjectContext = chatbotResponse.getSubjectContext();
        String usersTopicContext = chatbotResponse.getTopicContext();
        String userInput = chatbotResponse.getUserInput();

        // Check for subject and topic
        returnResponseAndContext = checkForSubjectAndTopic(usersSubjectContext, usersTopicContext, userInput);
        String foundSubject = returnResponseAndContext[1];
        String foundTopic = returnResponseAndContext[2];

        // Set updated context in chatbotResponse
        chatbotResponse.setSubjectContext(foundSubject);
        chatbotResponse.setTopicContext(foundTopic);

        // Generate response based on context
        response = generateResponse(foundSubject, foundTopic);

        returnResponseAndContext[0] = response;
        return returnResponseAndContext;
    }

    public String[] checkForSubjectAndTopic(String usersSubjectContext, String usersTopicContext, String userInput) {
        String foundSubject = usersSubjectContext; // Initialize to the last returned subject or "0"
        String foundTopic = usersTopicContext;     // Initialize to the last returned valid topic or "0"

        String lowerCaseUserInput = userInput.toLowerCase();
        String[] inputWords = lowerCaseUserInput.split("\\s+");

        // Check user input against subjects in the database
        String sqlGetSubjectNames = "SELECT subject_name FROM subjects";
        SqlRowSet rowsOfSubjects = jdbcTemplate.queryForRowSet(sqlGetSubjectNames);

        while (rowsOfSubjects.next()) {
            String currentSubjectName = rowsOfSubjects.getString("subject_name");
            if (Arrays.asList(inputWords).contains(currentSubjectName)) {
                foundSubject = currentSubjectName;
                break;
            }
        }

        if (!foundSubject.equals("0")) {
            // Now let's search the topics
            String sqlGetTopicsFromSubject = "SELECT topic_name FROM topics WHERE subject_name = ?";
            SqlRowSet rowsOfTopics = jdbcTemplate.queryForRowSet(sqlGetTopicsFromSubject, foundSubject);

            while (rowsOfTopics.next()) {
                String currentTopicNamePhrase = rowsOfTopics.getString("topic_name");
                String[] arrayOfTopicNameKeywords = currentTopicNamePhrase.split("\\s+");

                boolean allTopicWordsFound = true;
                for (String keyword : arrayOfTopicNameKeywords) {
                    if (!Arrays.asList(inputWords).contains(keyword)) {
                        allTopicWordsFound = false;
                        break;
                    }
                }

                if (allTopicWordsFound) {
                    foundTopic = currentTopicNamePhrase;
                    break;
                }
            }
        }

        return new String[]{userInput, foundSubject, foundTopic};
    }

    public String getSuggestions(ChatbotResponse chatbotResponse) {
        List<String> suggestionsList = new ArrayList<>();

        String sqlSuggestions = "SELECT topic_name, subject_name\n" +
                "FROM topics\n" +
                "WHERE subject_name = ?\n" +
                "LIMIT 3;";

        SqlRowSet rows = jdbcTemplate.queryForRowSet(sqlSuggestions, chatbotResponse.getVariableContext());

        while (rows.next()) {
            String topicName = rows.getString("topic_name");
            suggestionsList.add(topicName); // adding each suggestion to the list
        }
        String suggestions = String.join(" ", suggestionsList); // this Joins the list elements with a space
        return suggestions;
    }
    private String generateResponse(String foundSubject, String foundTopic) {
        String response = "";

        if (!foundSubject.equals("0") && !foundTopic.equals("0")) {
            // Retrieve response from the database
            String sql = "SELECT response FROM responses WHERE response_id = (SELECT response_id FROM topics WHERE subject_name = ? AND topic_name = ?)";
            response = jdbcTemplate.queryForObject(sql, String.class, foundSubject, foundTopic);
        } else if (foundSubject.equals("0") && !foundTopic.equals("0")) {
            response = "I'm sorry, I don't have quite enough information...";
        } else if (!foundSubject.equals("0") && foundTopic.equals("0")) {
            response = "I can see you're asking about " + foundSubject + ", but could you be a little more specific?";
        } else {
            response = "We couldn't understand your request. We recommend asking questions about a certain subject and topic.";
        }
        return response;
    }
}