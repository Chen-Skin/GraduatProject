package com.superkin.tcams.activity.service;

import com.github.pagehelper.PageHelper;
import com.superkin.tcams.activity.mapper.LargeActivityMapper;
import com.superkin.tcams.activity.pojo.LargeActivity;
import com.superkin.tcams.activity.pojo.LargeActivityExample;
import com.superkin.tcams.member.pojo.Dept;
import com.superkin.tcams.member.pojo.Member;
import com.superkin.tcams.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ActivityServiceImpl implements ActivityService {
    @Autowired
    private LargeActivityMapper largeActivityMapper;
    @Autowired
    private MemberService memberService;


    @Override
    public List<LargeActivity> listAll() {
        return largeActivityMapper.selectByExample(null);
    }

    @Override
    public List<LargeActivity> list(int type, String keyword, int pageNum) {
        LargeActivityExample example = new LargeActivityExample();
        LargeActivityExample.Criteria criteria = example.createCriteria();
        if (type==1){//主题
            criteria.andTitleLike("%"+keyword+"%");
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
        PageHelper.startPage(pageNum,3);
        return largeActivityMapper.selectByExample(example);
    }

    @Override
    public LargeActivity getById(int id) {
        return largeActivityMapper.selectByPrimaryKey(id);
    }

    @Override
    public int save(LargeActivity largeActivity) {
        return largeActivityMapper.insert(largeActivity);
    }

    @Override
    public int update(LargeActivity largeActivity) {
        return largeActivityMapper.updateByPrimaryKeySelective(largeActivity);
    }

    @Override
    public int remove(List<Integer> ids) {
        LargeActivityExample example = new LargeActivityExample();
        LargeActivityExample.Criteria criteria = example.createCriteria();
        criteria.andIdIn(ids);
        return largeActivityMapper.deleteByExample(example);
    }
}
