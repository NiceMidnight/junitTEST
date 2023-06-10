package com.gip.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	private Integer productId;
	private String productName;
	private Integer productType;
	//额外字段
	private String dictItemName;
}
