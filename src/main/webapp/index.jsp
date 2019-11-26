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
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>小米首页</title>
    <link rel="stylesheet" href="css/index.css">
    <script src="js/jquery-3.4.1.js"></script>
    <style>

    </style>

</head>
<body style="background-color: #fafafa;">
    
    <!-- 头部分 -->
    <jsp:include page="header.jsp"></jsp:include>
    
    <!-- 滚动图片 -->
    <div class="scroll">
        <ul>
            <li><a href=""><img width="1226px" height="460px" src="img/k1.jpg" alt=""></a></li>
            <li><a href=""><img width="1226px" height="460px" src="img/k2.jpg" alt=""></a></li>
            <li><a href=""><img width="1226px" height="460px" src="img/k3.jpg" alt=""></a></li>
            <li><a href=""><img width="1226px" height="460px" src="img/k4.jpg" alt=""></a></li>
            <li><a href=""><img width="1226px" height="460px" src="img/k5.jpg" alt=""></a></li>
            <li><a href=""><img width="1226px" height="460px" src="img/k6.jpg" alt=""></a></li>
        </ul>
        <div class="scroll_dot">
            <span class="scroll_dot_span"></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
        <div class="scroll_arrows">
            <a href="javascript:void(0);"><span class="left scroll_arrows_back">〈</span></a>
            <a href="javascript:void(0);"><span class="right scroll_arrows_back">〉</span></a>
        </div>
        <div class="scroll_left" style="height: 420px;">
            <ul class="scr-ul">
            	<c:forEach items="${categories }" var="categories">
                	<li class="scr_li"><a href="">${categories.name }</a><i class="scr_i"></i></li>
                </c:forEach>
            </ul>
        </div>
        
    </div>
    
    <div class="time">
        <div class="H">海鲜野味</div>
        <div class="time_in">
        	    <!-- 动态数据时使用，已经修改过css -->
        	    
        	    <c:forEach items="${seventysixGoods }" var="goods">
        	    
		            <div style="background-color: #fff;width: 234px;height:320px;float: left;margin-left: 11px; ">
		            	<a href="<%=basePath %>IndexServlet?mark=findGoodsDetail&gid=${goods.gid}" target="_blank">
		            		<img class="time_min" style="width:234px;height: 234px;" src="http://localhost:8080/images/${goods.picture }" alt="">
		            	</a>
		            	<div style="clear: both;"></div>
		            	
		            	<div style="width: 234px;height: 85px;">
		            		<div style="width: 234px;height: 20px;line-height: 20px;text-align: center;font-size: 14px;font-family: Arial">
		            			${goods.name }
		            		</div>
		            		<div style="width: 234px;height: 30px;line-height: 30px;text-align: center;color: #ff6700;font-size: 14px;font-family: Arial">
		            			 ${goods.price } <span style="color:#000"> &nbsp;起始价 </span>
		            		</div>
		            		<div style="width: 234px;height: 35px;line-height: 35px;text-align: center;color: #000;font-size: 14px;font-family: Arial" title="${goods.description }">
								<c:if test="${goods.description.length() >14 }">
									${fn:substring(goods.description,0,14)}...
								</c:if>
								<c:if test="${goods.description.length() <=14 }">${goods.description }</c:if>
		            		</div>
		            	</div>
		            </div>
	            </c:forEach>
        </div>
    </div>
    <div class="appliances">
        <div class="app_width">
            <div class="app_A">精品女优</div>
            <div class="app_Ar orangeGL">
               <div class="app_Ar_r"><a href="">二次元</a></div>
               <div class="app_Ar_r"><a href="">国产动漫</a></div>
               <div class="app_Ar_r"><a href="">日韩</a></div>
               <div class="app_Ar_r"><a href="">欧美</a></div>
            </div>
            <div class="app_max">
                <div class="appl"><a href=""><img width="233px" height="615px" src="img/tiaowu.gif" alt=""></a></div>
                <div class="appr">
                    <div class="appr_top">
                    	<!-- 循环后台取到的家电的集合 -->
                    		
                   		  <!-- 动态获取数据时使用，已经修改过css -->
                   		  
                   		  <c:forEach items="${sixtyfoureGoods }" var="goods" varStatus="i">
                   		  	<c:if test="${i.count<=4 }">
                   		  		<div class="appr_min" id="appr_min1" style="margin-left: 12px;width: 234px;height: 300px;background-color: #FFF;text-align: center;">
		                  			<a href="<%=basePath %>IndexServlet?mark=findGoodsDetail&gid=${goods.gid}" target="_blank"><img width="234px" height="180px;" src="http://localhost:8080/images/${goods.picture }" alt=""></a>
		                  			
		                  			<div style="width: 234px;height: 100px;">
		                  				<div style="width: 100%;height: 33px;text-align: center;font-size: 14px;font-family: Arial">${goods.name }</div>
		                  				<div style="width: 100%;height: 33px;text-align: center;font-size: 14px;font-family: Arial" title="${goods.description }">
		                  					<c:if test="${goods.description.length() >30 }">
												${fn:substring(goods.description,0,30)}...
											</c:if>
											<c:if test="${goods.description.length() <=30 }">${goods.description }</c:if>
		                  				</div>	
		                  				<br>
		                  				<div style="width: 100%;height: 33px;text-align: center;color: #ff6700;font-size: 14px;font-family: Arial">${goods.price }</div>
		                  			</div>
	                  			</div>
                   		  	</c:if>
                   		  	<c:if test="${i.count > 4 }">
	                   		  	<div class="appr_min" style="margin-left: 12px;width: 234px;height: 300px;background-color: #FFF;text-align: center;margin-top: 15px;" id="appr_min1">
		                  			<a href="<%=basePath %>IndexServlet?mark=findGoodsDetail&gid=${goods.gid}" target="_blank"><img width="234px" height="180px;" src="http://localhost:8080/images/${goods.picture }" alt=""></a>
		                  			<div style="width: 234px;height: 100px;">
		                  				<div style="width: 100%;height: 33px;text-align: center;font-size: 14px;font-family: Arial">${goods.name }</div>
		                  				<div style="width: 100%;height: 33px;text-align: center;font-size: 14px;font-family: Arial" title="${goods.description }">
		                  					<c:if test="${goods.description.length() >30 }">
												${fn:substring(goods.description,0,30)}...
											</c:if>
											<c:if test="${goods.description.length() <=30 }">${goods.description }</c:if>
		                  				</div>
		                  				<br>
		                  				<div style="width: 100%;height: 33px;text-align: center;color: #ff6700;font-size: 14px;font-family: Arial">${goods.price }</div>
		                  			</div>
	                  			</div>
                   		  	
                   		  	</c:if>
                   		  </c:forEach>
                   		
                    </div>
                </div>
            </div>
        </div>
    </div>`
    <div class="capabackground">
        <div class="capacity">
            <div class="capa_box_top">
                <div class="capa_box_top_al">枪械</div>
                <div class="capa_box_top_ar">
                </div>
            </div>
            	<div class="capa_box scrip_capa_box scrip_capa_box_on">
                	<div class="capa_top">
                		<c:forEach items="${sixtynineGoods }" var="goods">
	                   		<div class="capa capa_shadow" style="width: 231px;height: 301px;text-align: center;background-color: #FFFFFF;margin-top: 15px;">
		                        <a href="<%=basePath %>IndexServlet?mark=findGoodsDetail&gid=${goods.gid}" target="_blank">
		                        	<img width="231px" height="180px" src="http://localhost:8080/images/${goods.picture }">
		                        </a>
		                        <div class="capa_a">
		                            <ul>
		                                <li style="color: #333333">${goods.name }</li>
		                                <li style="color: #b0b0b0">
		                                	<c:if test="${goods.description.length() >14 }">
												${fn:substring(goods.description,0,14)}...
											</c:if>
											<c:if test="${goods.description.length() <=14 }">${goods.description }</c:if>
		                                </li>
		                                <li style="font-size: 14px;margin-top: 10px; color: #ff6700" > ${goods.price }元</li>
		                            </ul>
		                        </div>
		                    </div>
	                    </c:forEach>
                    </div>
               </div>

            </div>
    </div>
    <br>
    <div class="recommend">
        <div class="capacity">
            <div class="capa_box_top">
                <div class="capa_box_top_al">毒品</div>
                <div class="capa_box_top_ar">
                </div>
            </div>
            <div class="capa_box">
                <div class="capa_top">
					
					<c:forEach items="${fortyGoods }" var="goods">
	                	<div class="capa capa_shadow" style="margin-right: 10px;background-color: #fff">
	                        <a href="<%=basePath %>IndexServlet?mark=findGoodsDetail&gid=${goods.gid}" target="_blank"><img width="234" height="180px" src="http://localhost:8080/images/${goods.picture }">
	                           
	                        </a>
	                        <div class="capa_a">
	                            <ul>
	                                <li style="color: #333333"> ${goods.name } </li>
	                                <li style="color: #b0b0b0"> 
	                                	<c:if test="${goods.description.length() >14 }">
											${fn:substring(goods.description,0,14)}...
										</c:if>
										<c:if test="${goods.description.length() <=14 }">${goods.description }</c:if>
	                                </li>
	                                <li style="font-size: 14px;margin-top: 10px; color: #ff6700" >${goods.price } 元</li>
	                            </ul>
	                        </div>
	                    </div>
                	</c:forEach>
                    
                </div>


            </div>

        </div>
    </div>
    
    <div class="video">
        <div class="popular_background">
            <div class="popular_box_top">
                <div class="popular_box_top_al">视频</div>

            </div>
            <div class="popu_box">
                <div class="vid popu_unleft popu_shadow">
                    <div class="video_top">
                        <a href=""><video class="this_vid" src="video/001.mp4" controls loop  poster="img/video_01.jpg"></video></a>
                    </div>
                    <div class="video_bottom">
                        <h3 class="vid_title"><a href="">小米8，一部与众不同的手机</a></h3>
                        <p class="vid_desc">透明探索版，将科技与美学完美结合</p>
                    </div>
                </div>
                <div class="vid  popu_shadow">
                    <div class="video_top">
                        <a href=""><video class="this_vid" src="video/001.mp4" controls loop  poster="img/video_01.jpg"></video></a>
                    </div>
                    <div class="video_bottom">
                        <h3 class="vid_title"><a href="">小米MIX 2S，一面科技 一面艺术</a></h3>
                        <p class="vid_desc">艺术品般陶瓷机身，惊艳、璀璨</p>
                    </div>
                </div>
                <div class="vid  popu_shadow">
                    <div class="video_top">
                        <a href=""><video class="this_vid" src="video/001.mp4" controls loop  poster="img/video_01.jpg"></video></a>
                    </div>
                    <div class="video_bottom">
                        <h3 class="vid_title"><a href="">天生丽质的小米6X</a></h3>
                        <p class="vid_desc">让你一见倾心</p>
                    </div>
                </div>
                <div class="vid  popu_shadow">
                    <div class="video_top">
                        <a href=""><video class="this_vid" src="video/001.mp4" controls loop  poster="img/video_01.jpg"></video></a>
                    </div>
                    <div class="video_bottom">
                        <h3 class="vid_title"><a href="">生活中无所不在的小爱同学</a></h3>
                        <p class="vid_desc">透明探索版，将科技与美学完美结合</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 底部的包含 -->
	<jsp:include page="footer.jsp"></jsp:include>

    <script>
        var abc = document.getElementsByClassName("script_capa_box_top_ar");
        console.log("abc:"+abc);
        console.log("abc[0]"+abc[0]);
        var box = document.getElementsByClassName("scrip_capa_box");
        console.log("box:"+box);
        console.log("box[0]:"+box[0]);
        for(var i = 0; i<abc.length;i++){
            abc[i].index=i;
            abc[i].onmouseover=function(){
                for(var j = 0 ;j<abc.length;j++){
                    box[j].className="capa_box scrip_capa_box";
                }
                box[this.index].className="capa_box scrip_capa_box scrip_capa_box_on"
                console.log("this.index:"+this.index);
            }
        }
        var n = 0;

        /*setInterval(function () {
            n++;
             if(n > $(".scroll ul li").length){
             n=0;
             }
            $(".scroll ul li").css("opacity","0").eq(n).css("opacity","1")
        },100)*/
        var t = setInterval(fun,3000);
        function  fun() {
            n++;
            if(n > $(".scroll>ul>li").length-1){
                n = 0;
            }
            $(".scroll>ul>li").css("opacity","0").eq(n).css("opacity","1")
            $(".scroll_dot span").eq(n).addClass("scroll_dot_span").siblings().removeClass("scroll_dot_span");
        }
        $(".scroll_arrows .left").click(function() {
            n -= 2;
                    if(n <-1){
                        n=4;
                    }
                    fun()

        } );
        $(".scroll_arrows .right").click(function() {
            fun()
        });
        $(".scroll_dot span").click(function () {
            console.log($(this).index());
            n=$(this).index()-1;
            $(this).siblings().removeClass("scroll_dot_span").end().addClass("scroll_dot_span");
            fun()
        }); $(".scroll").hover(function () {
                    clearInterval(t);
                },
                function () {
                    t = setInterval(fun,3000);
                });

    </script>
</body>
</html>