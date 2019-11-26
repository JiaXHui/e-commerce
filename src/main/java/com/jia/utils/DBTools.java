package com.jia.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.commons.dbutils.QueryRunner;

/**
 *@Author :贾晓辉
 *@Date : 2019/11/19 16:06
 *@introduce:连接数据库
 **/
public class DBTools {

	private static QueryRunner qr = null;
	static {
		ComboPooledDataSource ds = new ComboPooledDataSource();
		qr = new QueryRunner(ds);
	}
	
	public static QueryRunner getQr() {
		return qr;
	}
	
}
