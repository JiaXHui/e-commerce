package com.jia.dao;

import com.jia.eneity.Goods;
import com.jia.utils.DBTools;
import com.jia.utils.PageTools;
import lombok.SneakyThrows;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.util.List;

public class GoodsDao {

    @SneakyThrows
    public Goods findGoodsById(String gid) {
        String sql="select * from goods where gid=?";
        return DBTools.getQr().query(sql,new BeanHandler<>(Goods.class),gid);
    }

    @SneakyThrows
    public List<Goods> findGoodsList() {
        String sql="select * from goods";
        return DBTools.getQr().query(sql,new BeanListHandler<>(Goods.class));
    }

    @SneakyThrows
    public int updateGoodsById(Goods goods) {
        String sql="update goods set name=?,price=?,description=?,picture=?,product_date=?,cid=? where gid=?";
        Object[] objects={goods.getName(),goods.getPrice(),goods.getDescription(),goods.getPicture(),goods.getProduct_date(),goods.getCid(),goods.getGid()};
        return DBTools.getQr().update(sql,objects);
    }
    @SneakyThrows
    public int saveGoods(Goods goods) {
        String sql="insert into goods(name,price,description,picture,product_date,cid) values(?,?,?,?,?,?)";
        Object[] objects={goods.getName(),goods.getPrice(),goods.getDescription(),goods.getPicture(),goods.getProduct_date(),goods.getCid()};
        return DBTools.getQr().update(sql,objects);
    }
    @SneakyThrows
    public int deleteGoodsById(String gids) {
        String sql="delete from goods where gid in("+gids+")";
        return DBTools.getQr().update(sql);
    }

    @SneakyThrows
    public List<Goods> findGoodsListFy(PageTools tools) {
        String sql="select * from goods limit ?,?";
        Object[] objects={tools.getStart_index(),tools.getPage_rows()};
        return DBTools.getQr().query(sql,new BeanListHandler<>(Goods.class),objects);
    }

    @SneakyThrows
    public Integer findGoodsCount() {
        String sql="select count(*) from goods";
        long i=(long) DBTools.getQr().query(sql,new ScalarHandler<>());
        return (int) i;
    }
    @SneakyThrows
    public List<Goods> findGoodsLimit(int i, int i1) {
        String sql="select * from goods where cid=? limit ?";
        return DBTools.getQr().query(sql,new BeanListHandler<>(Goods.class),i,i1);
    }

}
