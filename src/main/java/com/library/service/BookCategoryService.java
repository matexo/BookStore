package com.library.service;

import com.library.domain.BookCategory;
import com.library.repository.interfaces.BookCategoryRepostiory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Matexo on 2016-06-05.
 */
@Service
@Transactional
public class BookCategoryService {

    @Autowired
    private BookCategoryRepostiory bookCategoryRepostiory;

    public BookCategory getBookCategory(String category)
        {
            return bookCategoryRepostiory.findOne(category);
        }

    public List<BookCategory> getAllBookCategory()
    {
        return bookCategoryRepostiory.findAll();
    }
}
