package com.techelevator.dao;

import com.techelevator.model.ChatbotResponse;
import com.techelevator.model.User;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.util.List;

public class JdbcDaoIntegrationTests extends BaseDaoTests {
    private JdbcChatbotResponseDao sut;

    @Before
    public void setup() {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        sut = new JdbcChatbotResponseDao(jdbcTemplate);
    }

    //TODO: this test doesnt run for whatever reason, but i think its the gerneral syntax
    @Test
    public void getResponseFromInputWorks(){
        ChatbotResponse response = new ChatbotResponse("tell me about java array", "java", "array");
        String[] result = sut.getResponseFromInput(response);

        Assert.assertNotNull(result);
        Assert.assertEquals(3, result.length);
       Assert.assertEquals("In Java, arrays are data structures used to store a collection of elements of the same type. They provide a way to efficiently manage and access multiple values using a single variable. Arrays in Java have a fixed size once they are created, and elements are accessed by their index. To learn more about working with arrays in Java, you can check out this tutorial: <a href=\"https://www.w3schools.com/java/java_arrays.asp\">https://www.w3schools.com/java/java_arrays.asp</a>. Additionally, if you prefer a video explanation, you can watch this YouTube tutorial: <a href=\"https://www.youtube.com/watch?v=2BM7VuASaJI\">https://www.youtube.com/watch?v=2BM7VuASaJI</a>.", result[0]);

    }

    @Test
    public void noContextGiven(){
       ChatbotResponse response = new ChatbotResponse("Tell me about java array", "0", "0");
       String[] result = sut.getResponseFromInput(response);

       Assert.assertNotNull(result);
       Assert.assertEquals(3, result.length);
        Assert.assertEquals("In Java, arrays are data structures used to store a collection of elements of the same type. They provide a way to efficiently manage and access multiple values using a single variable. Arrays in Java have a fixed size once they are created, and elements are accessed by their index. To learn more about working with arrays in Java, you can check out this tutorial: <a href=\"https://www.w3schools.com/java/java_arrays.asp\">https://www.w3schools.com/java/java_arrays.asp</a>. Additionally, if you prefer a video explanation, you can watch this YouTube tutorial: <a href=\"https://www.youtube.com/watch?v=2BM7VuASaJI\">https://www.youtube.com/watch?v=2BM7VuASaJI</a>.", result[0]);
    }
     /*

     Test for a valid subject but not a valid topic, skipped over due to the logic not built to support

    @Test
    public void validSubjectNotAValidTopic() {
        ChatbotResponse response = new ChatbotResponse("Tell me about java array", "java", "0");
        String[] result = sut.getResponseFromInput(response);

        Assert.assertNotNull(result);
        Assert.assertEquals(3, result.length);
        Assert.assertEquals("", result[0]);
    }

      */

    @Test
    public void validTopicNotSubject() {
        ChatbotResponse response = new ChatbotResponse("Tell me about array", "0", "array");
        String[] result = sut.getResponseFromInput(response);

        Assert.assertNotNull(result);
        Assert.assertEquals(3, result.length);
        Assert.assertEquals("We couldn't understand your request. We recommend asking questions about a certain subject, and a topic of that subject. Such as 'The definition of JavaScript' or 'What are some features of Vue?", result[0]);
    }

    @Test
    public void getSuggestionsTest(){
       ChatbotResponse response = new ChatbotResponse("java", "0", "0");
        List<String> result = sut.getSuggestions(response.getUserInput());

        Assert.assertNotNull(result);
        Assert.assertEquals(3, result.size());
    }
}