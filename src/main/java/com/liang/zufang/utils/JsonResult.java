package com.liang.zufang.utils;

import java.io.Serializable;

/**
 * @author liuliang
 * @description 统一返回对象
 * @date 2019/5/7
 **/
public class JsonResult implements Serializable {

    private static final long serialVersionUID = -1064728938429836093L;

    private Boolean success;

    private String msg;

    public JsonResult(){}

    public JsonResult(Boolean success, String msg) {
        this.success = success;
        this.msg = msg;
    }

    public static JsonResult build(Boolean success, String msg){
        JsonResult jsonResult = new JsonResult(success,msg);
        return jsonResult;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
