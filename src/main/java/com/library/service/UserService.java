package com.library.service;

import com.library.domain.QUser;
import com.library.domain.Role;
import com.library.domain.User;
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
        newUser.setActivationTimeStamp(new Timestamp(DataUtil.currentTimeInMillis));
        newUser.setActivated(false);
        newUser.setApiKey(null);
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
            if(user.getActivationTimeStamp().after(new Date(System.currentTimeMillis() - Token.activationTokenTime)))
            {
                user.setActivated(true);
                user.setToken(null);
                userRepository.save(user);
                return true;
            }
            else {
                user.setToken(Token.generateToken());
                user.setActivationTimeStamp(new Timestamp(System.currentTimeMillis()));
                userRepository.save(user);
                //wyslac email z nowym
                return false;
            }
        }
        return false;
    }

    public Optional<User> loginUser(String login , String password ) {
        User user = userRepository.findOne(QUser.user.username.eq(login)
                .and(QUser.user.password.eq(password))
                .and(QUser.user.activated.eq(true)));
        if (user != null)
            {
            user.setApiKey(Token.generateToken());
            userRepository.save(user);
            }
        return Optional.of(user);
    }

    public Optional<User> logout(String apiKey)
    {
        if(apiKey == null) return Optional.of(null);
        User user = userRepository.findOne(QUser.user.apiKey.eq(apiKey));
        if(user != null)
        {
            user.setApiKey(null);
            userRepository.save(user);
        }
        return Optional.of(user);
    }

    public String getRole(String apiKey)
    {
        if(apiKey == null) return "ROLE_ANO";
        User user = userRepository.findOne(QUser.user.apiKey.eq(apiKey));
        if(user != null)
            return user.getRole().getRole();
        else return "ROLE_ANO";
    }

    public User getUserInfo(String apiKey) {
        User user = null;
        if(apiKey != null) {
            user = userRepository.findOne(QUser.user.apiKey.eq(apiKey));
        }
        return user;
    }

    //do testow
    public User getUser()
    {
        return userRepository.findOne(new Long(1));
    }
}
