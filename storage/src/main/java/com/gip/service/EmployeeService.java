package com.gip.service;

import com.gip.pojo.Employee;

public interface EmployeeService {
	// 根据id查找员工
	Employee findEmployeeById(int id);

	// 更新员工数据
	int updateEmployeeById(Employee employee);

	//查询员工总数
	int countEmployee();

}
