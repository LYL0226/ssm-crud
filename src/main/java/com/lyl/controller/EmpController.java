package com.lyl.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lyl.bean.Emp;
import com.lyl.bean.Msg;
import com.lyl.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//处理crud
@Controller
public class EmpController {

    @Autowired
    EmployeeService employeeService;

    @RequestMapping(value="/emp/{id}",method=RequestMethod.PUT)
    @ResponseBody
    public Msg saveEmp(Emp emp){
        employeeService.updateEmp(emp);
        return Msg.success();
    }

    //检查用户是否可用
    @RequestMapping("/checkUser")
    @ResponseBody
    public Msg checkUser(@RequestParam("name")String name){
        //先判断用户名的格式
        String regName = "(^[a-zA-Z0-9_-]{3,16}$)|(^[u2E80-\u9FFF]{2,5})";
        if(!name.matches(regName)){
            return Msg.fail().add("va_msg","用户名必须是6~16的数字和字母组合或2~5个中文");
        }
        boolean result = employeeService.checkUser(name);
        if(result){
            return Msg.success();
        }else{
            return Msg.fail().add("va_msg","用户名不可用");
        }
    }
    //员工保存 加上JSR303校验 （导入hibernate-Validator，
    //                      在需要校验的类属性上加入Pattern注解，
    //                      在控制器方法上加入注解@Valid和参数BindingResult封装结果
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Emp emp, BindingResult result){
        if(result.hasErrors()){
            Map<String,Object> map = new HashMap<String, Object>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError error : errors) {
                map.put(error.getField(),error.getDefaultMessage());
            }
            return Msg.fail().add("errorFields",map);
        }else{
        employeeService.saveEmp(emp);
        return Msg.success();
        }
    }
//    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value="pn",defaultValue = "1")Integer pn,Model model){
        //传入页码，以及每页的大小
        PageHelper.startPage(pn,5);
        //后面的查询就是分页查询
        List<Emp> emps = employeeService.getEmps();
        //使用pageInfo包装查询后的结果
        PageInfo page = new PageInfo(emps,5);

        model.addAttribute("pageInfo",page);
        return "list";
    }
    //查询所有员工
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsByJSON(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,5);
        List<Emp> emps = employeeService.getEmps();
        PageInfo pageInfo = new PageInfo(emps, 5);
        return Msg.success().add("pageInfo",pageInfo);
    }
    @RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id")Integer id){
        Emp emp = employeeService.getEmp(id);
        return Msg.success().add("emp",emp);
    }
//
//    @RequestMapping(value="/emp/{id}",method=RequestMethod.DELETE)
//    @ResponseBody
//    public Msg deleteEmpForOne(@PathVariable("id")Integer id){
//        employeeService.deleteEmpById(id);
//        return Msg.success();
//    }

    @RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmpForAll(@PathVariable("ids")String ids){
        if(ids.contains("_")){
            List<Integer> del_ids = new ArrayList<Integer>();
            String[] str = ids.split("_");
            for (String s : str) {
                Integer each_id = Integer.parseInt(s);
                del_ids.add(each_id);
            }
            employeeService.deleteBatch(del_ids);
        }else{
            Integer id = Integer.parseInt(ids);
            employeeService.deleteEmpById(id);
        }
        return Msg.success();
    }
}
