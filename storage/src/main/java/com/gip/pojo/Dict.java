package com.gip.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @FileName Dict
 * @Description
 * @Author Tiamo_Null
 * @date 2023-05-31
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Dict {
    private Integer dictId;
    private Integer dictTypeCode;
    private String dictTypeName;
    private String dictItemName;
}
