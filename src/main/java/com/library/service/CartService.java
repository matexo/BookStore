package com.library.service;

import com.library.domain.Cart;
import com.library.domain.CartItem;
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
public class CartService {

    @Autowired
    private CartRepostitory cartRepostitory;

    public Cart addNewCart(Cart cart) {
        return cartRepostitory.save(cart);
    }

    public Cart getCart(String clientId)
    {
        if(cartRepostitory.exists(clientId))
            return cartRepostitory.findOne(clientId);
        else return null;
    }

    public String deleteCart(String clientId)
    {
        if(cartRepostitory.exists(clientId))
            {
            cartRepostitory.delete(clientId);
            return clientId;
            }
        else return null;
    }

    public Cart updateCart(Cart cart)
    {
        return cartRepostitory.save(cart);
    }





}
