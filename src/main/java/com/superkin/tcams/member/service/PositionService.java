package com.superkin.tcams.member.service;

import com.superkin.tcams.member.pojo.Position;

import java.util.List;

public interface PositionService {
    List<Position> list();

    Position getByDeptFK(int deptFK);
}
