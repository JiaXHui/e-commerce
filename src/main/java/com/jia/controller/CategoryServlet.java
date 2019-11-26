package com.jia.controller;

import com.jia.eneity.Category;
import com.jia.service.CategoryService;
import com.jia.utils.BatisServlet;
import com.jia.utils.NewData;
import com.jia.utils.PageTools;
import lombok.SneakyThrows;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet("/CategoryServlet")
@MultipartConfig
public class CategoryServlet extends BatisServlet{

    private CategoryService categoryService=new CategoryService();

    @SneakyThrows
    public void findCategoryList(HttpServletRequest request, HttpServletResponse resp){
        List<Category> list=categoryService.findCategoryList();
        if(list!=null){
            request.setAttribute("list",list);
            request.getRequestDispatcher("admin/category_list.jsp").forward(request,resp);
        }
    }

    @SneakyThrows
    public void findCategoryById(HttpServletRequest request, HttpServletResponse resp){
        Integer cid=Integer.parseInt(request.getParameter("cid"));
        Category category=categoryService.findCategoryById(cid);
        if(category!=null){
            request.setAttribute("category",category);
            request.getRequestDispatcher("admin/category_update.jsp").forward(request,resp);
        }
    }

    @SneakyThrows
    public void updateCategory(HttpServletRequest request, HttpServletResponse resp){
        Integer cid=Integer.parseInt(request.getParameter("cid"));
        String  name=request.getParameter("name");
        Integer state=Integer.parseInt(request.getParameter("state"));
        Integer order_number=Integer.parseInt(request.getParameter("order_number"));
        String  description=request.getParameter("description");
        String  create_time=request.getParameter("create_time");
        System.out.println();
        Category category=new Category(cid,name,state,order_number,description,create_time);
        int i=categoryService.updateCategory(category);
        if(i!=0){
            new CategoryServlet().findCategoryListFY(request,resp);
        }
    }

    @SneakyThrows
    public void insertCategory(HttpServletRequest request, HttpServletResponse resp){
        String  name=request.getParameter("name");
        Integer state=Integer.parseInt(request.getParameter("state"));
        Integer order_number=Integer.parseInt(request.getParameter("order_number"));
        String  description=request.getParameter("description");
        String  create_time= NewData.stringDate();
        Category category=new Category();
        category.setName(name);
        category.setOrder_number(order_number);
        category.setState(state);
        category.setDescription(description);
        category.setCreate_time(create_time);
        int i=categoryService.insertCategory(category);
        if(i!=0){
            new CategoryServlet().findCategoryListFY(request,resp);
        }
    }

    @SneakyThrows
    public void deleteCategoryById(HttpServletRequest request, HttpServletResponse resp){
        String cid=request.getParameter("cid");
        int i=categoryService.deleteCategoryById(cid);
        if(i!=0){
            new CategoryServlet().findCategoryListFY(request,resp);
        }
    }

    @SneakyThrows
    public void findCategoryListFY(HttpServletRequest request, HttpServletResponse resp){
        String current_page=request.getParameter("current_page");
        Integer all_rows=categoryService.findCategoryCount();
        PageTools tools=new PageTools(all_rows,current_page);
        List<Category> list=categoryService.findCategorylimit(tools);
        request.setAttribute("list",list);
        request.setAttribute("tools",tools);
        if(list!=null){
            request.setAttribute("list",list);
            request.getRequestDispatcher("admin/category_list.jsp").forward(request,resp);
        }
    }

    @SneakyThrows
    public void deletefindCategory(HttpServletRequest request, HttpServletResponse resp) {
        String cids = request.getParameter("cids");
        int i = categoryService.deleteCategoryById(cids);
        new CategoryServlet().findCategoryListFY(request,resp);
    }

}
