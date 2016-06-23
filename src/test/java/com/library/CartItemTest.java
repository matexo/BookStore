package com.library;

import com.library.domain.Book;
import com.library.domain.CartItem;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.math.BigDecimal;

/**
 * Created by Matexo on 2016-06-23.
 */
public class CartItemTest {

    private CartItem cartItem;

    @Before
    public void setup() {
        cartItem = new CartItem();
    }

    @Test
    public void singleItemTest(){
        Book book = new Book();
        book.setDeleted(false);
        book.setDescription("test");
        book.setYear(1111);
        book.setQuantity(111);
        book.setPages(111);
        book.setTitle("TEST");
        book.setAuthor("TEST");
        book.setUnitPrice(new BigDecimal(1.23));
        cartItem = new CartItem(book);
        BigDecimal totalPrice = cartItem.getTotalPrice();
        Assert.assertEquals(Double.valueOf(totalPrice.toString())  , Double.valueOf(book.getUnitPrice().toString()), 0.01);
    }
}