package com.superkin.tcams.member.service;

import com.superkin.tcams.member.mapper.PositionMapper;
import com.superkin.tcams.member.pojo.Position;
import com.superkin.tcams.member.pojo.PositionExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PositionServiceImpl implements PositionService {
    @Autowired
    private PositionMapper positionMapper;
    @Override
    public List<Position> list() {
        return positionMapper.selectByExample(null);
    }

    @Override
    public Position getByDeptFK(int deptFK) {
        PositionExample example = new PositionExample();
        PositionExample.Criteria criteria = example.createCriteria();
        criteria.andDeptFkEqualTo(deptFK);
        List<Position> positions = positionMapper.selectByExample(example);
        if (positions!=null&&positions.size()>0){
           return positions.get(0);
        }
        return null;
    }
}
