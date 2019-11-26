package com.jia.dao;

import com.jia.eneity.AdminUser;
import com.jia.utils.DBTools;
import lombok.SneakyThrows;
import org.apache.commons.dbutils.handlers.BeanHandler;



public class AdminUserDao {

    @SneakyThrows
    public AdminUser findAdminLongin(String username, String password) {
        String sql="select * from admin_user where username=? and password=?";
        return DBTools.getQr().query(sql,new BeanHandler<>(AdminUser.class),username,password);
    }
}
