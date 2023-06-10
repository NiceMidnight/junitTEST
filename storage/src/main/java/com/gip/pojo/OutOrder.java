package com.gip.pojo;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OutOrder {
	private Integer orderId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	@JSONField(format = "yyyy-MM-dd")
	private Date orderDate;
	private Integer orderCustomerId;
	private Integer orderStorageId;
	private Integer orderEmployeeId;
	private Integer orderProductId;
	private Integer orderProductNum;
	//额外字段
	//连表额外字段
	private String customerName;
	private String storageName;
	private String employeeName;
	private String productName;
}
