package com.xkygame.ssm.model;

import com.alibaba.fastjson.JSONObject;

/**
 * 返回的错误码和错误信息
 *
 * Created by will on 2016/5/16.
 */
public enum CodeEnums {

    success("1","操作成功"),

    /**
     * **************************************
     *
     * 错误
     *
     * **************************************
     */
    err1("-1", "参数有误"),
    err2("-2", "找不到该对象"),
    err3("-3", "操作失败"),
    err4("-4", "未登录"),
    ;

    private String errCode;
    private String errMsg;

    private CodeEnums(String errCode, String errMsg) {
        this.errCode = errCode;
        this.errMsg = errMsg;
    }

    public String getErrCode() {
        return errCode;
    }

    public void setErrCode(String errCode) {
        this.errCode = errCode;
    }

    public String getErrMsg() {
        return errMsg;
    }

    public void setErrMsg(String errMsg) {
        this.errMsg = errMsg;
    }


    public static JSONObject getCode(CodeEnums codeEnums) {
        JSONObject jsonObject = new JSONObject();

        jsonObject.put("errCode", codeEnums.getErrCode());
        jsonObject.put("errMsg", codeEnums.getErrMsg());

        return jsonObject;
    }

    public static JSONObject getSuccessCode(CodeEnums codeEnums, String errMsg) {
        JSONObject jsonObject = new JSONObject();

        jsonObject.put("errCode", codeEnums.getErrCode());
        jsonObject.put("errMsg", errMsg);

        return jsonObject;
    }

    public static JSONObject getErrorCode(CodeEnums codeEnums, String errMsg) {
        JSONObject jsonObject = new JSONObject();

        jsonObject.put("errCode", codeEnums.getErrCode());
        jsonObject.put("errMsg", errMsg);

        return jsonObject;
    }
}
