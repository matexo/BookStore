package com.library.util;

import java.util.UUID;

/**
 * Created by Matexo on 2016-06-13.
 */
public class Token {
    public static final Integer activationTokenTime = 1000 * 60 * 30;

    public static String generateToken() { return Long.toHexString(Double.doubleToLongBits(Math.random()));}

    public static String generateGUID() { return UUID.randomUUID().toString(); }
}
