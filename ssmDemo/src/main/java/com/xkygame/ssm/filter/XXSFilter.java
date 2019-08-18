package com.xkygame.ssm.filter;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;

/**
 * @Author: Clarence
 * @Description:
 * @Date: 2017/9/11 16:38.
 */
public class XXSFilter implements Filter {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        //flag = true 只做URL验证; flag = false 做所有字段的验证;
        boolean flag = true;
        if(flag){
            //只对URL做xss校验
            HttpServletRequest httpServletRequest = (HttpServletRequest) request;
            HttpServletResponse httpServletResponse = (HttpServletResponse) response;

            String requesturi = httpServletRequest.getRequestURL().toString();
            requesturi = URLDecoder.decode(requesturi, "UTF-8");
            if(requesturi != null && requesturi.contains("alipay_hotel_book_return.html")){
                chain.doFilter(request, response);
                return;
            }
            if(requesturi!=null && requesturi.contains("account_bank_return.html")){
                chain.doFilter(request, response);
                return;
            }
            if(requesturi!=null && requesturi.contains("/alipay/activity.html")){
                chain.doFilter(request, response);
                return ;
            }
            if(requesturi!=null && requesturi.contains("/alipayLogin.html")){
                chain.doFilter(request, response);
                return ;
            }
            RequestWrapper rw = new RequestWrapper(httpServletRequest);
            String param = httpServletRequest.getQueryString();
            if(!"".equals(param) && param != null) {
                param = URLDecoder.decode(param, "UTF-8");
                String originalurl = requesturi + param;

                String sqlParam = param;
                //添加sql注入的判断
                if(requesturi.endsWith("/askQuestion.html") || requesturi.endsWith("/member/answer.html")){
                    sqlParam = rw.cleanSQLInject(param);
                }

                String xssParam = rw.cleanXSS(sqlParam);
                requesturi += "?"+xssParam;


                if(!xssParam.equals(param)){
                    logger.info("requesturi::::::"+requesturi);
                    httpServletResponse.sendRedirect(requesturi);
                    logger.info("no entered.");
//                  chain.doFilter(new RequestWrapper((HttpServletRequest) servletrequest), servletresponse);
                    return ;
                }
            }
            chain.doFilter(request, response);
        }else{

            //对请求中的所有东西都做校验，包括表单。此功能校验比较严格容易屏蔽表单正常输入，使用此功能请注意。
            chain.doFilter(new RequestWrapper((HttpServletRequest) request), response);
        }
    }

    public void destroy() {

    }

}
