package com.library.service;

import com.google.common.collect.Lists;
import com.library.domain.Book;
import com.library.domain.BookCategory;
import com.library.domain.QBook;
import com.library.repository.interfaces.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Matexo on 2016-06-05.
 */
@Service
@Transactional
public class BookService {

    @Autowired
    private BookRepository bookRepository;

    public List<Book> getAllBooks()
    {
        return Lists.newArrayList(bookRepository.findAll(QBook.book.deleted.eq(false)));
    }

    public List<Book> getBookByCategory(BookCategory bookCategory)
    {
        return Lists.newArrayList(bookRepository.findAll(
                QBook.book.bookCategory.contains(bookCategory)
                        .and(QBook.book.deleted.eq(false))));
    }

    public Book getBookById(Long id) {
        return bookRepository.findOne(id);
    }

    //bez id
    public Book addNewBook(Book book)
    {
        return bookRepository.save(book);
    }

    //wymaga podania id
    public Long editBook(Book book , Long id) {
        if ( bookRepository.exists(id))
            {
                Book bookFromDB = bookRepository.getOne(id);
                bookFromDB.setAuthor(book.getAuthor());
                bookFromDB.setDescription(book.getDescription());
                bookFromDB.setPages(book.getPages());
                bookFromDB.setQuantity(book.getQuantity());
                bookFromDB.setTitle(book.getTitle());
                bookFromDB.setYear(book.getYear());
                return bookRepository.save(bookFromDB).getBookId();
            }
        return null;
    }

    public Long deleteBook(Long id)
    {
        if(bookRepository.exists(id))
        {
            Book bookFromDB = bookRepository.getOne(id);
            bookFromDB.setDeleted(true);
            bookRepository.save(bookFromDB);
            return id;
        }
        return null;
    }
}
