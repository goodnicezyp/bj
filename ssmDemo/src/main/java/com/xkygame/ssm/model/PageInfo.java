package com.xkygame.ssm.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by 24537 on 2017/3/20.
 */
public class PageInfo<T> implements Serializable {
    private static final long serialVersionUID=1L;

    private int recordsTotal; //总页数
    private int recordsFiltered; //过滤后的总页数，没有过滤则为总页数
    private int draw; //查询计数 暂时不做业务需求
    private String error; //错误信息
    private List<T> data; //list数据

    @Override
    public String toString() {
        return "PageInfo{" +
                "recordsTotal=" + recordsTotal +
                ", recordsFiltered=" + recordsFiltered +
                ", draw=" + draw +
                ", error='" + error + '\'' +
                ", data=" + data +
                '}';
    }

    public int getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(int recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public int getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(int recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    public int getDraw() {
        return draw;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public List<T> getData() {
        if(data == null){
            data = new ArrayList(Arrays.asList());
        }
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public PageInfo() {
    }

    public PageInfo(int recordsTotal, int recordsFiltered, int draw, String error, List<T> data) {
        this.recordsTotal = recordsTotal;
        this.recordsFiltered = recordsFiltered;
        this.draw = draw;
        this.error = error;
        this.data = data;
    }
}
