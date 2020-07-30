package com.superkin.tcams.member.service;

import com.superkin.tcams.member.mapper.DeptMapper;
import com.superkin.tcams.member.pojo.Dept;
import com.superkin.tcams.member.pojo.DeptExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DeptServiceImpl implements DeptService {
    @Autowired
    private DeptMapper deptMapper;

    @Override
    public List<Dept> list() {
        return deptMapper.selectByExample(null);
    }

    @Override
    public List<Dept> listByName(String name) {
        DeptExample example = new DeptExample();
        DeptExample.Criteria criteria = example.createCriteria();
        criteria.andNameLike("%"+name+"%");
        return deptMapper.selectByExample(example);
    }

    @Override
    public Dept getById(int id) {
        return deptMapper.selectByPrimaryKey(id);
    }
}
