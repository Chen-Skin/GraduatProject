package com.superkin.tcams.member.service;

import com.superkin.tcams.member.pojo.MemberRole;

import java.util.List;

public interface MemberRoleService {

    int save(List<MemberRole> memberRole);
    List<Integer> listByMemberfk(int member_fk);
    int remove(int member_fk);
    int update(MemberRole memberRole);

}
