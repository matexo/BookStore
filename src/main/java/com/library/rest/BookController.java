package com.library.rest;

import com.library.domain.Book;
import com.library.domain.BookCategory;
import com.library.service.BookCategoryService;
import com.library.service.BookService;
import com.library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by Matexo on 2016-06-05.
 */
@RestController
@RequestMapping(value = "/api/book")
public class BookController {

    @Autowired
    private BookService bookService;

    @Autowired
    private UserService userService;

    @Autowired
    private BookCategoryService bookCategoryService;

    @RequestMapping(value = "/{bookId}" , method = RequestMethod.GET)
    public ResponseEntity<Book> getBookById(@PathVariable Long bookId)
    {
        Book book = bookService.getBookById(bookId);
        if(book != null) return new ResponseEntity<>(book , HttpStatus.OK);
        else return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @RequestMapping(value = "/all" , method = RequestMethod.GET)
    public ResponseEntity<List<Book>> getAllBooks()
    {
        return new ResponseEntity<>(bookService.getAllBooks() , HttpStatus.OK);
    }

    @RequestMapping(value = "/category/{category}" , method = RequestMethod.GET)
    public ResponseEntity<List<Book>> getBooksByCategory(@PathVariable String category)
    {
        BookCategory bookCategory = bookCategoryService.getBookCategory(category);
        if(bookCategory != null)
            return new ResponseEntity<>(bookService.getBookByCategory(bookCategory) , HttpStatus.OK);
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @RequestMapping(value = "/category/all" , method = RequestMethod.GET)
    public ResponseEntity<List<BookCategory>> getAllCategories()
    {
        return new ResponseEntity<>(bookCategoryService.getAllBookCategory(), HttpStatus.OK);
    }

    @RequestMapping(value = "" , method = RequestMethod.POST)
    public ResponseEntity<Book> addNewBook(@RequestBody Book book , @RequestHeader("api-key") String apiKey)
    {
        if(userService.getRole(apiKey).equals("ROLE_ADMIN")) {
            Book newBook = bookService.addNewBook(book);
            if (newBook != null)
                return new ResponseEntity<>(newBook, HttpStatus.OK);
            else return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        } else return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
    }

    @RequestMapping(value = "/{bookId}" , method = RequestMethod.PUT)
    public ResponseEntity<Long> editBook(@PathVariable Long bookId , @RequestBody Book book , @RequestHeader("api-key") String apiKey)
    {
        if(userService.getRole(apiKey).equals("ROLE_ADMIN")) {
            Long id = bookService.editBook(book, bookId);
            if (id != null) return new ResponseEntity<>(id, HttpStatus.OK);
            else return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } else return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
    }

    @RequestMapping(value = "/{bookId}" , method = RequestMethod.DELETE)
    public ResponseEntity<Long> deleteBook(@PathVariable Long bookId , @RequestHeader("api-key") String apiKey)
    {
        if(userService.getRole(apiKey).equals("ROLE_ADMIN")) {
            Long id = bookService.deleteBook(bookId);
            if (id != null) return new ResponseEntity<>(id, HttpStatus.OK);
            else return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } else return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
    }
}
