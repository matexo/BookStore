package com.library;

import com.library.service.EmailService;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;


/**
 * Created by Matexo on 2016-06-24.
 */

public class EmailServiceTest {
    private EmailService emailService;

    @Before
    public void setup() {
        emailService = new EmailService();
    }

    @Test
    public void testEmailActivationEmail()
    {
        String result = String.format("Link aktywujacy konto: %suser/activate/%s", EmailService.host , "token");
        Assert.assertEquals( result , emailService.getActivationMessage("token"));
    }

}
