package com.superkin.tcams.member.service;

import com.superkin.tcams.member.pojo.Dept;

import java.util.List;

public interface DeptService {
    List<Dept> list();
    List<Dept> listByName(String name);
    Dept getById(int id);
}
