<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册页面</title>
    <link rel="stylesheet" href="css/index.css">
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.js"></script>
    <script type="text/javascript" src="js/messages_zh.js"></script>
</head>
<body>
<div class="sign_background" style="height: 700px">
    <div class="sign_background_in">
        <div class="sign_background_no1">
        	<br>
            <a href="index.html"><img width="80px"  src="img/logo.jpg" alt=""></a>
        </div>
        <br>
        <div class="sign_background_no3">
            <div class="sign_background_no5">
             	<form id="f4" action="/UserServlet" method="post" enctype="multipart/form-data">
             		<input type="hidden" name="mark" value="saveUser" >
             		<table style="width: 500px;" border="0" cellspacing="0">
             			<tr>
             				<td width="25%" class="_left">姓名：</td>
             				<td><input type="text" required="required" name="name"></td>
             			</tr>
             			<tr>
             				<td width="25%" class="_left">性别：</td>
             				<td>
             					男<input name="sex" type="radio" checked="checked" value="0" >
             				 	女<input name="sex" type="radio" value="1">
							</td>
             			</tr>
             			<tr>
             				<td width="25%" class="_left">电话号码：</td>
             				<td><input type="text" required="required" id="phone_number" name="phone_number"><span id="pn"></span></td>
             			</tr>
             			<tr>
             				<td width="25%" class="_left">上传头像：</td>
             				<td><input type="file" name="photo"></td>
             			</tr>
             		</table>
             		<div class="sign_background_no6"  id="btn">立即注册</div>
             	</form>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
	$(function () {
		$("#f4").validate();
		$("#btn").click(function () {
			$("#pn").text("");
			var phone_number=$("#phone_number").val();
			$.ajax({
				url:"LoginRegisterService",
				data:{"phone_number":phone_number,"mark":"findUserByPhone"},
				type:"post",
				dataType:"json",
				success:function (object) {
					if(true==object){
						$("#f4").submit();
					}else{
						$("#pn").text("手机号已经被注册");
					}
				}
			});
		});
	})
</script>
</html>