package com.superkin.tcams.notice.pojo;

import com.superkin.tcams.member.pojo.Member;

import java.io.Serializable;
import java.util.Date;

public class Notice implements Serializable {
    private Integer id;

    private String title;

    private Date time;

    private String place;

    private Integer memberFk;

    private String content;

    private String discription;

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

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place == null ? null : place.trim();
    }

    public Integer getMemberFk() {
        return memberFk;
    }

    public void setMemberFk(Integer memberFk) {
        this.memberFk = memberFk;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription == null ? null : discription.trim();
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
        sb.append(", time=").append(time);
        sb.append(", place=").append(place);
        sb.append(", memberFk=").append(memberFk);
        sb.append(", content=").append(content);
        sb.append(", discription=").append(discription);
        sb.append(", remark=").append(remark);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}