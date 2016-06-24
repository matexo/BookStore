package com.library.rest;

import com.library.domain.User;
import com.library.dto.LoginDTO;
import com.library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * Created by Matexo on 2016-06-22.
 */
@RestController
@RequestMapping(value = "api/")
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public ResponseEntity<User> login(@RequestBody LoginDTO loginDTO)
    {
    return userService.loginUser(loginDTO.getLogin() , loginDTO.getPassword())
            .map(user -> new ResponseEntity<>(user , HttpStatus.OK))
            .orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @RequestMapping(value = "logout" , method = RequestMethod.GET)
    public ResponseEntity logout(@RequestHeader("api-key") String apiKey )
    {
        return userService.logout(apiKey)
                .map(user -> new ResponseEntity(HttpStatus.OK))
                .orElse(new ResponseEntity(HttpStatus.NOT_FOUND));
    }

}
