package com.gip.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Supplier {
	private Integer supplierId;
	private String supplierName;
	private String supplierAddress;
	private String supplierPhone;
}
