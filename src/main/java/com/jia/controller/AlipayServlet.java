package com.jia.controller;

import com.jia.eneity.Goods;
import com.jia.service.GoodsService;
import com.jia.utils.BatisServlet;
import lombok.SneakyThrows;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *@Author :贾晓辉
 *@Date : 2019/11/23 10:48
 *@introduce:
 **/
@MultipartConfig
@WebServlet("/AlipayServlet")
public class AlipayServlet extends BatisServlet {

    private GoodsService goodsService=new GoodsService();
    @SneakyThrows
    public void paySingleGoods(HttpServletRequest request, HttpServletResponse response){
       String gid=request.getParameter("gid");
        Goods goods = goodsService.findGoodsById(gid);
        request.setAttribute("goods",goods);
        request.getRequestDispatcher("alipay.jsp").forward(request,response);
    }
}
