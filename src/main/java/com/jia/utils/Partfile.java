package com.jia.utils;

import lombok.Getter;

import javax.servlet.http.Part;
import java.io.File;
import java.util.UUID;

/**
 * @ClassName : Partfile
 * @Author : 贾晓辉
 * @Date : 2019/11/21 20:25
 * @introduce :
 **/
@Getter
public class Partfile {
    //拼接完整的图片径路
    private String photo;
    //文件名字
    private String header;
    //后缀
    private String suffix;
    //上传的路径
    //String path = request.getRealPath("/"); //图片放在tomcat下容易丢失
    //本地路径
    private String path="D:\\black_imges\\";
    private String virpage="E:\\ideaproject\\xiangmu\\src\\main\\webapp\\images";
    public Partfile(Part part){
        this.header=part.getHeader("Content-Disposition");
        this.suffix=this.header.substring(this.header.lastIndexOf(".")+1,this.header.length()-1);
        if(!("jpg".equals(suffix) || "jpeg".equals(suffix) || "png".equals(suffix) || "gif".equals(suffix))) {
            throw new RuntimeException("请上传指定格式的图片jpg、jpeg、png、gif");
        }
        this.photo= UUID.randomUUID()+"."+suffix;
        //没有文件夹创建
        File file=new File(this.path);
        File file1=new File(this.virpage);
        if(!file.exists()){
            file.mkdirs();
        }
        if(!file1.exists()){
            file1.mkdirs();
        }
    }

}
