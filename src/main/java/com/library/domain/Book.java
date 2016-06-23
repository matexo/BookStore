package com.library.domain;

/**
 * Created by Matexo on 2016-06-05.
 */

import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;


@Entity
@Table
public class Book implements Serializable {
    private static final long serialVersionUID = 5157318323931383307L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="book_id")
    private Long bookId;

    @Size(min = 1, max = 60)
    @NotNull
    private String title;

    @Size(min = 1, max = 1024)
    @NotNull
    private String description;

    @Size(min = 1, max = 30)
    private String author;

    @Min((long) 0.1)
    @Digits(integer = 6, fraction = 2)
    private BigDecimal unitPrice;

    @NotNull
    @Min(0)
    private int quantity;

    @Min(0)
    private int pages;

    private int year;

    @NotNull
    private boolean deleted = false;

    @ManyToMany
    @JoinTable(
            name="book_to_category",
            joinColumns=@JoinColumn(name="book", referencedColumnName="book_id"),
            inverseJoinColumns=@JoinColumn(name="category", referencedColumnName="book_category_id"))
    private List<BookCategory> bookCategory;

    @OneToMany(mappedBy = "book")
    private List<BookRating> bookRatingList;

    public Long getBookId() {
        return bookId;
    }

    public void setBookId(Long bookId) {
        this.bookId = bookId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    public List<BookCategory> getBookCategory() {
        return bookCategory;
    }

    public void setBookCategory(List<BookCategory> bookCategory) {
        this.bookCategory = bookCategory;
    }

    public List<BookRating> getBookRatingList() {
        return bookRatingList;
    }

    public void setBookRatingList(List<BookRating> bookRatingList) {
        this.bookRatingList = bookRatingList;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Book book = (Book) o;

        if (!title.equals(book.title)) return false;
        return author.equals(book.author);

    }

    @Override
    public int hashCode() {
        int result = title.hashCode();
        result = 31 * result + author.hashCode();
        return result;
    }
}
