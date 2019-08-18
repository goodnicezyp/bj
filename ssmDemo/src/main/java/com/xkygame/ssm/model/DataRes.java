package com.xkygame.ssm.model;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.io.Serializable;

/**
 * Created by will on 2017/2/19.
 * 描述 ：由服务端响应数据返回体
 */
public class DataRes implements Serializable{
    /**
     * 请求响应结果码
     */
    private String status;

    /**
     * 对响应的结果码进行具体描述
     */
    private String errmsg;

    /**
     * 附加数据
     */
    private String otherData;

    /**
     * 返回的请求数据
     */
    private JSONObject result;

    /**
     * 返回的请求数据
     */
    private JSONObject otherRes;

    /**
     * 返回的列表数据
     */
    private JSONArray arrayresult;
    private JSONArray list;

    public DataRes(String status, String errmsg, JSONObject result) {
        this.status = status;
        this.errmsg = errmsg;
        this.result = result;
    }
    public DataRes(CodeEnums codeEnums, String errmsg, JSONObject result) {
        this.status = codeEnums.getErrCode();
        this.errmsg = errmsg;
        this.result = result;
    }

    public DataRes(CodeEnums codeEnums, JSONObject result, String otherData) {
        this.status = codeEnums.getErrCode();
        this.otherData = otherData;
        this.errmsg = codeEnums.getErrMsg();
        this.result = result;
    }

    public DataRes(CodeEnums codeEnums, JSONArray arrayresult) {
        this.status = codeEnums.getErrCode();
        this.errmsg = codeEnums.getErrMsg();
        this.arrayresult = arrayresult;
    }

    public DataRes(CodeEnums codeEnums, JSONObject result, JSONArray arrayresult) {
        this.status = codeEnums.getErrCode();
        this.errmsg = codeEnums.getErrMsg();
        this.result = result;
        this.arrayresult = arrayresult;
    }

    public DataRes(CodeEnums codeEnums, String errmsg, JSONObject result, JSONArray arrayresult) {
        this.status = codeEnums.getErrCode();
        this.errmsg = errmsg;
        this.result = result;
        this.arrayresult = arrayresult;
    }

    public DataRes(CodeEnums codeEnums, JSONObject result) {
        this.status = codeEnums.getErrCode();
        this.errmsg = codeEnums.getErrMsg();
        this.result = result;
    }

    public DataRes(CodeEnums codeEnums, String errmsg) {
        this.status = codeEnums.getErrCode();
        this.errmsg = errmsg;
    }

    public DataRes(CodeEnums codeEnums) {
        this.status = codeEnums.getErrCode();
        this.errmsg = codeEnums.getErrMsg();
    }

    public DataRes(CodeEnums codeEnums, String errmsg, JSONObject result, JSONArray arrayresult, JSONArray list) {
        this.status = codeEnums.getErrCode();
        this.errmsg = errmsg;
        this.result = result;
        this.arrayresult = arrayresult;
        this.list = list;
    }

    public DataRes(CodeEnums codeEnums, JSONArray arrayresult, JSONArray list) {
        this.status = codeEnums.getErrCode();
        this.errmsg = codeEnums.getErrMsg();
        this.arrayresult = arrayresult;
        this.list = list;
    }

    public DataRes(CodeEnums codeEnums, String errmsg, JSONObject otherRes, JSONObject result) {
        this.status = codeEnums.getErrCode();
        this.errmsg = errmsg;
        this.result = result;
        this.otherRes = otherRes;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getErrmsg() {
        return errmsg;
    }

    public void setErrmsg(String errmsg) {
        this.errmsg = errmsg;
    }

    public JSONObject getResult() {
        return result;
    }

    public void setResult(JSONObject result) {
        this.result = result;
    }

    public JSONArray getArrayresult() {
        return arrayresult;
    }

    public void setArrayresult(JSONArray arrayresult) {
        this.arrayresult = arrayresult;
    }

    public String getOtherData() {
        return otherData;
    }

    public void setOtherData(String otherData) {
        this.otherData = otherData;
    }

    public JSONObject getOtherRes() {
        return otherRes;
    }

    public void setOtherRes(JSONObject otherRes) {
        this.otherRes = otherRes;
    }

    public JSONArray getList() {
        return list;
    }

    public void setList(JSONArray list) {
        this.list = list;
    }
}
