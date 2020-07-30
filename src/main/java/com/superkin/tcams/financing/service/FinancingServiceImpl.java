package com.superkin.tcams.financing.service;

import com.github.pagehelper.PageHelper;
import com.superkin.tcams.financing.mapper.FinancingMapper;
import com.superkin.tcams.financing.pojo.Financing;
import com.superkin.tcams.financing.pojo.FinancingExample;
import com.superkin.tcams.member.pojo.Member;
import com.superkin.tcams.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Service
public class FinancingServiceImpl implements FinancingService {
    @Autowired
    private FinancingMapper financingMapper;
    @Autowired
    private MemberService memberService;

    @Override
    public List<Financing> list() {
        return financingMapper.selectByExample(null);
    }

    @Override
    public List<Financing> list(int type, String keyword, int pageNum, int status) {
        FinancingExample  example=new FinancingExample();
        FinancingExample.Criteria criteria = example.createCriteria();
        if (type==1){//单号
            criteria.andIdLike("%"+keyword+"%");

        }
        if (type==2){//申请时间
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            try {
                criteria.andTimeEqualTo(dateFormat.parse(keyword));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        if (type==3){//申请人
            List<Member> members = memberService.listByName(keyword);
            List<Integer> ids=new ArrayList<>();
            if (members!=null&&members.size()>0){
                for (Member member : members) {
                    ids.add(member.getId());
                }

            }
            criteria.andMemberFkIn(ids);

        }
        criteria.andStatusEqualTo(status);
        PageHelper.startPage(pageNum,10);
        return financingMapper.selectByExample(example);
    }
    @Override
    public Financing getById(String id) {
        return financingMapper.selectByPrimaryKey(id);
    }
    @Override
    public int update(Financing financing) {
        return financingMapper.updateByPrimaryKeySelective(financing);
    }




}
