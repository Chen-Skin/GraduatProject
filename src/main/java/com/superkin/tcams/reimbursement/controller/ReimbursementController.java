package com.superkin.tcams.reimbursement.controller;

import com.github.pagehelper.PageInfo;
import com.superkin.tcams.financing.pojo.Financing;
import com.superkin.tcams.reimbursement.service.ReimbursementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/reimbursement")
public class ReimbursementController {
    @Autowired
    private ReimbursementService reimbursementService;

    @RequestMapping("/list")
    public String list(){
        return "list-reimbursement";
    }
    @RequestMapping("/listMy")
    public String listMy(Model model,
                         @RequestParam(value = "type",required = false,defaultValue ="0") int type,
                         @RequestParam(value = "keyword",required = false,defaultValue ="") String keyword,
                         @RequestParam(value = "pageNum",required = false,defaultValue ="1") int pageNum){
        List<Financing> list = reimbursementService.list(type, keyword, pageNum);
        PageInfo<Financing> page=new PageInfo<>(list);
        if (type==0){
            keyword="";
        }
        model.addAttribute("list",list);
        model.addAttribute("page",page);
        model.addAttribute("type",type);
        model.addAttribute("keyword",keyword);
        return "list-myReimbursement";
    }

    @RequestMapping("/save")
    @ResponseBody
    public String save(Financing financing){
        try {
            int result = reimbursementService.save(financing);
            if (result>0){
                return "true";
            }
            return "false";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }

    }

    @RequestMapping("/toupdate")
    public String toupdate(Model model,String id,int pageNum){
        Financing financing = reimbursementService.getById(id);
        model.addAttribute("financing",financing);
        model.addAttribute("pageNum",pageNum);
        return "update-myReimbursement";
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(Financing financing){
        try {
            int result = reimbursementService.update(financing);
            if(result>0){
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
    public String remove(String id){
        try {
            int result = reimbursementService.remove(id);
            if (result>0){
                return "true";
            }
            return "false";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

}
