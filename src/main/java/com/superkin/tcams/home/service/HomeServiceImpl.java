package com.superkin.tcams.home.service;

import com.superkin.tcams.home.mapper.HomeMapper;
import com.superkin.tcams.home.pojo.Home;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HomeServiceImpl implements HomeService {
    @Autowired
    private HomeMapper homeMapper;


    @Override
    public Home getHOME() {
        List<Home> homes = homeMapper.selectByExample(null);
        if (homes!=null&&homes.size()>0){
          return   homes.get(0);
        }

        return null;
    }
}
