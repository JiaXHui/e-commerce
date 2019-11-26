package com.jia.controller;

import com.jia.eneity.AdminUser;
import com.jia.service.AdminUserService;
import com.jia.utils.BatisServlet;
import lombok.SneakyThrows;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @ClassName : adminUser
 * @Author : 贾晓辉
 * @Date : 2019/11/20 15:52
 * @introduce :
 **/
@WebServlet("/AdminUserServlet")
@MultipartConfig
public class AdminUserServlet extends BatisServlet {
   private AdminUserService adminUserServlet=new AdminUserService();

    @SneakyThrows
    public void findAdminLongin(HttpServletRequest req, HttpServletResponse resp){
      String username=req.getParameter("username");
      String password=req.getParameter("password");
        AdminUser adminUser=adminUserServlet.findAdminLongin(username,password);
        if(adminUser!=null){
            resp.getWriter().print(true);
        }
    }
}
