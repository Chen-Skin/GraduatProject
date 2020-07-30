package com.superkin.tcams.notice.controller;

import com.github.pagehelper.PageInfo;
import com.superkin.tcams.common.shiro.ShiroDbRealm;
import com.superkin.tcams.member.pojo.Member;
import com.superkin.tcams.notice.pojo.Notice;
import com.superkin.tcams.notice.service.NoticeService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/notice")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    @RequestMapping("/list")
    public String list(Model model,@RequestParam(value = "pageNum",required = false,defaultValue ="1") int pageNum){
        List<Notice> list = noticeService.list(pageNum);
        PageInfo<Notice> page=new PageInfo<>(list);
        model.addAttribute("list",list);
        model.addAttribute("page",page);
        return "list-notice";

    }

    @RequestMapping("/show")
    public String show(Model model,int id){
        Notice notice = noticeService.getById(id);
        model.addAttribute("notice",notice);
        return "show-notice";

    }



    @RequestMapping("/save")
    @ResponseBody
    public String save(Notice notice){
        Member member = (Member) SecurityUtils.getSubject().getSession().getAttribute(ShiroDbRealm.SESSION_USER_KEY);
        try {
            notice.setMemberFk(member.getId());
            int result = noticeService.save(notice);
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
        try {
            int result = noticeService.remove(integers);
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
