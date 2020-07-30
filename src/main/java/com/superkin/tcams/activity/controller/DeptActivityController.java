package com.superkin.tcams.activity.controller;

import com.github.pagehelper.PageInfo;
import com.superkin.tcams.activity.pojo.LargeActivity;
import org.springframework.ui.Model;
import com.superkin.tcams.activity.pojo.DeptActivity;
import com.superkin.tcams.activity.service.DeptActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/deptActivity")
public class DeptActivityController {
    @Autowired
    private DeptActivityService deptActivityService;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "dept",required = false,defaultValue ="0")int dept,
                       @RequestParam(value = "type",required = false,defaultValue ="0") int type,
                       @RequestParam(value = "keyword",required = false,defaultValue ="") String keyword,
                       @RequestParam(value = "pageNum",required = false,defaultValue ="1") int pageNum){
        List<DeptActivity> deptActivities = deptActivityService.list(dept, type, keyword, pageNum);
        PageInfo<DeptActivity> page=new PageInfo<>(deptActivities);
        if(type==0){
            keyword="";
        }
        model.addAttribute("deptActivities",deptActivities);
        model.addAttribute("keyword",keyword);
        model.addAttribute("type",type);
        model.addAttribute("page",page);
        model.addAttribute("dept",dept);
        return "list-deptActivity";


    }



    @RequestMapping("/save")
    @ResponseBody
    public String save(DeptActivity deptActivity){
        try {
            int result = deptActivityService.save(deptActivity);
            if (result>0){
                return "true";
            }
            return "false";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }

    }

    @RequestMapping("/toupdate")
    public String toupdate(Model model,int id,int dept,int pageNum){
        DeptActivity deptActivity = deptActivityService.getById(id);
        model.addAttribute("deptActivity",deptActivity);
        model.addAttribute("pageNum",pageNum);
        model.addAttribute("dept",dept);
        return "update-deptActivity";

    }
    @RequestMapping("/update")
    @ResponseBody
    public String update(DeptActivity deptActivity){
        try {
            int result = deptActivityService.update(deptActivity);
            if (result>0){
                return "true";
            }
            return "false";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }

    }

    @RequestMapping("/remove")
    @ResponseBody
    public String remove(Integer[] ids){
        List<Integer> integers = Arrays.asList(ids);
        int result = deptActivityService.remove(integers);
        if(result>0){
            return "true";
        }
        return "false";


    }
}
