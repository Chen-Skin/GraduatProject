package com.superkin.tcams.home.controller;

import com.superkin.tcams.home.pojo.Home;
import com.superkin.tcams.home.service.HomeService;
import com.superkin.tcams.member.pojo.Member;
import com.superkin.tcams.member.service.MemberService;
import com.superkin.tcams.notice.pojo.Notice;
import com.superkin.tcams.notice.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@RequestMapping
@Controller
public class HomeController {
    @Autowired
    private MemberService memberService;
    @Autowired
    private HomeService homeService;
    @Autowired
    private NoticeService noticeService;

    @RequestMapping
    public String list(Model model,@RequestParam(value = "pageNum",required = false,defaultValue ="1") int pageNum){
        Member member = memberService.getMember();
        Home home = homeService.getHOME();
        List<Notice> list = noticeService.listAll(pageNum);
        model.addAttribute("member",member);
        model.addAttribute("home",home);
        model.addAttribute("list",list);
        return "index";

    }
}
