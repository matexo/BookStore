package com.library.repository.interfaces;

import com.library.domain.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.stereotype.Repository;

/**
 * Created by Matexo on 2016-06-13.
 */
@Repository
public interface RoleRepository extends JpaRepository<Role, Long>, QueryDslPredicateExecutor<Role> {
}
