package com.library;

import com.library.domain.User;
import org.junit.Assert;
import org.junit.Test;

/**
 * Created by Matexo on 2016-06-24.
 */
public class UserTest {

    @Test
    public void emailTest()
    {
        User user = new User();
        user.setEmail("test");
        user.setUsername("test");

        User user1 = new User();
        user1.setEmail("test");
        user1.setUsername("test");

        Assert.assertTrue(user.equals(user1));
    }
}
