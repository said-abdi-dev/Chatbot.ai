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

        Assert.assertTrue(result != ""|| result != null);
    }
}