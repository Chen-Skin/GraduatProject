package com.superkin.tcams.member.controller;

import com.alibaba.fastjson.JSON;
import com.superkin.tcams.member.pojo.Dept;
import com.superkin.tcams.member.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/dept")
public class DeptController {
    @Autowired
    private DeptService deptService;

    @RequestMapping("/listJSON")
    @ResponseBody
    public String listDept(){
        List<Dept> list = deptService.list();
        return JSON.toJSONString(list);
    }
    @RequestMapping("/getById")
    @ResponseBody
    public String getById(int id){
        Dept dept = deptService.getById(id);
        return JSON.toJSONString(dept);
    }


}
