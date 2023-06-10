package com.gip.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Storage {
    private Integer storageId;
    private String storageName;
    private String storageAddress;
    private String storagePhone;
}
