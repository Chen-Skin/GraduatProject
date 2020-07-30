package com.superkin.tcams.notice.service;


import com.superkin.tcams.notice.pojo.Notice;

import java.util.List;

public interface NoticeService {
    List<Notice> listAll(int pageNum);
    List<Notice> list(int pageNum);
    Notice getById(int id);
    int save(Notice notice);
    int remove(List<Integer> ids);
}
