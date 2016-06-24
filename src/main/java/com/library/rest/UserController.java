package com.library.rest;

import com.library.domain.User;
import com.library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * Created by Matexo on 2016-06-13.
 */
@RestController
@RequestMapping(value = "api/user")
public class UserController {


    @Autowired
    private UserService userService;

    @RequestMapping(value = "/addUser" , method = RequestMethod.POST)
    public ResponseEntity<User> addNewUser(@RequestBody User user){
    return userService.addNewUser(user)
            .map(newUser -> new ResponseEntity<>(newUser , HttpStatus.OK))
            .orElse(new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR));
    }

    @RequestMapping(value= "/activate/token/{token}" , method = RequestMethod.GET)
    public ResponseEntity<?> activateAccount(@PathVariable String token)
    {
        return userService.activateAccount(token) ? new ResponseEntity(HttpStatus.OK) : new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @RequestMapping(value = "" , method = RequestMethod.GET)
    public ResponseEntity<User> getUser()
    {
        return new ResponseEntity<>(userService.getUser() , HttpStatus.OK);
    }

}
