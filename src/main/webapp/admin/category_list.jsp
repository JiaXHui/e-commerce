<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品分类</title>
<link href="<%=basePath %>admin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>js/jquery-3.4.1.js"></script>

<script type="text/javascript">


$(function(){
    $("#selectAll").click(function () {
       var check=$(this).prop("checked");
       $("[name='cid']").prop("checked",check);
    });
    $("#shanchu").click(function () {
        var cids ="";
        $("input[name='cid']:checked").each(function (i) {
            if(""==cids){
                cids=$(this).val();
                console.log(cids)
            }else {
                cids=cids+","+$(this).val();
                console.log(cids);
            }
        });
        location="<%=basePath %>CategoryServlet?mark=deletefindCategory&cids="+cids;
        // $.ajax({
        //     url:"CategoryServlet?mark=deletefindCategory",
        //     data:{"cids":cids},
        //     type:"post",
        //     dataType:"json",
        //     success:function () {
        //          location="CategoryServlet?mark=findCategoryListFY";
        //     }
        // });
    });

	$("#add_category").click(function(){
		//直接跳转到添加页面
		window.location = "<%=basePath %>admin/category_add.jsp";
	});
	
	window.setTimeout(function(){
		$("#msg").fadeOut(1*1000);
	},2*1000);
	
});



</script>
</head>
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">分类管理</a> </li>
    </ul>
    <span id="msg" style="color: red;">${msg }</span>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    	<ul class="toolbar">
        <%-- <li class="click"><span><img src="<%=basePath %>admin/images/t02.png" /></span>修改</li>
        <li><span><img src="<%=basePath %>admin/images/t04.png" /></span>统计</li> --%>
        <li style="cursor: pointer;" id="add_category"><span><img src="<%=basePath %>admin/images/t01.png"  /></span>添加类别</li>
        <li style="cursor: pointer;" id="shanchu"><span><img src="<%=basePath %>admin/images/t03.png" /></span>批量删除</li>
        </ul>
    </div>
    
    <table class="tablelist">
    	<thead>
    	<tr>
	        <th><input id="selectAll" type="checkbox" value="" /></th>
	        <th>序号<i class="sort"></i></th>
	        <th>类别名称</th>
	        <th>启用状态</th>
	        <th>排序序号</th>
	        <th>创建时间</th>
	        <th>描述</th>
	        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list }" var="list" varStatus="i">
	        <tr>
		        <td><input name="cid" type="checkbox" value="${list.cid}"/></td>
		        <td>${i.count }</td>
		        <td>${list.name }</td>
		        <td>
		        	<c:if test="${list.state == 1 }">启用</c:if>
		        	<c:if test="${list.state == 0 }">未启用</c:if>
		        </td>
		        <td>${list.order_number }</td>
		        <td>${list.create_time }</td>
		        <td>${list.description }</td>
		        <td>
		        	<a href="<%=basePath %>CategoryServlet?mark=findCategoryById&cid=${list.cid}">修改</a>&nbsp;&nbsp;
		        	<a href="<%=basePath %>CategoryServlet?mark=deleteCategoryById&cid=${list.cid}">删除</a>
		        </td>
	        </tr>
        
        </c:forEach>
        
        </tbody>
    </table>
    
   
    <div class="pagin">
    	<div class="message">共<i class="blue">${tools.all_rows }</i>条记录，当前显示第&nbsp;<i class="blue">${tools.current_page } &nbsp;</i>页</div>
        <ul class="paginList">
	        
	         <li class="paginItem"><a href="<%=basePath %>CategoryServlet?mark=findCategoryListFY&current_page=1">首页</a></li>
	         <li class="paginItem"><a href="<%=basePath %>CategoryServlet?mark=findCategoryListFY&current_page=${tools.pve_page}">上一页</a></li>
	         <li class="paginItem"><a href="<%=basePath %>CategoryServlet?mark=findCategoryListFY&current_page=${tools.next_page}">下一页</a></li>
	         <li class="paginItem"><a href="<%=basePath %>CategoryServlet?mark=findCategoryListFY&current_page=${tools.all_page}">尾页</a></li>
	         
	        
        </ul>
    </div>
    
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    </div>
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
