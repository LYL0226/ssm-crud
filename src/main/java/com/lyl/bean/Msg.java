package com.lyl.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {
    //状态码  200成功 404失败
    private int code;
    //信息
    private String msg;
    private Map<String,Object> map = new HashMap<String, Object>();

    public static Msg success(){
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("成功");
        return result;
    }
    public static Msg fail(){
        Msg result = new Msg();
        result.setCode(404);
        result.setMsg("失败");
        return result;
    }

    public Msg add(String key,Object value){
        this.getMap().put(key,value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }
}
