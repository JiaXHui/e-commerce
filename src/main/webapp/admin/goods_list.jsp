<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%	
	//获取项目名
	String path = request.getContextPath();
	//获取tomcat 协议+地址+端口号+ 获取项目名
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品信息</title>
<link href="<%=basePath %>admin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>js/jquery-3.4.1.min.js"></script>

<script type="text/javascript">

	function add_goods(){
		location = "<%=basePath %>GoodsServlet?mark=findCategoryList";
	}
	
	$(function(){
		$("#shanchu").click(function () {
			var gids="";
			$("input[name='gid']:checked").each(function (i) {
				if(""==gids){
					gids=$(this).val();
				}else{
					gids=","+$(this).val();
				};
			});
			alert(gids);
			location="GoodsServlet?mark=deleteGoodsList&gids="+gids;
		});
		window.setTimeout(function(){
			$("#msg").fadeOut(1*1000);
		},2*1000);
	});
	
	
	function showsss(img_src){
		$(".box").fadeIn(500);
		//动态src
		$("#big_img").prop("src",img_src);
	}
	
	function hidesss(){
		$(".box").fadeOut(500);
	}
	
</script>

<style type="text/css">
	.box{
		position: absolute;
		top: 0px;
		width: 100%;
		height: 100%;
		background-color: rgba(0,0,0,0.6);
		text-align: center;
		display: none;
	}	
</style>

</head>
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">商品管理</a></li>
    </ul>
    <span id="msg" style="color: red;">${msg }</span>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        
        <!-- 
        
        <li class="click"><span><img src="images/t02.png" /></span>修改</li>
        <li><span><img src="images/t04.png" /></span>统计</li>
         -->
        <li style="cursor: pointer;" onclick="add_goods()"><span><img src="<%=basePath %>admin/images/t01.png"  /></span>添加商品</li>
        <li style="cursor: pointer;" id="shanchu"><span><img src="<%=basePath %>admin/images/t03.png" /></span>批量删除</li>
        </ul>
    </div>
    <table class="tablelist">
    	<thead>
	    	<tr>
		        <th><input name="" type="checkbox" value="" /></th>
		        <th>序号</th>
		        <th>商品类别</th>
		        <th>商品名称</th>
		        <th>商品价格</th>
		        <th width="10%">简介</th>
		       	<th>商品展示图</th>
		       	<th>生产日期</th>
		       	<th>操作</th>
	        </tr>
        </thead>
        <tbody> 
        	<c:forEach items="${list }" var="list" varStatus="i">
        		<tr>
			        <td><input name="gid" type="checkbox" value="${list.gid}"/></td>
			        <td>${i.count }</td>
			        <td>${list.category.name }</td>
			        <td>${list.name }</td>
			        <td>${list.price }</td>
			        <td width="10%" title="${list.description }">
			        	<c:if test="${list.description.length() <= 8 }">${list.description }</c:if>
			        	<c:if test="${list.description.length() > 8 }">
			        		${fn:substring(list.description, 0,8)} ...
			        	</c:if>
			        </td>
			       	<td style="text-align: center;">
			       		<img onclick="showsss('http://localhost:8080/images/${list.picture }')" width="150px" height="80px" src="http://localhost:8080/images/${list.picture }" alt="" />
			       	</td>
			       	<td>${list.product_date }</td>
			       	<td><a href="<%=basePath %>GoodsServlet?mark=deleteGoodsById&gid=${list.gid}">删除</a>&nbsp;&nbsp;<a href="<%=basePath %>GoodsServlet?mark=findGoodsById&gid=${list.gid}">修改</a></td>
		        </tr>
        	</c:forEach>
        </tbody>
    </table>
    
   
    <div class="pagin">
    	<div class="message">共<i class="blue"> ${tools.all_rows } </i>条记录，当前显示第&nbsp;<i class="blue">${tools.current_page }&nbsp;</i>页</div>
        <ul class="paginList">
	        
	         <li class="paginItem"><a href="<%=basePath %>GoodsServlet?mark=findGoodsListFY&current_page=1">首页</a></li>
	         <li class="paginItem"><a href="<%=basePath %>GoodsServlet?mark=findGoodsListFY&current_page=${tools.pve_page}">上一页</a></li>
	         <li class="paginItem"><a href="<%=basePath %>GoodsServlet?mark=findGoodsListFY&current_page=${tools.next_page}">下一页</a></li>
	         <li class="paginItem"><a href="<%=basePath %>GoodsServlet?mark=findGoodsListFY&current_page=${tools.all_page}">尾页</a></li>
	         
	        
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
    
    <div class="box">
    	<img id="big_img" onclick="hidesss()" style="margin-top: 50px;cursor: pointer;" src="http://10.10.18.27:8080/images/55fc64ae-59f3-4dff-a1d8-61eaf6e70bc3.jpg" width="1000px" height="600px"  alt="" />
    </div>
    
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
