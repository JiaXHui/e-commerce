package com.jia.controller;

import com.jia.eneity.Category;
import com.jia.eneity.Goods;
import com.jia.service.CategoryService;
import com.jia.service.GoodsService;
import com.jia.utils.BatisServlet;
import com.jia.utils.PageTools;
import com.jia.utils.Partfile;
import lombok.SneakyThrows;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.List;


@MultipartConfig
@WebServlet("/GoodsServlet")
public class GoodsServlet extends BatisServlet {
   private GoodsService goodsService=new GoodsService();
   private CategoryService categoryService=new CategoryService();
   public void deleteGoodsById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String gid=request.getParameter("gid");
       int i=goodsService.deleteGoodsById(gid);
       if(i!=0){
           new GoodsServlet().findGoodsListFY(request,response);
       }
    }
    public void findGoodsById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String gid=request.getParameter("gid");
        List<Category> categories=categoryService.findCategoryList();
        Goods goods=goodsService.findGoodsById(gid);
        if(null!=goods){
            request.setAttribute("categories",categories);
            request.setAttribute("goods",goods);
            request.getRequestDispatcher("admin/goods_update.jsp").forward(request,response);
        }
    }

    @SneakyThrows
    public void findGoodsList(HttpServletRequest request, HttpServletResponse response){
        List<Goods> list=goodsService.findGoodsList();
        for(Goods goods:list){
            Category category=categoryService.findCategoryById(goods.getCid());
            goods.setCategory(category);
        }
        if(null!=list){
            request.setAttribute("list",list);
            request.getRequestDispatcher("admin/goods_list.jsp").forward(request,response);
        }
    }

    @SneakyThrows
    public void findGoodsListFY(HttpServletRequest request, HttpServletResponse response){
       Integer all_rows=goodsService.findGoodsCount();
       String current_page=request.getParameter("current_page");
       PageTools tools=new PageTools(all_rows,current_page);
       List<Goods> list=goodsService.findGoodsListFy(tools);
        for(Goods goods:list){
            Category category=categoryService.findCategoryById(goods.getCid());
            goods.setCategory(category);
        }
        if(null!=list){
            request.setAttribute("tools",tools);
            request.setAttribute("list",list);
            request.getRequestDispatcher("admin/goods_list.jsp").forward(request,response);
        }
    }
    public void updateGoodsById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      Integer gid=Integer.parseInt(request.getParameter("gid"));
      String name=request.getParameter("name");
      Double price=Double.parseDouble(request.getParameter("price"));
      String description=request.getParameter("description");
      Part part=request.getPart("picture");
      Partfile partfile=new Partfile(part);
      String picture=partfile.getPhoto();
      part.write(partfile.getPath()+picture);
      String product_date=request.getParameter("product_date");
      Integer cid=Integer.parseInt(request.getParameter("cid"));
      Category category=categoryService.findCategoryById(cid);
      Goods goods=new Goods(gid,name,price,description,picture,product_date,cid,category);
      int i=goodsService.updateGoodsById(goods);
      if(i!=0){
          new GoodsServlet().findGoodsListFY(request,response);
      }
    }
    @SneakyThrows
    public void findCategoryList(HttpServletRequest request, HttpServletResponse response){
       List<Category> categories=categoryService.findCategoryList();
       if(null!=categories){
           request.setAttribute("categories",categories);
           request.getRequestDispatcher("admin/goods_add.jsp").forward(request,response);
       }
    }
    public void saveGoods(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("name");
        Double price=Double.parseDouble(request.getParameter("price"));
        String description=request.getParameter("description");
        Part part=request.getPart("picture");
        Partfile partfile=new Partfile(part);
        String picture=partfile.getPhoto();
        part.write(partfile.getPath()+picture);
        String product_date=request.getParameter("product_date");
        Integer cid=Integer.parseInt(request.getParameter("cid"));
        Goods goods=new Goods();
        goods.setName(name);
        goods.setPrice(price);
        goods.setDescription(description);
        goods.setPicture(picture);
        goods.setProduct_date(product_date);
        goods.setCid(cid);
        int i=goodsService.saveGoods(goods);
        if(i!=0){
            new GoodsServlet().findGoodsListFY(request,response);
        }

    }
    public void deleteGoodsList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String gids=request.getParameter("gids");
       int i=goodsService.deleteGoodsById(gids);
       if(i!=0){
           new GoodsServlet().findGoodsListFY(request,response);
       }
    }
}
