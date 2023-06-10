package com.gip.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gip.mapper.EmployeeMapper;
import com.gip.pojo.Employee;
import com.gip.service.EmployeeService;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	EmployeeMapper employeeMapper;

	@Override
	public Employee findEmployeeById(int id) {
		return employeeMapper.findEmployeeById(id);
	}

	@Override
	public int updateEmployeeById(Employee employee) {
		return employeeMapper.updateEmployeeById(employee);
	}

	@Override
	public int countEmployee() {
		return employeeMapper.countEmployee();
	}

}
