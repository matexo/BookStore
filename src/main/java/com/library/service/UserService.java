package com.library.service;

import com.library.domain.QUser;
import com.library.domain.Role;
import com.library.domain.User;
import com.library.repository.interfaces.RoleRepository;
import com.library.repository.interfaces.UserRepository;
import com.library.util.DataUtil;
import com.library.util.Token;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Optional;

/**
 * Created by Matexo on 2016-06-13.
 */
@Service
@Transactional
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private EmailService emailService;

    public Optional<User> addNewUser(User user)
    {
        User newUser = new User();
        newUser.setUsername(user.getUsername());
        newUser.setEmail(user.getEmail());
        newUser.setPassword(user.getPassword());
        newUser.setToken(Token.generateToken());
        newUser.setTimestampCounter(new Timestamp(DataUtil.currentTimeInMillis));
        newUser.setActivated(false);
        Role role = new Role();
        role.setRole("ROLE_USER");
        role.setUser(newUser);
        newUser.setRole(role);
        newUser = userRepository.save(newUser); // co robic jak nie stworzy(taki sam email)
        emailService.sendEmail("matexo15@gmail.com", "TEST" , "TEST");
        return Optional.of(newUser);
    }

    public boolean activateAccount(String token)
    {
        User user = userRepository.findOne(QUser.user.token.eq(token));
        if(user != null)
        {
            if(user.getTimestampCounter().after(new Date(System.currentTimeMillis() - Token.activationTokenTime)))
            {
                user.setActivated(true);
                user.setToken(null);
                userRepository.save(user);
                return true;
            }
            else {
                user.setToken(Token.generateToken());
                user.setTimestampCounter(new Timestamp(System.currentTimeMillis()));
                userRepository.save(user);
                //wyslac email z nowym
                return false;
            }
        }
        return false;
    }

    //do testow
    public User getUser()
    {
        return userRepository.findOne(new Long(1));
    }
}
