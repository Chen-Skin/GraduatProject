package com.superkin.tcams.activity.service;

import com.superkin.tcams.activity.pojo.DeptActivity;

import java.util.List;

public interface DeptActivityService {
    List<DeptActivity> listAll();
    List<DeptActivity> list(int dept,int type,String keyword,int pageNum);
    DeptActivity getById(int id);
    int save(DeptActivity deptActivity);
    int update(DeptActivity deptActivity);
    int remove(List<Integer> ids);
}
