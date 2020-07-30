package com.superkin.tcams.financing.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.superkin.tcams.financing.pojo.Financing;
import com.superkin.tcams.financing.service.FinancingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/financing")
public class FinancingController {
    @Autowired
    private FinancingService financingService;

    @RequestMapping("/list")
    public String listJSON(Model model, @RequestParam(value = "pageNum",required = false,defaultValue ="1") int pageNum){
        PageHelper.startPage(pageNum,6);
        List<Financing> list = financingService.list();
        PageInfo<Financing> page=new PageInfo<>(list);
        model.addAttribute("listJSON", JSON.toJSONString(list));
        model.addAttribute("page",page);
        return "list-financing";

    }

    @RequestMapping("/listAll")
    public String list(Model model,
                       @RequestParam(value = "type",required = false,defaultValue ="0") int type,
                       @RequestParam(value = "keyword",required = false,defaultValue ="") String keyword,
                       @RequestParam(value = "pageNum",required = false,defaultValue ="1") int pageNum,
                       int status){

        List<Financing> list = financingService.list(type, keyword, pageNum, status);
        PageInfo<Financing> page=new PageInfo<>(list);
        if (type==0){
            keyword="";
        }
        model.addAttribute("list",list);
        model.addAttribute("page",page);
        model.addAttribute("type",type);
        model.addAttribute("keyword",keyword);
        if (status==1){
            return "list-approve";
        }
        if (status==2){
            return "list-pay";
        }
        if (status==3){
            return "list-payed";
        }
        return null;

    }


    @RequestMapping("/toapprove")
    public String toapprove(Model model,String id){
        Financing financing = financingService.getById(id);
        model.addAttribute("financing",financing);
        return "update-approve";
    }

    @RequestMapping("/approve")
    @ResponseBody
    public String approve(Financing financing){
        try {
            int result = financingService.update(financing);
            if(result>0){
                return "true";
            }
            return "false";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }


    }



}
