package com.superkin.tcams.activity.mapper;

import com.superkin.tcams.activity.pojo.DeptActivity;
import com.superkin.tcams.activity.pojo.DeptActivityExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DeptActivityMapper {
    int countByExample(DeptActivityExample example);

    int deleteByExample(DeptActivityExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(DeptActivity record);

    int insertSelective(DeptActivity record);

    List<DeptActivity> selectByExample(DeptActivityExample example);

    DeptActivity selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") DeptActivity record, @Param("example") DeptActivityExample example);

    int updateByExample(@Param("record") DeptActivity record, @Param("example") DeptActivityExample example);

    int updateByPrimaryKeySelective(DeptActivity record);

    int updateByPrimaryKey(DeptActivity record);
}