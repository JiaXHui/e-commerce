package com.jia.service;

import com.jia.dao.GoodsDao;
import com.jia.eneity.Goods;
import com.jia.utils.PageTools;

import java.util.List;



public class GoodsService {
    private GoodsDao goodsDao=new GoodsDao();

    public int deleteGoodsById(String gids) {
        return goodsDao.deleteGoodsById(gids);
    }

    public int saveGoods(Goods goods) {
        return goodsDao.saveGoods(goods);
    }

    public int updateGoodsById(Goods goods) {
        return goodsDao.updateGoodsById(goods);
    }

    public List<Goods> findGoodsList() {
        return goodsDao.findGoodsList();
    }

    public Goods findGoodsById(String gid) {
        return goodsDao.findGoodsById(gid);
    }

    public List<Goods> findGoodsListFy(PageTools tools){
        return goodsDao.findGoodsListFy(tools);
    }

    public Integer findGoodsCount() {
        return goodsDao.findGoodsCount();
    }

    public List<Goods> findGoodsLimit(int i, int i1) {
        return goodsDao.findGoodsLimit(i,i1);
    }
}
