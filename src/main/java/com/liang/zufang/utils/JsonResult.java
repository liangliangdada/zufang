package com.liang.zufang.utils;

/**
 * @author liuliang
 * @description 统一返回对象
 * @date 2019/5/7
 **/
public class JsonResult {

    private boolean success;

    private String msg;

    private Object data;

    public JsonResult(){}

    public JsonResult(boolean success, Object data) {
        this.success = success;
        this.data = data;
    }

    public JsonResult(boolean success, String msg) {
        this.success = success;
        this.msg = msg;
    }

    public static JsonResult resultMsg(boolean success,String msg){
        JsonResult result = new JsonResult(success, msg);
        return result;
    }

    public static JsonResult resultData(boolean success,Object data){
        JsonResult result = new JsonResult(success, data);
        return result;
    }

}
