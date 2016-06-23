package com.library;

import com.library.domain.Book;
import com.library.domain.Cart;
import com.library.domain.CartItem;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.math.BigDecimal;


/**
 * Created by Matexo on 2016-06-23.
 */
public class CartTest {

    private Cart cart;
    private Book book;

    @Before
    public void setup() {
        cart = new Cart();
        book = new Book();
        book.setBookId(1L);
        book.setDeleted(false);
        book.setDescription("test");
        book.setYear(1111);
        book.setQuantity(111);
        book.setPages(111);
        book.setTitle("TEST");
        book.setAuthor("TEST");
        book.setUnitPrice(new BigDecimal(1.23));
    }

    @Test
    public void cartAddingTest(){
        cart.addToCart(new CartItem(book));
        cart.addToCart(new CartItem(book));
        cart.addToCart(new CartItem(book));

        Assert.assertEquals(Double.valueOf(book.getUnitPrice().toString()) * 3 , Double.valueOf(cart.getTotalCost().toString()) , 0.01);

    }

    @Test
    public void cartDeletingTest(){
        cart.addToCart(new CartItem(book));
        cart.addToCart(new CartItem(book));
        cart.removeFromCart(new CartItem(book));

        Assert.assertEquals(0.0, Double.valueOf(cart.getTotalCost().toString()) , 0.01);


    }


}

