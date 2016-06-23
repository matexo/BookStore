package com.library.domain;

import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Matexo on 2016-06-05.
 */
@Entity
@Table
public class Cart implements Serializable {
    private static final long serialVersionUID = -6059866759215199201L;

    @Id
    private String cartId;

    @OneToMany(fetch = FetchType.EAGER , cascade = CascadeType.MERGE)
    @JoinColumn(name = "cart_id")
    private Map<Long, CartItem> cartItems;

    @NotNull
    @Min(0)
    private BigDecimal totalCost;

    public Cart()
    {
        cartItems = new HashMap<>();
        totalCost = new BigDecimal(0);
    }

    public Cart(String cartId)
    {
        this();
        this.cartId = cartId;
    }

    public Map<Long, CartItem> getCartItems()
    {
        return cartItems;
    }

    public BigDecimal getTotalCost()
    {
        return totalCost;
    }

    public void addToCart(CartItem newItem)
    {
        Long productId = newItem.getBook().getBookId();
        if (cartItems.containsKey(productId))
        {
            CartItem item = cartItems.get(productId);
            item.setQuantity(item.getQuantity() + newItem.getQuantity());
            cartItems.put(productId, item);
        } else
        {
            cartItems.put(productId, newItem);
        }
        updateTotalCost();
    }

    public void removeFromCart(CartItem cartItem)
    {
        Long id = cartItem.getBook().getBookId();
        cartItems.remove(id);
        updateTotalCost();
    }

    public void setTotalCost(BigDecimal totalCost) {
        this.totalCost = totalCost;
    }

    public void setCartItems(Map<Long, CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public void updateTotalCost()
    {
        totalCost = new BigDecimal(0);

        for (CartItem cartItem : cartItems.values())
        {
            this.totalCost = this.totalCost.add(cartItem.getTotalPrice());
        }
    }

    public String getCartId() {
        return cartId;
    }

    public void setCartId(String cartId) {
        this.cartId = cartId;
    }

}

