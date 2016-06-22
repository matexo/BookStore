package com.library.repository.interfaces;

import com.library.domain.CustomerInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.stereotype.Repository;

/**
 * Created by Matexo on 2016-06-23.
 */
@Repository
public interface CustomerInfoRepository extends JpaRepository<CustomerInfo, Long> , QueryDslPredicateExecutor<CustomerInfo>{
}
