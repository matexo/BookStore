package com.library.service;

import com.library.domain.Cart;
import com.library.domain.CustomerInfo;
import com.library.domain.CustomerOrder;
import com.library.domain.User;
import com.library.repository.interfaces.CartRepostitory;
import com.library.repository.interfaces.CustomerInfoRepository;
import com.library.repository.interfaces.CustomerOrderRepository;
import com.library.util.DataUtil;
import com.library.util.Token;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

/**
 * Created by Matexo on 2016-06-23.
 */
@Service
@Transactional
public class OrderService {
    @Autowired
    private CustomerOrderRepository customerOrderRepository;

    @Autowired
    private CartRepostitory cartRepostitory;

    @Autowired
    private CustomerInfoRepository customerInfoRepository;

    public List<CustomerOrder> getAllCustomerOrders()
    {
        return customerOrderRepository.findAll();
    }

    public Optional<CustomerOrder> confirmOrder(CustomerOrder customerOrder , User user)
    {
        //zmienijszyc ilosc produktu z koszyka jak nie ma to wyjebac cos
        CustomerOrder newCustomerOrder = null;
        Cart cart = cartRepostitory.findOne(customerOrder.getCart().getCartId());
        if(cart != null) {
            newCustomerOrder = new CustomerOrder();
            String GUID = Token.generateGUID();
            cart.setCartId(GUID);
            cartRepostitory.save(cart);

            CustomerInfo customerInfo = customerOrder.getCustomerInfo();
            if(user != null)
                customerInfo.setEmail(user.getEmail());
            customerInfo = customerInfoRepository.save(customerInfo);

            createOrder(user, newCustomerOrder, cart, GUID, customerInfo);
            customerOrderRepository.save(newCustomerOrder);
            // wyslac meila
        }
        return Optional.of(newCustomerOrder);
    }

    private void createOrder(User user, CustomerOrder newCustomerOrder, Cart cart, String GUID, CustomerInfo customerInfo) {
        newCustomerOrder.setCart(cart);
        newCustomerOrder.setDate(new Date(DataUtil.currentTimeInMillis));
        newCustomerOrder.setOrderNumber(GUID);
        newCustomerOrder.setPaid(false);
        newCustomerOrder.setShipped(false);
        newCustomerOrder.setTrackingNumber(null);
        newCustomerOrder.setUser(user);
        newCustomerOrder.setCustomerInfo(customerInfo);
    }
}
