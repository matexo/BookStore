package com.library.rest;

import com.library.domain.CustomerMessage;
import com.library.repository.interfaces.CustomerMessageRepository;
import com.library.service.CustomerMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by Matexo on 2016-06-05.
 */
@RestController
@RequestMapping(value = "/api/customerMessage")
public class CustomerMessageController {

    @Autowired
    private CustomerMessageService customerMessageService;

    //weryfikacja admina
    @RequestMapping(value = "" , method = RequestMethod.GET)
    public List<CustomerMessage> getAllCustomerMessage()
    {
        return customerMessageService.getAllCustomerMessage();
    }

    @RequestMapping(value = "" , method = RequestMethod.POST)
    public ResponseEntity<CustomerMessage> addCustomerMessage(@RequestBody CustomerMessage customerMessage)
    {
        CustomerMessage newCustomerMessage = customerMessageService.addCustomerMessage(customerMessage);
        if(customerMessage != null) return new ResponseEntity<>(newCustomerMessage, HttpStatus.OK);
        else return new ResponseEntity<CustomerMessage>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
