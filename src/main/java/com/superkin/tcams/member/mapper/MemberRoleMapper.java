package com.superkin.tcams.member.mapper;

import com.superkin.tcams.member.pojo.MemberRole;
import com.superkin.tcams.member.pojo.MemberRoleExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MemberRoleMapper {
    int countByExample(MemberRoleExample example);

    int deleteByExample(MemberRoleExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(MemberRole record);

    int insertSelective(MemberRole record);

    List<MemberRole> selectByExample(MemberRoleExample example);

    MemberRole selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") MemberRole record, @Param("example") MemberRoleExample example);

    int updateByExample(@Param("record") MemberRole record, @Param("example") MemberRoleExample example);

    int updateByPrimaryKeySelective(MemberRole record);

    int updateByPrimaryKey(MemberRole record);

    List<MemberRole> selectByMemberfk(@Param("id") int id);

}