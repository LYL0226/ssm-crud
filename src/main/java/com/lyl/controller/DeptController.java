package com.lyl.controller;

import com.lyl.bean.Dept;
import com.lyl.bean.Emp;
import com.lyl.bean.Msg;
import com.lyl.service.DeptService;
import com.lyl.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DeptController {
    @Autowired
    private DeptService deptService;
    @Autowired
    private EmployeeService employeeService;
    //返回所有部门信息
    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
        List<Dept> list = deptService.getDepts();
        return Msg.success().add("depts",list);
    }

}
