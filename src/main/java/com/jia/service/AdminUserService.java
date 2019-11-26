package com.jia.service;

import com.jia.dao.AdminUserDao;
import com.jia.eneity.AdminUser;
import lombok.SneakyThrows;


public class AdminUserService {
    private AdminUserDao adminUserDao=new AdminUserDao();

    @SneakyThrows
    public AdminUser findAdminLongin(String username, String password) {
        return adminUserDao.findAdminLongin(username,password);
    }
}
