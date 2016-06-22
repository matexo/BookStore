package com.library.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * Created by Matexo on 2016-06-05.
 */
@Entity
@Table
public class BookCategory implements Serializable {
    @Id
    @NotNull
    @Size(min = 3 , max = 5)
    @Column(name = "book_category_id")
    private String bookCategoryId;

    @NotNull
    @Size(min = 3 , max = 40)
    private String bookCategory;

    public String getBookCategory() {
        return bookCategory;
    }

    public void setBookCategory(String bookCategory) {
        this.bookCategory = bookCategory;
    }

    public String getBookCategoryId() {
        return bookCategoryId;
    }

    public void setBookCategoryId(String bookCategoryId) {
        this.bookCategoryId = bookCategoryId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BookCategory that = (BookCategory) o;

        return bookCategory.equals(that.bookCategory);

    }

    @Override
    public int hashCode() {
        return bookCategory.hashCode();
    }
}
