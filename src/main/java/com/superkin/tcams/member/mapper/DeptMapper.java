package com.superkin.tcams.member.mapper;

import com.superkin.tcams.member.pojo.Dept;
import com.superkin.tcams.member.pojo.DeptExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DeptMapper {
    int countByExample(DeptExample example);

    int deleteByExample(DeptExample example);

    int deleteByPrimaryKey(Integer no);

    int insert(Dept record);

    int insertSelective(Dept record);

    List<Dept> selectByExample(DeptExample example);

    Dept selectByPrimaryKey(Integer no);

    int updateByExampleSelective(@Param("record") Dept record, @Param("example") DeptExample example);

    int updateByExample(@Param("record") Dept record, @Param("example") DeptExample example);

    int updateByPrimaryKeySelective(Dept record);

    int updateByPrimaryKey(Dept record);
}