package com.jia.dao;

import com.jia.eneity.User;
import com.jia.utils.DBTools;
import lombok.SneakyThrows;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.util.List;

public class UserDao {

    @SneakyThrows
    public User findUserByPhone(String phone){
        String sql="select * from user where phone_number=?";
        return DBTools.getQr().query(sql,new BeanHandler<>(User.class),phone);
    }

    @SneakyThrows
    public int saveUser(User user){
        System.out.println(user.getName());
        String sql="insert into user(name,sex,phone_number,photo,create_time) values(?,?,?,?,?)";
        Object[] objects={user.getName(),user.getSex(),user.getPhone_number(),user.getPhoto(),user.getCreate_time()};
        return DBTools.getQr().update(sql,objects);
    }

    @SneakyThrows
    public List<User> findUserList() {
        String sql="select * from user";
        return DBTools.getQr().query(sql,new BeanListHandler<>(User.class));
    }
}
