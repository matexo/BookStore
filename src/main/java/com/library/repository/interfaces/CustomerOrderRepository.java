package com.library.repository.interfaces;

import com.library.domain.CustomerOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.stereotype.Repository;

/**
 * Created by Matexo on 2016-06-13.
 */
@Repository
public interface CustomerOrderRepository extends JpaRepository<CustomerOrder, Long> , QueryDslPredicateExecutor<CustomerOrder> {
}
