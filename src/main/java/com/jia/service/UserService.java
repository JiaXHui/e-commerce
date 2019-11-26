package com.jia.service;

import com.jia.dao.UserDao;
import com.jia.eneity.User;
import lombok.SneakyThrows;

import java.util.List;



public class UserService {
    private UserDao userDao=new UserDao();
    public User findUserByPhone(String phone){
        return userDao.findUserByPhone(phone);
    }

    @SneakyThrows
    public int saveUser(User user){
        return userDao.saveUser(user);
    }


    @SneakyThrows
    public List<User> findUserList() {
        return userDao.findUserList();
    }
}
