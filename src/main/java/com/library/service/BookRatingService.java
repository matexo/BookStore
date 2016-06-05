package com.library.service;

import com.library.domain.BookRating;
import com.library.repository.interfaces.BookRatingRepository;
import com.library.repository.interfaces.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.Calendar;

/**
 * Created by Matexo on 2016-06-05.
 */
@Service
@Transactional
public class BookRatingService {

    @Autowired
    private BookRatingRepository bookRatingRepository;

    @Autowired
    private BookRepository bookRepository;

    public BookRating addRating(BookRating bookRating , Long bookId)
    {
        if(bookRepository.exists(bookId)) {
            BookRating newBookRating = new BookRating();
            newBookRating.setBook(bookRepository.findOne(bookId));
            newBookRating.setRating(bookRating.getRating());
            newBookRating.setComment(bookRating.getComment());
            newBookRating.setNick(bookRating.getNick());
            newBookRating.setRatingDate(new Date(Calendar.getInstance().getTimeInMillis()));
            return bookRatingRepository.save(newBookRating);
        }
        return null;
    }
}
