package com.jia.controller;

import com.jia.eneity.User;
import com.jia.service.UserService;
import com.jia.utils.BatisServlet;
import com.jia.utils.NewData;
import com.jia.utils.Partfile;
import lombok.SneakyThrows;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.util.List;

/**
 * @ClassName : UserServlet
 * @Author : 贾晓辉
 * @Date : 2019/11/19 18:10
 * @introduce :
 **/

@WebServlet("/UserServlet")
@MultipartConfig
public class UserServlet extends BatisServlet {
    private UserService userService=new UserService();

    @SneakyThrows
    public void saveUser(HttpServletRequest req, HttpServletResponse response){
        User user=new User();
        String name = req.getParameter("name");
        Integer sex =Integer.parseInt(req.getParameter("sex"));
        String phone_number = req.getParameter("phone_number");
        Part part = req.getPart("photo");
        Partfile partfile=new Partfile(part);
        String photo=partfile.getPhoto();
        //上传
        part.write(partfile.getPath()+photo);
        part.write(partfile.getVirpage()+photo);
        String creat_time = NewData.stringDate();
        user.setName(name);
        user.setSex(sex);
        user.setPhone_number(phone_number);
        user.setPhoto(photo);
        user.setCreate_time(creat_time);
        int i = userService.saveUser(user);
        if(i!=0){
            System.out.println("添加用户成功");
            response.sendRedirect("login.jsp");
        }else{
            System.out.println("添加用户失败");
        }
    }

    @SneakyThrows
    public void findUserList(HttpServletRequest req, HttpServletResponse response){
        List<User> list=userService.findUserList();
        if(list!=null){
            req.setAttribute("list",list);
            req.getRequestDispatcher("").forward(req,response);
        }
    }
}
