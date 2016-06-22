package com.library.rest;

import com.library.domain.CustomerMessage;
import com.library.repository.interfaces.CustomerMessageRepository;
import com.library.service.CustomerMessageService;
import com.library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by Matexo on 2016-06-05.
 */
@RestController
@RequestMapping(value = "/api/customerMessage")
public class CustomerMessageController {

    @Autowired
    private CustomerMessageService customerMessageService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "" , method = RequestMethod.GET)
    public ResponseEntity<List<CustomerMessage>> getAllCustomerMessage(@RequestHeader("api-key") String apiKey)
    {
        if(userService.getRole(apiKey).equals("ROLE_ADMIN"))
            return new ResponseEntity<>(customerMessageService.getAllCustomerMessage(),HttpStatus.OK);
        else return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
    }

    @RequestMapping(value = "" , method = RequestMethod.POST)
    public ResponseEntity<CustomerMessage> addCustomerMessage(@RequestBody CustomerMessage customerMessage)
    {
        CustomerMessage newCustomerMessage = customerMessageService.addCustomerMessage(customerMessage);
        if(customerMessage != null) return new ResponseEntity<>(newCustomerMessage, HttpStatus.OK);
        else return new ResponseEntity<CustomerMessage>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
