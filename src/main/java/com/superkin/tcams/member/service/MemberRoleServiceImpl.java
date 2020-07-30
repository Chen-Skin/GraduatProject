package com.superkin.tcams.member.service;

import com.superkin.tcams.member.mapper.MemberRoleMapper;
import com.superkin.tcams.member.pojo.MemberRole;
import com.superkin.tcams.member.pojo.MemberRoleExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MemberRoleServiceImpl implements MemberRoleService {
    @Autowired
    private MemberRoleMapper memberRoleMapper;
    @Override
    public int save(List<MemberRole> memberRole) {
        if (memberRole!=null&&memberRole.size()>0){
            for (MemberRole role : memberRole) {
                if (role!=null&&role.getRoleFk()!=null){
                    memberRoleMapper.insert(role);
                }
            }
        }
        return 1;
    }

    @Override
    public List<Integer> listByMemberfk(int member_fk) {
        List<Integer> rolefks=new ArrayList<>();
        rolefks.add(0);
        MemberRoleExample example = new MemberRoleExample();
        MemberRoleExample.Criteria criteria = example.createCriteria();
        criteria.andMemberFkEqualTo(member_fk);
        List<MemberRole> memberRoles = memberRoleMapper.selectByExample(example);
        for (MemberRole memberRole : memberRoles) {
            rolefks.add(memberRole.getRoleFk());
        }

        return rolefks;
    }

    @Override
    public int remove(int member_fk) {
        MemberRoleExample example = new MemberRoleExample();
        MemberRoleExample.Criteria criteria = example.createCriteria();
        criteria.andMemberFkEqualTo(member_fk);
        return memberRoleMapper.deleteByExample(example);
    }

    @Override
    public int update(MemberRole memberRole) {
        return memberRoleMapper.updateByPrimaryKeySelective(memberRole);
    }
}
