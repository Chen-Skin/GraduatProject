package com.superkin.tcams.member.service;

import com.superkin.tcams.member.pojo.Member;

import java.util.List;

public interface MemberService {
    List<Member> listAll();
    List<Member> list(int type,String keyword,int pageNum);
    List<Member> listByName(String name);
    Member getMember();
    Member getById(int id);
    Member getNewestId(Member member);
    Member login(Member member);

    int save(Member member);
    int update(Member member);
    int remove(List<Integer> ids);

}
