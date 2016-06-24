package com.library.service;

import com.google.common.collect.Lists;
import com.library.domain.*;
import com.library.repository.interfaces.*;
import com.library.util.DataUtil;
import com.library.util.Token;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.List;
import java.util.Map;
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

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private EmailService emailService;

    public List<CustomerOrder> getAllCustomerOrders() {
        return customerOrderRepository.findAll();
    }

    public Optional<CustomerOrder> confirmOrder(CustomerOrder customerOrder, User user) {
        CustomerOrder newCustomerOrder = null;
        Cart cart = cartRepostitory.findOne(customerOrder.getCart().getCartId());
        if (cart != null) {
            countQuantity(cart.getCartItems());
            cart.addToCart(new CartItem(getShippingMethod(customerOrder.getShippingMethod())));
            String GUID = Token.generateGUID();
            cart = cartRepostitory.save(copyCart(cart,GUID));

            CustomerInfo customerInfo = customerOrder.getCustomerInfo();
            if (user != null)
                customerInfo.setEmail(user.getEmail());
            customerInfo = customerInfoRepository.save(customerInfo);
            newCustomerOrder = createOrder(user, customerOrder, cart, GUID, customerInfo);
            newCustomerOrder = customerOrderRepository.save(newCustomerOrder);
            cartRepostitory.delete(customerOrder.getCart().getCartId());
            emailService.sendEmail(customerInfo.getEmail() , "Zamówienie" ,
                    emailService.getConfirmationOfOrderText(newCustomerOrder.getOrderNumber(),newCustomerOrder.getCart().getTotalCost().toString()));
        }
        return Optional.of(newCustomerOrder);
    }

    private CustomerOrder createOrder(User user, CustomerOrder customerOrderDTO, Cart cart, String GUID, CustomerInfo customerInfo) {
        CustomerOrder customerOrder = new CustomerOrder();
        customerOrder.setShippingMethod(customerOrderDTO.getShippingMethod());
        customerOrder.setCart(cart);
        customerOrder.setDate(new Date(DataUtil.currentTimeInMillis));
        customerOrder.setOrderNumber(GUID);
        customerOrder.setPaid(false);
        customerOrder.setShipped(false);
        customerOrder.setTrackingNumber(null);
        customerOrder.setUser(user);
        customerOrder.setCustomerInfo(customerInfo);
        return customerOrder;
    }

    public CustomerInfo test() {
        return customerInfoRepository.findOne(new Long(1));
    }

    private Book getShippingMethod(String shippingMethodName) {
        Book book = bookRepository.findOne(QBook.book.description.eq(shippingMethodName));
        if(book != null) return book;
        else return bookRepository.findOne(1L);
    }

    private void countQuantity(Map<Long,CartItem> cartItems)
    {
        for (CartItem value : cartItems.values()) {
            int quantity = value.getBook().getQuantity();
            value.getBook().setQuantity(quantity - value.getQuantity());
        }
    }

    private Cart copyCart(Cart cart , String GUID)
    {
        Cart newCart = new Cart();
        newCart.setCartId(GUID);
        newCart.setCartItems(cart.getCartItems());
        newCart.setTotalCost(cart.getTotalCost());
        return newCart;
    }

    public CustomerOrder getCustomerOrder(String orderNumber)
    {
        return customerOrderRepository.findOne(QCustomerOrder.customerOrder.orderNumber.eq(orderNumber));
    }

    public Optional<List<CustomerOrder>> getCustomerOrderForUser(String apiKey)
    {
        if(apiKey != null)
        {
        return Optional.of(Lists.newArrayList(customerOrderRepository.findAll(QCustomerOrder.customerOrder.user.apiKey.eq(apiKey))));
        }
        return Optional.of(null);
    }
}
