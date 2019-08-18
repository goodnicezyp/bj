package com.xkygame.ssm.utils;

import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.joda.time.Duration;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Author: Clarence
 * @Description:
 * @Date: 2019/3/19 21:32.
 */
public class JodaTimeUtil {

    public static final String STANDARD_FORMAT = "yyyy-MM-dd HH:mm:ss";
    public static final SimpleDateFormat DAY_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
    public static final String IDCARD_FORMAT = "yyyyMMdd";

    public static Date strToDate(String dateTimeStr,String formatStr){
        if(StringUtils.isEmpty(formatStr)){
            formatStr = STANDARD_FORMAT;
        }
        try {
            DateTimeFormatter dateTimeFormatter = DateTimeFormat.forPattern(formatStr);
            DateTime dateTime = dateTimeFormatter.parseDateTime(dateTimeStr);
            return dateTime.toDate();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String dateToStr(Date date,String formatStr){
        if(date == null){
            return StringUtils.EMPTY;
        }
        DateTime dateTime = new DateTime(date);
        return dateTime.toString(formatStr);
    }



    public static String dateToStr(Date date){
        if(date == null){
            return StringUtils.EMPTY;
        }
        DateTime dateTime = new DateTime(date);
        return dateTime.toString(STANDARD_FORMAT);
    }

    public static boolean isExpired(Date startDate,Date endDate){
        if(startDate == null || endDate == null){
            return false;
        }

        DateTime start = new DateTime(startDate);
        DateTime end = new DateTime(endDate);
        Duration duration = new Duration(start,end);
        return duration.getStandardSeconds() <= 0;
    }

    public static boolean isExpired(Date startDate,String endDate){
        if(startDate == null || StringUtils.isEmpty(endDate)){
            return false;
        }
        if("长期".equals(endDate)){
            return false;
        }

        DateTimeFormatter dateTimeFormatter = DateTimeFormat.forPattern(IDCARD_FORMAT);
        DateTime start = new DateTime(startDate);
        DateTime end = dateTimeFormatter.parseDateTime(endDate);
        Duration duration = new Duration(start,end);
        return duration.getStandardSeconds() <= 0;
    }

    public static long dateCompare(Date startDate,Date endDate){
        if(startDate == null || endDate == null){
            return 0;
        }

        DateTime start = new DateTime(DAY_FORMAT.format(startDate));
        DateTime end = new DateTime(DAY_FORMAT.format(endDate));
        Duration duration = new Duration(start,end);
        return duration.getStandardSeconds();
    }

    public static void main(String[] args) {
        System.out.println(isExpired(new Date(),"20200413"));
    }

}
