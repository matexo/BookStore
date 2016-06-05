package com.library.rest;

import com.library.domain.BookRating;
import com.library.service.BookRatingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Matexo on 2016-06-05.
 */
@RestController
@RequestMapping(value = "/api/rating")
public class BookRatingController{

@Autowired
private BookRatingService bookRatingService;

    @RequestMapping(value = "/{bookId}")
    public ResponseEntity<BookRating> addRatingToBook(@RequestBody BookRating bookRating , @PathVariable Long bookId){
    BookRating newBookRating = bookRatingService.addRating(bookRating, bookId);
        if(newBookRating != null) return new ResponseEntity<>(newBookRating , HttpStatus.OK);
        else return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
}
