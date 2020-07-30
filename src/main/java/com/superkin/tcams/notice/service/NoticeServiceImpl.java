package com.superkin.tcams.notice.service;

import com.github.pagehelper.PageHelper;
import com.superkin.tcams.notice.mapper.NoticeMapper;
import com.superkin.tcams.notice.pojo.Notice;
import com.superkin.tcams.notice.pojo.NoticeExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public List<Notice> listAll(int pageNum) {
        PageHelper.startPage(pageNum,4);
        return noticeMapper.selectByExample(null);
    }

    @Override
    public List<Notice> list(int pageNum) {
        PageHelper.startPage(pageNum,3);
        return noticeMapper.selectByExample(null);
    }

    @Override
    public Notice getById(int id) {
        return noticeMapper.selectByPrimaryKey(id);
    }

    @Override
    public int save(Notice notice) {
        return noticeMapper.insert(notice);
    }

    @Override
    public int remove(List<Integer> ids) {
        NoticeExample example = new NoticeExample();
        NoticeExample.Criteria criteria = example.createCriteria();
        criteria.andIdIn(ids);
        return noticeMapper.deleteByExample(example);
    }
}
