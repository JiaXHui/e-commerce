package com.jia.utils;

import lombok.Getter;


@Getter
public class PageTools {
    //��ʾ������
    private Integer page_rows=5;
    //�����ܹ�������
    private Integer all_rows;
    //���һҳ
    private Integer all_page;
    //��ǰҳ
    private Integer current_page;
    //��һҳ
    private Integer next_page;
    //��һҳ
    private Integer pve_page;
    //��ʼ����
    private Integer start_index;

    public PageTools(Integer all_rows,String current_page){
        //��ȡ��ǰҳ
        this.all_rows=all_rows;
        /**
         *@Author :������
         *@Date : 2019/11/20 19:36
         *@introduce:�жϵ�ǰҳ�Ƿ�Ϊnull�����Ϊ�ջ�ȡ��ǰҳ���Ϊnull�����1
         **/
        if(null==current_page){
            this.current_page=1;
        }else{
            this.current_page=Integer.parseInt(current_page.trim());
        }
        //��ȡ��ҳ��,��������������ÿҳ�������������һ
        this.all_page=(this.all_rows/this.page_rows)+(this.all_rows%this.page_rows==0?0:1);
        //�жϵ�ǰҳ���Ƿ������һҳ,�������򷵻ص�ǰҳ,����������һ
        if(this.current_page==1){
            this.next_page=1;
        }else{
            this.next_page=this.current_page-1;
        }

        //�жϵ�ǰҳ�Ƿ������һҳ������򷵻ص�ǰҳ,�������ǰҳ����һ
        if(this.current_page==this.all_page){
            this.pve_page=this.current_page;
        }else{
            this.next_page=this.current_page+1;
        }
        //��ʼ�������ڵ�ǰҳ����һ
        this.start_index=(this.current_page-1)*5;
    }


}
