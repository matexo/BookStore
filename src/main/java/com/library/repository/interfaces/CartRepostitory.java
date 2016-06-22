package com.library.repository.interfaces;

import com.library.domain.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.stereotype.Repository;

/**
 * Created by Matexo on 2016-06-05.
 */
@Repository
public interface CartRepostitory extends JpaRepository<Cart,String> , QueryDslPredicateExecutor<Cart> {
}
