package com.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Matexo on 2016-06-12.
 */
@Controller
@RequestMapping(value = "")
public class Home {

    @RequestMapping(value = "" , method = RequestMethod.GET)
    public String getHomePage()
    {
        return "home";
    }
}
