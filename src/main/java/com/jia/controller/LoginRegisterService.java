package com.jia.controller;

import com.jia.eneity.User;
import com.jia.service.UserService;
import com.jia.utils.BatisServlet;
import lombok.SneakyThrows;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @ClassName : LoginRegisterService
 * @Author : 贾晓辉
 * @Date : 2019/11/19 16:07
 * @introduce :
 **/
@WebServlet("/LoginRegisterService")
@MultipartConfig
public class LoginRegisterService extends BatisServlet {
    private UserService userService=new UserService();

    @SneakyThrows
    public void loginUser(HttpServletRequest request, HttpServletResponse response){
       String phone_number=request.getParameter("phone_number");
       String code=request.getParameter("code");
        User user = userService.findUserByPhone(phone_number);
        Boolean bool=true;
        if(null!=user){
            HttpSession session = request.getSession();
            String str=session.getAttribute("user").toString();
            if(str.equals(code)){
                bool=null;
                response.getWriter().print(bool);
            }else {
                bool=false;
                response.getWriter().print(bool);
            }
        }else{
            response.getWriter().print(bool);
        }
    }
    @SneakyThrows
    public void coreSession(HttpServletRequest request, HttpServletResponse response) {
        String phone_number=request.getParameter("phone_number");
        System.out.println(phone_number);
        User user=userService.findUserByPhone(phone_number);
        Boolean bool=false;
        HttpSession session=request.getSession();
        if(null==user){
            bool=true;
            response.getWriter().print(bool);
        }else {
            Integer yanzheng=(int)(Math.random()*1000-1);
            System.out.println(yanzheng);
            session.setAttribute("user",yanzheng+"");
            response.getWriter().print(bool);
        }
    }

    @SneakyThrows
    public void findUserByPhone(HttpServletRequest request, HttpServletResponse response) {
        String phone_number=request.getParameter("phone_number");
        System.out.println(phone_number);
        User user=userService.findUserByPhone(phone_number);
        Boolean bool=false;
        HttpSession session=request.getSession();
        if(null==user){
            bool=true;
            response.getWriter().print(bool);
        }else {
            response.getWriter().print(bool);
        }
    }
}
