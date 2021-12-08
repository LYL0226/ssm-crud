package com.lyl.service;

import com.lyl.bean.Dept;
import com.lyl.dao.DeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DeptService {
    @Autowired
    private DeptMapper deptMapper;
    public List<Dept> getDepts() {
        return deptMapper.selectByExample(null);
    }
}
