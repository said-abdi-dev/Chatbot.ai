package com.techelevator.dao;

import com.techelevator.model.User;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import javax.xml.crypto.Data;

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
        String result = sut.getResponseFromInput("java array");
        String expected = "In Java, arrays are data structures used to store a collection of elements of the same type. They provide a way to efficiently manage and access multiple values using a single variable. Arrays in Java have a fixed size once they are created, and elements are accessed by their index.";

        Assert.assertEquals(expected,result);

    }

    @Test
    public void getResponseIfSubjectNotFound(){
        String result = sut.getResponseFromInput("array");
        String expected = "Unable to read response. Please enter a more specific subject for the topic of ";

        Assert.assertEquals(expected,result);

    }
    @Test
    public void getResponseForValidSubjectNoTopic(){
        String result = sut.getResponseFromInput("java");
        String expected = "Unable to read response. Please enter a more specific topic for the subject of ";

        Assert.assertEquals(expected,result);

    }
}