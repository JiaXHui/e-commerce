package com.jia.utils;

import lombok.SneakyThrows;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

/**
 * @ClassName : BatisServlet
 * @Author : 贾晓辉
 * @Date : 2019/11/13 17:01
 * @introduce :
 **/

public class BatisServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    @SneakyThrows
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String mark = request.getParameter("mark");
        if (null == mark || mark.trim().isEmpty()) {
            throw new RuntimeException("没有传递mark参数，不能确定要调用的方法！");
        }
        Class<? extends BatisServlet> c = this.getClass();
        Method method = c.getMethod(mark, HttpServletRequest.class,HttpServletResponse.class);
        method.invoke(this,request, response);
    }
}
