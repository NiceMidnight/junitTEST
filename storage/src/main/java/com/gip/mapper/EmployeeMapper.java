package com.gip.mapper;

import com.gip.pojo.Employee;

public interface EmployeeMapper {
	// 根据id查找员工
	Employee findEmployeeById(int id);

	// 修改员工
	int updateEmployeeById(Employee employee);

	//查询员工总数
	int countEmployee();
}
