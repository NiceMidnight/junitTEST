package com.gip.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Employee {
	private Integer employeeId;
	private String employeeName;
	private String employeePassword;
	private Integer employeeSex;
	private String employeePhone;
	private Integer employeeRole;
//默认编码
	private String dictItemName;
}
