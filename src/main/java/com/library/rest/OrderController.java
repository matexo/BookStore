package com.library.rest;

import com.library.domain.CustomerInfo;
import com.library.domain.CustomerOrder;
import com.library.domain.User;
import com.library.service.OrderService;
import com.library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping(value = "/all" , method = RequestMethod.GET)
    public ResponseEntity<List<CustomerOrder>> getAllCustomerOrders(@RequestHeader("apiKey") String apiKey)
    {
        if(userService.getRole(apiKey).equals("ROLE_ADMIN"))
        {
           return new ResponseEntity<>(orderService.getAllCustomerOrders() , HttpStatus.OK);
        }
        else return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
    }

    @RequestMapping(value = "/{orderNumber}" , method = RequestMethod.GET)
    public ResponseEntity<CustomerOrder> getCustomerOrderForId(@PathVariable String orderNumber)
    {
    CustomerOrder customerOrder = orderService.getCustomerOrder(orderNumber);
    if(customerOrder != null)
    {
        return new ResponseEntity<CustomerOrder>(customerOrder,HttpStatus.OK);
    }
        else return new ResponseEntity<CustomerOrder>(HttpStatus.NOT_FOUND);
    }

    @RequestMapping(value = "/user" , method = RequestMethod.GET)
    public ResponseEntity<List<CustomerOrder>> getCustomerOrderForUser(@RequestHeader("apiKey") String apiKey)
    {
        return orderService.getCustomerOrderForUser(apiKey)
                .map(customerOrders -> new ResponseEntity<>(customerOrders,HttpStatus.OK))
                .orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @RequestMapping(value = "" , method = RequestMethod.POST)
    public ResponseEntity<CustomerOrder> confirmOrder(@RequestBody CustomerOrder customerOrder, @RequestHeader HttpHeaders headers)
    {
        String apiKey = headers.get("apikey").get(0);
        User user = null;
        if(apiKey != null)
            user = userService.getUserInfo(apiKey);
        return orderService.confirmOrder(customerOrder , user)
                .map(newCustomerOrder -> new ResponseEntity<>(newCustomerOrder , HttpStatus.OK))
                .orElse(new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR));
    }

    @RequestMapping(value = "test" , method = RequestMethod.GET)
    public ResponseEntity<CustomerInfo> test()
    {
        return new ResponseEntity<CustomerInfo>(orderService.test(),HttpStatus.OK);
    }


}
