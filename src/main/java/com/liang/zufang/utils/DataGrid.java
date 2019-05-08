package com.liang.zufang.utils;

import java.io.Serializable;
import java.util.List;

/**
 * @author liuliang
 * @description 数据表格
 * @date 2019/5/8
 **/
public class DataGrid implements Serializable {

    private static final long serialVersionUID = 1482318633002832245L;

    private Integer code;

    private String msg;

    private long count;

    private List data;

    public DataGrid(){}

    public DataGrid(long count, List data) {
        this.count = count;
        this.data = data;
    }

    public static DataGrid build(List data,long count){
        return new DataGrid(count, data);
    }

    public Integer getCode() {
        return code==null?0:code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }

    public List getData() {
        return data;
    }

    public void setData(List data) {
        this.data = data;
    }
}
