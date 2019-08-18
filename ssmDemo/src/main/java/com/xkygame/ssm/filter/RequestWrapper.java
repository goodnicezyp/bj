package com.xkygame.ssm.filter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by 24537 on 2017/9/11.
 */
public final class RequestWrapper extends HttpServletRequestWrapper {
    private static Logger logger = LoggerFactory.getLogger(RequestWrapper.class);

    public RequestWrapper() {
        super(null);
    }

    public RequestWrapper(HttpServletRequest httpservletrequest) {
        super(httpservletrequest);
    }

    public String[] getParameterValues(String s) {
        String str[] = super.getParameterValues(s);
        if (str == null) {
            return null;
        }
        int i = str.length;
        String as1[] = new String[i];
        for (int j = 0; j < i; j++) {
            as1[j] = cleanXSS(cleanSQLInject(str[j]));
        }

        return as1;
    }

    public String getParameter(String s) {
        String s1 = super.getParameter(s);
        if (s1 == null) {
            return null;
        } else {
            return cleanXSS(cleanSQLInject(s1));
        }
    }

    public String getHeader(String s) {
        String s1 = super.getHeader(s);
        if (s1 == null) {
            return null;
        } else {
            return cleanXSS(cleanSQLInject(s1));
        }
    }

    static String cleanXSS(String src) {
        String temp = src.toLowerCase();

        logger.info("xss---temp-->" + src);
        src = src.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
        // if (src.indexOf("address")==-1)
        //	{
        src = src.replaceAll("\\(", "&#40;").replaceAll("\\)", "&#41;");
        //}

        src = src.replaceAll("'", "&#39;");

        Pattern pattern = Pattern.compile("(eval\\((.*)\\)|script)", Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(src);
        src = matcher.replaceAll("");

        pattern = Pattern.compile("[\\\"\\'][\\s]*javascript:(.*)[\\\"\\']", Pattern.CASE_INSENSITIVE);
        matcher = pattern.matcher(src);
        src = matcher.replaceAll("\"\"");

        //增加脚本
        src = src.replaceAll("script", "").replaceAll(";", "")
                .replaceAll("\"", "").replaceAll("@", "")
                .replaceAll("0x0d", "")
                .replaceAll("0x0a", "").replaceAll(",", "");

        if (!temp.equalsIgnoreCase(src)) {
            logger.info("输入信息存在xss攻击！");
            logger.info("原始输入信息-->" + temp);
            logger.info("处理后信息-->" + src);
            src = "";
        }
        return src;
    }

    //需要增加通配，过滤大小写组合
    public String cleanSQLInject(String src) {
        String temp = src.toLowerCase();
        src = src.replaceAll("insert", "forbidI")
                .replaceAll("select", "forbidS")
                .replaceAll("update", "forbidU")
                .replaceAll("delete", "forbidD")
                .replaceAll("and", "forbidA")
                .replaceAll("or", "forbidO");

        if (!temp.equals(src)) {
            logger.info("输入信息存在SQL攻击！");
            logger.info("原始输入信息-->" + temp);
            logger.info("处理后信息-->" + src);
        }
        return src;
    }
}
