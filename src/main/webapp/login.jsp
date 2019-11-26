<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>
    <link rel="stylesheet" href="css/index.css">
    <script src="js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
        //读秒的方法
        var iTime = 59;
        var Account;
        function RemainTime(){
            document.getElementById('zphone').disabled = true;
            var iSecond,sSecond="",sTime="";
            if (iTime >= 0){
                iSecond = parseInt(iTime%60);
                iMinute = parseInt(iTime/60)
                if (iSecond >= 0){
                    if(iMinute>0){
                        sSecond = iMinute + "分" + iSecond + "秒";
                    }else{
                        sSecond = iSecond + "秒";
                    }
                }
                sTime=sSecond;
                if(iTime==0){
                    clearTimeout(Account);
                    sTime='获取手机验证码';
                    iTime = 59;
                    document.getElementById('zphone').disabled = false;
                }else{
                    Account = setTimeout("RemainTime()",1000);
                    iTime=iTime-1;
                }
            }else{
                sTime='没有倒计时';
            }
            document.getElementById('zphone').value = sTime;
        }
        $(function () {
            // $("#f4").validate();
            $("#zphone").click(function () {
                $("#msg").text("");
               var phone_number=$("#phone_number").val();
               $.ajax({
                 url:"LoginRegisterService",
                 data:{"mark":"coreSession","phone_number":phone_number},
                 type:"post",
                 dataType:"json",
                 success:function (object) {
                     if(object==true){
                         $("#msg").text("你输入的账号没有注册或错误");
                      }else{
                         RemainTime();
                   }
                 }
              });
            });

            // $("#sub").click(function () {
            //     $("#msg").text("");
            //     var phone_number=$("#phone_number").val();
            //     var code=$("#code").val();
            //     $.ajax({
            //         url:"LoginRegisterService",
            //         data:{"mark":"loginUser","phone_number":phone_number,"code":code},
            //         type:"post",
            //         dataType:"json",
            //         success:function (object) {
            //             if(object==true){
            //                 $("#msg").text("你输入的账号没有注册或账号错误");
            //             }else {
            //                 location = "success.jsp";
            //             }
            //         }
            //     });
            // });
        })
        function tiaozhuan() {
            $("#msg").text("");
                var phone_number=$("#phone_number").val();
                var code=$("#code").val();
                $.ajax({
                    url:"LoginRegisterService",
                    data:{"mark":"loginUser","phone_number":phone_number,"code":code},
                    type:"post",
                    dataType:"json",
                    success:function (object) {
                        if(object==true){
                            $("#msg").text("你输入的账号没有注册或账号错误");
                        }else if(object==false){
                            $("#msg").text("验证码错误");
                        }else{
                            location = "success.jsp";
                        }
                    }
                });
        }
    </script>
</head>
<body>
<div class="register_head_on">
</div>
<div class="register_head">
    <a href="index.html"><img width="57px" src="img/logo.jpg" alt=""></a>
    <div class="register_head_right">
        <p class="register_head_right_p1">黑市交易</p>
        <p class="register_head_right_p2">让每个人都享受黑暗的乐趣</p>
    </div>
</div>
<div class="register">
    <div class="register_boby">
        <div class="register_boby_min" style="border-radius: 8px;">
            <div class="register_boby_no1">
                <div class="register_boby_no1_in">
                    <span style="color: black;">手机验证码登录 </span>
                </div>
            </div>
            <form id="f4" >
            <div class="register_boby_no2">
            	<span id="msg" style="color: red;font-size: 12px;margin-left: 20px;"></span>
            	
                <input id="phone_number" name="phone_number" type="text" placeholder="手机号码">
                
                <input id="code" name="code"  type="password" placeholder="手机校验码" style="width: 200px; margin-left: 15px;float: left;">
                <!-- 新增加 -->
                <input id="zphone" type="button" value=" 获取手机验证码 " style="width: 138px;float: left;height: 53px;margin-left: 5px;">
                <div style="clear: both;">
                
                <div class="register_boby_no2_div">
                    <span id="sub" onclick="tiaozhuan()">登录</span>
                </div>
            </div>
            </div>
            </form>
            
            <div class="register_boby_no3">
                <a href="javascript:void(0);" style="color: #ff6700">账号密码登录</a>
                <sapn class="register_boby_no3_span">
                    <a href="register.jsp">立即注册</a>
                    <span>|</span>
                    <a href="avascript:void(0);">忘记密码?</a>
                </sapn>

            </div>
            <div class="register_boby_no4" style="border-radius: 8px;">
                <img src="img/register02.jpg" alt="" style="border-radius: 8px;">
            </div>

        </div>
    </div>
</div>

</body>
</html>