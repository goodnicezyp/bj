package com.xkygame.ssm.utils;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.util.Map;
import java.util.Random;

/**
 * Created by will on 2016/5/19.
 */
public class CommonUtil {
    private static Logger log = LogManager.getLogger(LogManager.ROOT_LOGGER_NAME);

    public static final long ONE_DAY_TIMESTAMP = 86400000;
    public static final String[] colorArr = {"#C23531","#2F4554","#5EB95E","#5A98DE","#61A0A8","#E062AE","#F37B1D","#6E7074","#546570","#FF0012","#CA8622","#D48265"};

    public static String getIp(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)) {
            //多次反向代理后会有多个ip值，第一个ip才是真实ip
            int index = ip.indexOf(",");
            if (index != -1) {
                return ip.substring(0, index);
            } else {
                return ip;
            }
        }
        ip = request.getHeader("X-Real-IP");
        if (StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)) {
            return ip;
        }
        return request.getRemoteAddr();
    }

    public static String genRandomNum(){
        int  maxNum = 36;
        int i;
        int count = 0;
        char[] str = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
                'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
                'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
        StringBuffer pwd = new StringBuffer("");
        Random r = new Random();
        while(count < 8){
            i = Math.abs(r.nextInt(maxNum));
            if (i >= 0 && i < str.length) {
                pwd.append(str[i]);
                count ++;
            }
        }
        return pwd.toString();
    }

    /**
     * 获取十六进制的颜色代码.例如  "#6E36B4" , For echarts ,
     * @return String
     * @param size
     * @param isLast
     */
    public static String getRandColorCode(int size, boolean isLast){
        if(isLast){
            return "#ff0000";
        }

        if(size < 11){
            return colorArr[size];
        }

        String r,g,b;
        Random random = new Random();
        r = Integer.toHexString(194).toUpperCase();
        g = Integer.toHexString(random.nextInt(256)).toUpperCase();
        b = Integer.toHexString(random.nextInt(256)).toUpperCase();

        r = r.length()==1 ? "0" + r : r ;
        g = g.length()==1 ? "0" + g : g ;
        b = b.length()==1 ? "0" + b : b ;

        return "#" + r+g+b;
    }

    public static String convertSearchKey(String key,Map<String,Object> map){
        if(!"".equals(key)){
            try {
                log.info("搜索内容未转码是：" + key);
                key = URLDecoder.decode(URLDecoder.decode(key, "UTF-8"), "UTF-8");
                key = StringEscapeUtils.escapeJava(key); //转成Unicode编码
                key = key.replaceAll("\\\\","%");
                key = "%" + key + "%";
                log.info("搜索内容是：" + key);

                if(map != null){
                    map.put("searchVal", "%"+ key +"%");
                }
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        return key;
    }

    public static void main(String[] args) throws ParseException {
        String tem = "EKkQDA+\n" +
                "MRcwFQYDVQQDDA5DaGluYSBUU0EgUm9vdDEjMCEGA1UECgwaQ2hpbmEgVGltZS1TdGFtcCBBdXRo\n" +
                "b3JpdHkCEAEXLCO77jqaPV+XX5t1kQEwDQYJKoZIhvcNAQEBBQAEgYBn01wbPRQxF8MeKr398Yfd\n" +
                "l4uzu4wblVZ6xmHZVFQ35s1FLOWPx8ghJi2ihsp+1O34F8M6a+F+7bO39zHN215TGhIIkJtvNN57\n" +
                "7pOJOCuMLPGMnclpJF1C7CoRp+wSMRIlH3J+6F6f2RzqruGMRXFqK9LThTM2NHFNqulaAElTmgAA\n" +
                "AAA=";
        JSONObject res = JSONObject.parseObject(tem);
//        res.put("timestamp","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");

        System.out.println(res.getString("timestamp"));
    }


}
