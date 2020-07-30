package com.superkin.tcams.activity.controller;

import com.github.pagehelper.PageInfo;
import com.superkin.tcams.activity.pojo.DeptActivity;
import com.superkin.tcams.activity.pojo.LargeActivity;
import com.superkin.tcams.activity.service.ActivityService;
import com.superkin.tcams.activity.service.DeptActivityService;
import com.superkin.tcams.member.pojo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/activity")
public class ActivityController {
    @Autowired
    private ActivityService activityService;


    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "type",required = false,defaultValue ="0") int type,
                       @RequestParam(value = "keyword",required = false,defaultValue ="") String keyword,
                       @RequestParam(value = "pageNum",required = false,defaultValue ="1") int pageNum){
        List<LargeActivity> list = activityService.list(type, keyword, pageNum);
        PageInfo<LargeActivity> page=new PageInfo<>(list);
        if(type==0){
            keyword="";
        }
        model.addAttribute("list",list);
        model.addAttribute("keyword",keyword);
        model.addAttribute("type",type);
        model.addAttribute("page",page);
        for (LargeActivity largeActivity : list) {
            model.addAttribute("status",largeActivity.getStatus());
        }
        return "list-activity";

    }


    @RequestMapping("/tosave")
    public String tosave(){
        return "save-largeActivity";
    }

    @RequestMapping("/save")
    @ResponseBody
    public String save(LargeActivity largeActivity){
        try {
            largeActivity.setStatus(0);
            int result = activityService.save(largeActivity);
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
    public String toupdate(Model model,int id,int pageNum){
        LargeActivity largeActivity = activityService.getById(id);
        model.addAttribute("largeActivity",largeActivity);
        model.addAttribute("pageNum",pageNum);
        return "update-largeActivity";

    }
    @RequestMapping("/update")
    @ResponseBody
    public String update(LargeActivity largeActivity){
        try {
            int result = activityService.update(largeActivity);
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
        int result = activityService.remove(integers);
        if(result>0){
            return "true";
        }
        return "false";


    }

}
