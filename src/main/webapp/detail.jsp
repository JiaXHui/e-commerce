<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	
	//获取项目名
	String path = request.getContextPath();
	//获取tomcat 协议+地址+端口号+ 获取项目名
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${goods.name }</title>
    <link rel="stylesheet" href="<%=basePath %>css/index.css">
    <script src="<%=basePath %>js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	

</script>
</head>
<body>
    
    <jsp:include page="header.jsp"></jsp:include>
    
    <div class="plus5_no2 ">
        <div class="plus5_no2_in">
            <a class="plus5_no2_in_a"> 为方便您购买，请提前登录 </a>
            <a class="plus5_no2_in_a orange"style="color: pink;" href="login.jsp">立即登录</a>
            <a id="plus5_no2_in" class="plus5_no2_in_a" href="javascript:;">x</a>
        </div>
    </div>
    <div class="plus5_no3" style="height: 500px">
        <div class="plus5_no3_img">
            <img width="560px" height="560px" src="http://localhost:8080/images/${goods.picture }" style="display: block" alt="">
        </div>
        <div class="plus5_no3_right">
                <h3>${goods.name }</h3>
                <p class="plus5_no3_right_p3">${goods.price } 元</p>
                <p class="plus5_no3_right_p2">
                    <span class="plus5_no3_right_span2">「${goods.description }」</span>
                </p>

                <br><br><br><br>
                <a href="AlipayServlet?mark=paySingleGoods&gid=${goods.gid}"><div class="plus5_no3_right_div11" style="cursor: pointer;">立即支付</div></a>
            </form>
            <div class="plus5_no3_right_div12">
                <div class="plus5_no3_right_div12_y">√</div>
                <div class="plus5_no3_right_div12_z">拒绝退货</div>
                <div class="plus5_no3_right_div12_y">√</div>
                <div class="plus5_no3_right_div12_z">拒绝换货</div>
                <div class="plus5_no3_right_div12_y">√</div>
                <div class="plus5_no3_right_div12_z">无保障</div>
            </div>
            <a href="javascript:void (0);"></a>
        </div>
    </div>
    
    <jsp:include page="footer.jsp"></jsp:include>
    
    <script>
        var plus5_no2_in = document.getElementById("plus5_no2_in");
        var plus5_no2 = document.getElementsByClassName("plus5_no2")[0];
        plus5_no2.onclick = function () {
            plus5_no2.className="plus5_no2 plus5_no2_close";
//            plus5_no2.style.display="none";
        }
        $(".plus5_no3_right_div9 .plus5_no3_right_div7_in").click(function () {
            console.log($(this).children().eq(1).html());
            $(".plus5_no3_right_div10_span2").html($(this).children().eq(1).html());

            $(".plus5_no3_img img").css("display","none").eq($(this).index()).css("display", "block");
            $(this).siblings().removeClass("plus5_no3_right_div7_in_hover").end().addClass("plus5_no3_right_div7_in_hover");

        })
        $(".plus5_no3_right_div7 .plus5_no3_right_div7_in").click(function () {
//            var value = $(".plus5_no3_right_div7_span0 ").html();
            console.log($(this).children().eq(1).html());
            $(".plus5_no3_right_div10_span0").html($(this).children().html());
            $(".plus5_no3_right_span10").html($(this).children().eq(1).html());
            var value = "总计:"+$(this).children().eq(1).html()
            $(".plus5_no3_right_div10_p2").html(value);

            $(this).siblings().removeClass("plus5_no3_right_div7_in_hover").end().addClass("plus5_no3_right_div7_in_hover");
        })
    </script>

</body>
</html>