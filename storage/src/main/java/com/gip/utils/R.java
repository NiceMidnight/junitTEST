package com.gip.utils;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Value;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class R {
    /**响应编码*/
    private int code;
    /**响应消息*/
    private String msg;
    /**数据总量*/
    private int count;
    /**数据*/
    private Object data;
    //状态
    private String status;
}
