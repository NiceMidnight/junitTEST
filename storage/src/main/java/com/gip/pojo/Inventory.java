package com.gip.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Inventory {
    private Integer productId;
    private Integer storageId;
    private Integer productNum;

    //链接补充字段
    private String productName;
    private String storageName;
    private String productType;
    private String dictItemName;
}
