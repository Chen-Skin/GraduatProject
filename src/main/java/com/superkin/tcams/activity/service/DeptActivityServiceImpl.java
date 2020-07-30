package com.superkin.tcams.activity.service;

import com.github.pagehelper.PageHelper;
import com.superkin.tcams.activity.mapper.DeptActivityMapper;
import com.superkin.tcams.activity.pojo.DeptActivity;
import com.superkin.tcams.activity.pojo.DeptActivityExample;
import com.superkin.tcams.member.pojo.Member;
import com.superkin.tcams.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class DeptActivityServiceImpl implements DeptActivityService {
    @Autowired
    private DeptActivityMapper deptActivityMapper;
    @Autowired
    private MemberService memberService;


    @Override
    public List<DeptActivity> listAll() {
        return deptActivityMapper.selectByExample(null);
    }

    @Override
    public List<DeptActivity> list(int dept, int type, String keyword, int pageNum) {
        DeptActivityExample example = new DeptActivityExample();
        DeptActivityExample.Criteria criteria = example.createCriteria();
        if (dept>10&&dept<50){
            criteria.andDeptFkEqualTo(dept);
        }
        if (type==1){//老师
            criteria.andTeacherLike("%"+keyword+"%");
        }
        if (type==2){//地点
            criteria.andPlaceLike("%"+keyword+"%");
        }
        if (type==3){//负责人
            List<Member> members = memberService.listByName(keyword);
            List<Integer> ids=new ArrayList<>();
            ids.add(0);
            if (members!=null&&members.size()>0){
                for (Member member : members) {
                    ids.add(member.getId());
                }
            }

            criteria.andMemberFkIn(ids);
        }
        PageHelper.startPage(pageNum,10);
        return deptActivityMapper.selectByExample(example);
    }

    @Override
    public DeptActivity getById(int id) {
        return deptActivityMapper.selectByPrimaryKey(id);
    }

    @Override
    public int save(DeptActivity deptActivity) {
        return deptActivityMapper.insert(deptActivity);
    }

    @Override
    public int update(DeptActivity deptActivity) {
        return deptActivityMapper.updateByPrimaryKeySelective(deptActivity);
    }

    @Override
    public int remove(List<Integer> ids) {
        DeptActivityExample example = new DeptActivityExample();
        DeptActivityExample.Criteria criteria = example.createCriteria();
        criteria.andIdIn(ids);
        return deptActivityMapper.deleteByExample(example);
    }


}
