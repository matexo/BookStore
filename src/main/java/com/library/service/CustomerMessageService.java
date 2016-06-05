package com.library.service;

import com.library.domain.CustomerMessage;
import com.library.repository.interfaces.CustomerMessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Matexo on 2016-06-05.
 */
@Service
@Transactional
public class CustomerMessageService {

    @Autowired
    private CustomerMessageRepository customerMessageRepository;

    public CustomerMessage addCustomerMessage(CustomerMessage customerMessage)
    {
        return customerMessageRepository.save(customerMessage);
    }

    public List<CustomerMessage> getAllCustomerMessage()
    {
        return customerMessageRepository.findAll();
    }
}
