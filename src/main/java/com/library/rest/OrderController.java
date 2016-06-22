package com.library.rest;

import com.library.domain.CustomerOrder;
import com.library.domain.User;
import com.library.service.OrderService;
import com.library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by Matexo on 2016-06-23.
 */
@RestController
@RequestMapping(value = "/api/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "" , method = RequestMethod.GET)
    public ResponseEntity<List<CustomerOrder>> getAllCustomerOrders(@RequestHeader("api-key") String apiKey)
    {
        if(userService.getRole(apiKey).equals("ROLE_ADMIN"))
        {
           return new ResponseEntity<>(orderService.getAllCustomerOrders() , HttpStatus.OK);
        }
        else return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
    }

    @RequestMapping(value = "" , method = RequestMethod.POST)
    public ResponseEntity<CustomerOrder> confirmOrder(@RequestBody CustomerOrder customerOrder, @RequestHeader("api-key") String apiKey)
    {
        User user = null;
        if(apiKey != null)
            user = userService.getUserInfo(apiKey);
        orderService.confirmOrder(customerOrder , user);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
