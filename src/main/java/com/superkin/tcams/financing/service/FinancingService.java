package com.superkin.tcams.financing.service;

import com.superkin.tcams.financing.pojo.Financing;

import java.util.List;

public interface FinancingService {
    List<Financing> list();
    List<Financing> list(int type,String keyword,int pageNum,int status);
    Financing getById(String id);
    int update(Financing financing);
}
