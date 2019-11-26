package com.jia.dao;

import com.jia.eneity.Category;
import com.jia.utils.DBTools;
import com.jia.utils.PageTools;
import lombok.SneakyThrows;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.util.List;

public class CategoryDao {

    @SneakyThrows
    public List<Category> findCategoryList() {
        String sql="select * from category";
        return DBTools.getQr().query(sql,new BeanListHandler<>(Category.class));
    }

    @SneakyThrows
    public Category findCategoryById(Integer cid) {
        String sql="select * from category where cid=?";
        return DBTools.getQr().query(sql,new BeanHandler<>(Category.class),cid);
    }

    @SneakyThrows
    public int updateCategory(Category category) {
        String sql="update category set name=?,state=?,order_number=?,description=?,create_time=? where cid=?";
        Object[] objects={category.getName(),category.getState(),category.getOrder_number(),category.getDescription(),category.getCreate_time(),category.getCid()};
        return DBTools.getQr().update(sql,objects);
    }

    @SneakyThrows
    public int insertCategory(Category category) {
        String sql="insert into category(name,state,order_number,description,create_time) values(?,?,?,?,?)";
        Object[] objects={category.getName(),category.getState(),category.getOrder_number(),category.getDescription(),category.getCreate_time()};
        return DBTools.getQr().update(sql,objects);
    }

    @SneakyThrows
    public int deleteCategoryById(String cid) {
        String sql="delete from category where cid in("+cid+")";
        return DBTools.getQr().update(sql);
    }

    @SneakyThrows
    public Integer findCategoryCount() {
        String sql="select count(*) from category";
        long rows =(long)DBTools.getQr().query(sql, new ScalarHandler());
        return (int)rows;
    }

    @SneakyThrows
    public List<Category> findCategorylimit(PageTools pageTools) {
        String sql="select * from category limit ?,?";
        Object[] objects={pageTools.getStart_index(),pageTools.getPage_rows()};
        return DBTools.getQr().query(sql,new BeanListHandler<>(Category.class),objects);
    }
    @SneakyThrows
    public List<Category> findCategoryLimit(Integer id) {
        String sql="select * from category limit ?";
        return DBTools.getQr().query(sql,new BeanListHandler<>(Category.class),id);
    }
}
