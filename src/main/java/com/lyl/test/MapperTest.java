package com.lyl.test;

import com.lyl.bean.Dept;
import com.lyl.bean.Emp;
import com.lyl.dao.DeptMapper;
import com.lyl.dao.EmpMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

//导入SpringTest模块
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    DeptMapper deptMapper;
    @Autowired
    EmpMapper empMapper;
    @Autowired
    SqlSession sqlSession;
    @Test
    public  void test1(){
//        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//        Dept dept = context.getBean(Dept.class);
//        System.out.println(deptMapper);
//        deptMapper.insertSelective(new Dept(null,"开发部"));
//        deptMapper.insertSelective(new Dept(null,"测试部"));
//        empMapper.insertSelective(new Emp(null,"lyl1","男","lyl1@qq.com",2));
        //批量插入多个数据
//        EmpMapper mapper = sqlSession.getMapper(EmpMapper.class);
//        for(int i=0;i<100;i++){
//            mapper.insertSelective(new Emp(null,"lyl"+i,"女","lyl@qq.com_"+i,2));
//        }
        empMapper.insertSelective(new Emp(null,"gayhao","女","gay@qq.com",1));
    }


}
