<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%

	

	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
	
	System.out.println("Scheme:"+request.getScheme());
	System.out.println("ServerName:"+request.getServerName());
	System.out.println("ServerPort:"+request.getServerPort());
	System.out.println("ContextPath:"+request.getContextPath());
	
	System.out.println("basePath:"+basePath);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录小米后台管理系统</title>

<link href="<%=basePath %>admin/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=basePath %>admin/js/jquery.js"></script>
<script src="<%=basePath %>admin/js/cloud.js" type="text/javascript"></script>

<script language="javascript">
$(function(){
		
	$('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
		$('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })
    
    //ajax登录
    $(".loginbtn").click(function(){
    	
    	var username = $("#username").val();
    	var password = $("#password").val();
    	$.ajax({
    		url:"<%=basePath%>AdminUserServlet",
    		data:{"username":username,"password":password,"mark":"findAdminLongin"},
    		type:"post",
    		dataType:"json",
    		success:function(object){
    			if(object){
    				location = "main.jsp";
    			}else{
    				$("#msg").text("账号或者密码错误！");
    			}
    		}
    	});
    	
    	
    });
    
});  
</script> 

</head>

<body style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">


    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


<div class="logintop">    
    <span>欢迎登录后台管理界面平台</span>    
    <ul>
    <li><a href="#">回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>    
    </div>
    
    <div class="loginbody">
    
    <span class="systemlogo"></span> 
       
    <div class="loginbox">
    
    <form id="s14">
    	<input name="mark" type="hidden" value="adminLogin" />
	    <ul>
	    <li>
	    <font id="msg" style="color: red">${msg }</font><br>
	    <input id="username" name="username" type="text" class="loginuser"/></li>
	    <li><input id="password" name="password" type="password" class="loginpwd"/></li>
	    <li><input name="" type="button" class="loginbtn" value="登录"  /><label><input name="" type="checkbox" value="" checked="checked" />记住密码</label><label><a href="#">忘记密码？</a></label></li>
	    </ul>
    </form>
    
    </div>
    
    </div>
    <div class="loginbm">版权所有  2019 0909班专属</div>
</body>
</html>
