package com.superkin.tcams.member.service;

import com.github.pagehelper.PageHelper;
import com.superkin.tcams.member.mapper.MemberMapper;
import com.superkin.tcams.member.pojo.Dept;
import com.superkin.tcams.member.pojo.Member;
import com.superkin.tcams.member.pojo.MemberExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MemberServiceImpl implements MemberService{

    @Autowired
    private MemberMapper memberMapper;
    @Autowired
    private DeptService deptService;

    @Override
    public List<Member> listAll() {
        return memberMapper.selectByExample(null);
    }

    @Override
    public List<Member> list(int type, String keyword, int pageNum) {
        MemberExample example = new MemberExample();
        MemberExample.Criteria criteria = example.createCriteria();
        if (type==1){//名字
            criteria.andNameLike("%"+keyword+"%");
        }
        if (type==2){//学院
            criteria.andAcademyLike("%"+keyword+"%");

        }
        if (type==3){//专业
            criteria.andMajorLike("%"+keyword+"%");
        }
        if (type==4){//部门
            List<Dept> depts = deptService.listByName(keyword);
            List<Integer> ids=new ArrayList<>();
            ids.add(0);
            if (depts!=null&&depts.size()>0){
                for (Dept dept : depts) {
                    ids.add(dept.getNo());
                }
            }

            criteria.andDeptFkIn(ids);
        }
        PageHelper.startPage(pageNum,9);
        return memberMapper.selectByExample(example);
    }

    @Override
    public List<Member> listByName(String name) {
        MemberExample example = new MemberExample();
        MemberExample.Criteria criteria = example.createCriteria();
        criteria.andNameLike("%"+name+"%");
        return memberMapper.selectByExample(example);
    }

    @Override
    public Member getMember() {
        List<Member> members = memberMapper.selectByExample(null);
        if (members!=null&&members.size()>0){
            return members.get(0);
        }

        return null;
    }

    @Override
    public Member getById(int id) {
        return memberMapper.selectByPrimaryKey(id);
    }

    @Override
    public Member getNewestId(Member member) {
        MemberExample example = new MemberExample();
        MemberExample.Criteria criteria = example.createCriteria();
        criteria.andNameEqualTo(member.getName());
        criteria.andTelephoneEqualTo(member.getTelephone());
        criteria.andCollegeEqualTo(member.getCollege());
        criteria.andAcademyEqualTo(member.getAcademy());
        criteria.andMajorEqualTo(member.getMajor());
        List<Member> members = memberMapper.selectByExample(example);
        if (members!=null&&members.size()>0){
            return members.get(0);
        }
        return null;
    }

    @Override
    public Member login(Member member) {
        MemberExample example = new MemberExample();
        MemberExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(member.getUsername());
        criteria.andPasswardEqualTo(member.getPassward());
        List<Member> members = memberMapper.selectByExample(example);
        if(members!=null&&members.size()>0){
            return members.get(0);
        }
        return null;
    }

    @Override
    public int save(Member member) {
        return memberMapper.insert(member);
    }

    @Override
    public int update(Member member) {
        return memberMapper.updateByPrimaryKeySelective(member);
    }

    @Override
    public int remove(List<Integer> ids) {
        MemberExample example = new MemberExample();
        MemberExample.Criteria criteria = example.createCriteria();
        criteria.andIdIn(ids);
        return memberMapper.deleteByExample(example);
    }


}
