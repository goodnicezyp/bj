package com.xkygame.ssm.model;

/**
 * Created by will on 2015/10/9.
 */
public class SessionUser {
    private long id;
    private String name;
    private String phone;
    private String imgUrl;
    private String openid;
    private int subscribe;
    private int flag;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public int getSubscribe() {
        return subscribe;
    }

    public void setSubscribe(int subscribe) {
        this.subscribe = subscribe;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public SessionUser() {
    }

    public SessionUser(long id, String name, String phone, String imgUrl, String openid, int subscribe, int flag) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.imgUrl = imgUrl;
        this.openid = openid;
        this.subscribe = subscribe;
        this.flag = flag;
    }
    public SessionUser(long id, String name, String phone, String imgUrl, String openid, int subscribe) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.imgUrl = imgUrl;
        this.openid = openid;
        this.subscribe = subscribe;
        this.flag = flag;
    }
}
