package com.library.domain;

/**
 * Created by Matexo on 2016-06-05.
 */

import javax.persistence.*;
import javax.persistence.Entity;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.math.BigDecimal;

@Entity
@Table
public class CartItem implements Serializable {

    private static final long serialVersionUID = 4730804232480615672L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long cartItemId;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    @JoinColumn(name = "book_id")
    private Book book;

    @NotNull
    @Min(1)
    private int quantity;

    @NotNull
    @Min(0)
    private BigDecimal totalPrice;

    public CartItem() {}

    public CartItem(Book book)
    {
        this.book = book;
        quantity = 1;
        totalPrice = book.getUnitPrice();
    }

    public Book getBook()
    {
        return book;
    }

    public void setBook(Book book)
    {
        this.book = book;
        this.updateTotalPrice();
    }

    public int getQuantity()
    {
        return quantity;
    }

    public void setQuantity(int quantity)
    {
        this.quantity = quantity;
        this.updateTotalPrice();
    }

    public BigDecimal getTotalPrice()
    {
        return totalPrice;
    }

    private void updateTotalPrice()
    {
        totalPrice = this.book.getUnitPrice().multiply(new BigDecimal(this.quantity));
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CartItem cartItem = (CartItem) o;

        if (quantity != cartItem.quantity) return false;
        if (cartItemId != null ? !cartItemId.equals(cartItem.cartItemId) : cartItem.cartItemId != null) return false;
        if (book != null ? !book.equals(cartItem.book) : cartItem.book != null) return false;
        return totalPrice != null ? totalPrice.equals(cartItem.totalPrice) : cartItem.totalPrice == null;

    }

    @Override
    public int hashCode() {
        int result = cartItemId != null ? cartItemId.hashCode() : 0;
        result = 31 * result + (book != null ? book.hashCode() : 0);
        result = 31 * result + quantity;
        result = 31 * result + (totalPrice != null ? totalPrice.hashCode() : 0);
        return result;
    }
}

