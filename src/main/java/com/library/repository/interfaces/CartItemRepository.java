package com.library.repository.interfaces;

import com.library.domain.CartItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.stereotype.Repository;

/**
 * Created by Matexo on 2016-06-05.
 */
@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Long> , QueryDslPredicateExecutor<CartItem> {
}
