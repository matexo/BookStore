package com.library.repository.interfaces;

import com.library.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.stereotype.Repository;

/**
 * Created by Matexo on 2016-06-13.
 */
@Repository
public interface UserRepository extends JpaRepository<User, Long> , QueryDslPredicateExecutor<User> {
}
