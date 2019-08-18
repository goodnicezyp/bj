package com.xkygame.ssm.utils;

import java.io.File;

/**
 * Created by will on 2016/7/7.
 */
public class FileFolderUtil {
    public static String getFileUrl() {
        String dateStr = DateUtil.generateTimeStamp();
        dateStr = dateStr.substring(0, 8);
        return dateStr;
    }

    public static void isExist(String path) {
        File file = new File(path);
        if (!file.exists() && !file.isDirectory()) {
            file.mkdir();
        }
    }
    public static void isExists(String path) {
        File file = new File(path);
        if (!file.exists() && !file.isDirectory()) {
            file.mkdirs();
        }
    }

    public static void isDeletedFile(String path) {
        File file = new File(path);
        if (file.exists() && !file.isDirectory()) {
            file.delete();
            System.out.println("文件已删除");
        }
    }
}
