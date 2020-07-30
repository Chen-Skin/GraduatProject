package com.superkin.tcams.activity.pojo;

import com.superkin.tcams.member.pojo.Member;

import java.io.Serializable;
import java.util.Date;

public class DeptActivity implements Serializable {
    private Integer id;

    private String title;

    private String teacher;

    private Integer memberFk;

    private Integer deptFk;

    private Integer money;

    private Date starttime;

    private Date endtime;

    private String place;

    private String remark;

    private static final long serialVersionUID = 1L;

    private Member member;


    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher == null ? null : teacher.trim();
    }

    public Integer getMemberFk() {
        return memberFk;
    }

    public void setMemberFk(Integer memberFk) {
        this.memberFk = memberFk;
    }

    public Integer getDeptFk() {
        return deptFk;
    }

    public void setDeptFk(Integer deptFk) {
        this.deptFk = deptFk;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place == null ? null : place.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", title=").append(title);
        sb.append(", teacher=").append(teacher);
        sb.append(", memberFk=").append(memberFk);
        sb.append(", deptFk=").append(deptFk);
        sb.append(", money=").append(money);
        sb.append(", starttime=").append(starttime);
        sb.append(", endtime=").append(endtime);
        sb.append(", place=").append(place);
        sb.append(", remark=").append(remark);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}