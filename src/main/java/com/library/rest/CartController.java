package com.library.rest;

import com.library.domain.Book;
import com.library.domain.Cart;
import com.library.domain.CartItem;
import com.library.service.BookService;
import com.library.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Matexo on 2016-06-05.
 */
@RestController
@RequestMapping(value="api/cart")
public class CartController {

    @Autowired
    private CartService cartService;

    @Autowired
    private BookService bookService;

    @RequestMapping(value = "" , method = RequestMethod.GET)
    public ResponseEntity<Cart> getCart(HttpServletRequest request)
    {
        String cartId = request.getSession().getId();
        Cart cart = cartService.getCart(cartId);
        if(cart == null)
        {
            cart = new Cart();
            cart.setCartId(cartId);
            cartService.addNewCart(cart);
        }
        if(cart != null)
            return new ResponseEntity<>(cart, HttpStatus.OK);
        else return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<Cart> createCart(@RequestBody Cart cart )
    {
        return new ResponseEntity<>(cartService.addNewCart(cart),HttpStatus.OK);
    }

    @RequestMapping(value = "/book/{bookId}" ,method = RequestMethod.POST)
    public ResponseEntity addBookToCart(@PathVariable Long bookId , HttpServletRequest request)
    {
        String cartId = request.getSession(true).getId();
        Cart cart = cartService.getCart(cartId);
        if(cart == null)
            cart = cartService.addNewCart(new Cart(cartId));
        Book book = bookService.getBookById(bookId);
        if(book != null)
            {
            cart.addToCart(new CartItem(book));
            cartService.updateCart(cart);
            return new ResponseEntity(HttpStatus.OK);
            }
        else return new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @RequestMapping(value = "/book/{bookId}" , method = RequestMethod.DELETE)
    public ResponseEntity removeBookFromCart(@PathVariable Long bookId , HttpServletRequest request)
    {
        String clientId = request.getSession().getId();
        Cart cart = cartService.getCart(clientId);
        if (cart == null)
            cart = cartService.addNewCart(new Cart(clientId));
        Book book = bookService.getBookById(bookId);
        if (book != null)
            {
            cart.removeFromCart(new CartItem(book));
            cartService.updateCart(cart);
            return new ResponseEntity(HttpStatus.OK);
            }
        else return new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @RequestMapping(value = "/api/cart/id" , method = RequestMethod.GET)
    public String getCartId(HttpServletRequest request)
    {
        return request.getSession().getId();
    }

    @RequestMapping(value = "/test" , method = RequestMethod.GET)
    public ResponseEntity<Cart> getCart(){
        return new ResponseEntity<Cart>(cartService.getCart(),HttpStatus.OK);
    }

}
