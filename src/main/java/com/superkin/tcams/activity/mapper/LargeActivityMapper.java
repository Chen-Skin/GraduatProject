package com.superkin.tcams.activity.mapper;

import com.superkin.tcams.activity.pojo.LargeActivity;
import com.superkin.tcams.activity.pojo.LargeActivityExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LargeActivityMapper {
    int countByExample(LargeActivityExample example);

    int deleteByExample(LargeActivityExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(LargeActivity record);

    int insertSelective(LargeActivity record);

    List<LargeActivity> selectByExample(LargeActivityExample example);

    LargeActivity selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") LargeActivity record, @Param("example") LargeActivityExample example);

    int updateByExample(@Param("record") LargeActivity record, @Param("example") LargeActivityExample example);

    int updateByPrimaryKeySelective(LargeActivity record);

    int updateByPrimaryKey(LargeActivity record);
}