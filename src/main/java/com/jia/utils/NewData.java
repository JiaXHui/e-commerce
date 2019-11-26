package com.jia.utils;

import java.text.SimpleDateFormat;
import java.util.Date;


public class NewData {

    public static String stringDate(){
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String str=simpleDateFormat.format(new Date());
        return str;
    }

    public static String allinDate(Date date){
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String str=simpleDateFormat.format(date);
        return str;
    }
}
