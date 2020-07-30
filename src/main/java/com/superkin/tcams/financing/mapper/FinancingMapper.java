package com.superkin.tcams.financing.mapper;

import com.superkin.tcams.financing.pojo.Financing;
import com.superkin.tcams.financing.pojo.FinancingExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FinancingMapper {
    int countByExample(FinancingExample example);

    int deleteByExample(FinancingExample example);

    int deleteByPrimaryKey(String id);

    int insert(Financing record);

    int insertSelective(Financing record);

    List<Financing> selectByExample(FinancingExample example);

    Financing selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") Financing record, @Param("example") FinancingExample example);

    int updateByExample(@Param("record") Financing record, @Param("example") FinancingExample example);

    int updateByPrimaryKeySelective(Financing record);

    int updateByPrimaryKey(Financing record);
}