package com.superkin.tcams.reimbursement.service;

import com.superkin.tcams.financing.pojo.Financing;

import java.util.List;

public interface ReimbursementService {
    List<Financing> list(int type, String keyeord, int pageNum);
    Financing getById(String id);
    int save(Financing financing);
    int update(Financing financing);
    int remove(String id);
}
