package com.superkin.tcams.activity.service;

import com.superkin.tcams.activity.pojo.LargeActivity;

import java.util.List;

public interface ActivityService {
    List<LargeActivity> listAll();
    List<LargeActivity> list(int type,String keyword,int pageNum);
    LargeActivity getById(int id);
    int save(LargeActivity largeActivity);
    int update(LargeActivity largeActivity);
    int remove(List<Integer> ids);
}
