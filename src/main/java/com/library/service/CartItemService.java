package com.library.service;

import com.library.repository.interfaces.CartItemRepository;
import com.library.repository.interfaces.CartRepostitory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Matexo on 2016-06-05.
 */
@Service
@Transactional
public class CartItemService {

    @Autowired
    private CartItemRepository cartItemRepository;

    @Autowired
    private CartRepostitory cartRepostitory;

}
