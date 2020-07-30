package com.superkin.tcams.member.controller;

import com.alibaba.fastjson.JSON;
import com.superkin.tcams.member.pojo.Position;
import com.superkin.tcams.member.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("/position")
@Controller
public class PositionController {
    @Autowired
    private PositionService positionService;

    @ResponseBody
    @RequestMapping("/listJSON")
    public String listPosition(){
        List<Position> list = positionService.list();
        return JSON.toJSONString(list);

    }



}
