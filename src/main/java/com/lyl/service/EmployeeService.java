package com.lyl.service;

import com.lyl.bean.Emp;
import com.lyl.bean.EmpExample;
import com.lyl.bean.EmpExample.Criteria;
import com.lyl.dao.EmpMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    EmpMapper empMapper;
    public List<Emp> getEmps() {
        //查询所有
        return empMapper.selectByExampleWithDept(null);

    }

    public void saveEmp(Emp emp) {
        empMapper.insertSelective(emp);
    }

    //检查用户名是否可用
    public boolean checkUser(String name) {
        EmpExample empExample = new EmpExample();
        Criteria criteria = empExample.createCriteria();
        criteria.andLastNameEqualTo(name);
        long count = empMapper.countByExample(empExample);
        return count == 0;
    }
    //按id查询员工
    public Emp getEmp(Integer id) {
        Emp emp = empMapper.selectByPrimaryKey(id);

        return emp;
    }

    public void updateEmp(Emp emp) {
        empMapper.updateByPrimaryKeySelective(emp);
    }

    public void deleteEmpById(Integer id) {
        empMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> ids) {
        EmpExample empExample = new EmpExample();
        Criteria criteria = empExample.createCriteria();
        criteria.andIdIn(ids);
        empMapper.deleteByExample(empExample);
    }
}
