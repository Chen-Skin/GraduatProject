package com.superkin.tcams.reimbursement.service;

import com.github.pagehelper.PageHelper;
import com.superkin.tcams.common.shiro.ShiroDbRealm;
import com.superkin.tcams.common.utils.PinyinHelperUtil;
import com.superkin.tcams.financing.mapper.FinancingMapper;
import com.superkin.tcams.financing.pojo.Financing;
import com.superkin.tcams.financing.pojo.FinancingExample;
import com.superkin.tcams.member.pojo.Member;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class ReimbursementServiceImpl implements ReimbursementService {
    @Autowired
    private FinancingMapper financingMapper;

    @Override
    public int save(Financing financing) {
        Member member = (Member) SecurityUtils.getSubject().getSession().getAttribute(ShiroDbRealm.SESSION_USER_KEY);
        String name = PinyinHelperUtil.getPinYinHeadChar(member.getName());
        String time = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
        String num = String.valueOf(Math.random()).substring(3, 7);
        String id="BX"+name+time+num;
        financing.setId(id);
        financing.setStatus(1);
        financing.setMemberFk(member.getId());
        return financingMapper.insert(financing);
    }

    @Override
    public List<Financing> list(int type, String keyeord, int pageNum) {
        Member member = (Member) SecurityUtils.getSubject().getSession().getAttribute(ShiroDbRealm.SESSION_USER_KEY);
        FinancingExample  example=new FinancingExample();
        FinancingExample.Criteria criteria = example.createCriteria();
        if (type==1){//单号
            criteria.andIdLike("%"+keyeord+"%");

        }
        if (type==2){//申请时间
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            try {
                criteria.andTimeEqualTo(dateFormat.parse(keyeord));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        criteria.andMemberFkEqualTo(member.getId());
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

    @Override
    public int remove(String id) {
        return financingMapper.deleteByPrimaryKey(id);
    }
}
