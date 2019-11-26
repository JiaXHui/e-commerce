package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    //** 应用ID,您的APPID，在刚才注册沙箱点击沙箱应用就看见了
    public static String app_id ="2016101500690066";

    //** 商户私钥， 生成的的老密钥中的   应用私钥
    public static String merchant_private_key ="MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC30isospk7gnQfn4Bv5w4haDs9nakAypEqBx4FP4H6XBrWikgT3pnt+WA3WYp1Ldfu981VOIbrksvpEKv6omapxKbFRph5aJ5Utyx4PFd3x0zHq4cTinrloD73VTIe4TqY7c/KnzQ6N3DIqdmcGUYVY0RYNFupnBsnOb6PEMsuDtBXPzG+oiz1CY4S8n7V0ue5wzmkjTswEZ5gXnBzoGGoIMWbwLBVOTSNL02i5MefDxp3zRnbZyIjI4S/jAbPRPwqFUSr15FXezj/h4uBT8mqnMasKIutVR+4/thX+yznv/0BRVvJmAEj4CZ/xqtsvSvD/JLOqD/RiWe/SjWXGLBnAgMBAAECggEAWUXEmBtEt9X/N2xrH+2Cu063lpD/BtdZ8KNMPRg+s6wPjKnTn3K4Jw65X6goygfdmrzWB9FQFRBR33qtSyeb3E8Y/y3t1uisHFBpVGtZv14XN9Fh5GeYj/RnIA9MLBsOLj8wbyMqZiuOpqV2fYz4sGJpSr0C1zhtJ3uvxCNPyamtZbwKz/8LWyeG7/QzCLgtV4rGhGxM+5YNlT+VtedsA06DLvK8JJuZctTKNC52n0Pwok8sTW1Ox6p3nHl/Yj1V1hOlptM0TGQexWj+QZ/5Ebm7yqokvLOngWXfPgu0gxVYNk9Xsdhds+T2FYchRTDmTJ6um2rWDg50wvEUV6s6oQKBgQDbA/Uh3b0LNFxthrj8vy59TbNnwsMsGOOq1r5AqqcRSvpncVVfnNuAmuxq07yafa6frcKKrlmU16VHmqUbZ1AgmZLJ1UFGcGQQ+ioJVUs5fYoHfpQSPU/UvrC40ry9RjE7qzaBMHd8sb9xyMoIU/SafcU87w1a+MI3j06DbU5wdQKBgQDW3MCt4SMy2dgwmzEmvfrhRWvRX6jH5IwMOEh921XkZtiFgF6tvMaaMD2RsYUypnSnIznllnBBvrn9Yss4RPJQvjcqShz5u9CC5a1EkmgFLOPLVhH0H0uvgntq3sHn//Al+dJihOwDyL9+3pT8T0yTvUe/9oAleZs/4GecFisB6wKBgCAs6KpdBRTMUHfWvv6Cp7XI4H5x4nJsBaZnffPKHlkwBrGDuOMfDDBMkkbvbFnV9P2IbXgqPQbc1285jOAFwYPIjAQSzFAo2sqTtfFBEpgTlV+cfOxhDYVXrma4rvmvgjQd5xf7otIy2slAkk2+58R6jatyAyhGO2ImL4anXEqxAoGBAJarZL5KA0nUc4LaQSRe0sAH02yWPSA3h3HGQidnmJq6+BjeBQamO0rCi1pQdwwmp+TQkfgKf5vK6FfkYIeL6bRvPvX71MfXSYeREejlFeaTLQZYy+w5yfRAdtVhce6Djl7DCiIl/e9FZevMoAMyhIuRju/xJrmgxhqL/Xv6G5yTAoGAIzczd3VZsc/3H/iWaC3uh7KESvEDTQ9OJRJp0VpJT7yce89hSNmjqWi8IM2vcRTbtFFPUouF3YpLAllFtTf2qWkyNhYgpZjIlaOj/m55sqvdanRwGOUOQY4dy8B2qW8viPPJmqHgzSBIZy7av+mjXiKQlGsGs7tM68RpomihA9g=";

    //** 支付宝公钥,切记不是生成的而至支付宝提供的 点击沙箱应用中 设置中可以看到
    public static String alipay_public_key = "复制公钥\n" +
            "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAhOR2rlL+mKRn4XVaTpUODf3vGR1suwUNK1Cn4KPKv0UiERyNemp8D74UDcl0+RG26zhdtIJT8FJ+ZpsFyinQzWOG4G105ylLyLYURZ1WqEsCjs7KR2hl3Ii23WrTITV7gR1FoKN2oTuwP/LTGWo1++k9D2fVi/5lzQX7yX/Ru2H+Y81NbiJCdavUDdeWbMoP5du5gFj9dFFR9GAmExgLmsGdioyuRvfL7+dzqxteHuf0RTCd0tJCpjyZt3ocrhRLkggaMxfRArVJjbez7ZjHANncJE2Psc/OfV/hlqgJdmGmuj8Rgub906E54l/v2kppsDx1xyeD0bixsDJz04SG8wIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8080/notify_url.jsp";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8080/return_url.jsp";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    //** 支付宝网关(默认提供的是真实环境的，我们需要找沙箱环境的)，点击沙箱应用查看支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

