package com.jia.controller;

import com.jia.eneity.Category;
import com.jia.eneity.Goods;
import com.jia.service.CategoryService;
import com.jia.service.GoodsService;
import com.jia.utils.BatisServlet;
import lombok.SneakyThrows;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


@MultipartConfig
@WebServlet("/IndexServlet")
public class IndexServlet extends BatisServlet {
    private CategoryService categoryService=new CategoryService();
    private GoodsService goodsService=new GoodsService();

    @SneakyThrows
    public void findIndexList(HttpServletRequest req, HttpServletResponse resp){
        List<Category> categories=categoryService.findCategoryLimit(10);
        List<Goods> seventysixGoods=goodsService.findGoodsLimit(76,5);
        List<Goods> sixtyfoureGoods=goodsService.findGoodsLimit(64,8);
        List<Goods> sixtynineGoods=goodsService.findGoodsLimit(69,10);
        List<Goods> fortyGoods=goodsService.findGoodsLimit(70,5);
        req.setAttribute("categories",categories);
        req.setAttribute("seventysixGoods",seventysixGoods);
        req.setAttribute("sixtyfoureGoods",sixtyfoureGoods);
        req.setAttribute("sixtynineGoods",sixtynineGoods);
        req.setAttribute("fortyGoods",fortyGoods);
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }
    @SneakyThrows
    public void findGoodsDetail(HttpServletRequest req, HttpServletResponse resp){
        String gid=req.getParameter("gid");
        Goods goods=goodsService.findGoodsById(gid);
        if(null!=goods){
            req.setAttribute("goods",goods);
            req.getRequestDispatcher("detail.jsp").forward(req,resp);
        }
    }
}
