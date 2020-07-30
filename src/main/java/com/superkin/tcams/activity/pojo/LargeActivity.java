package com.superkin.tcams.activity.pojo;

import com.superkin.tcams.member.pojo.Member;

import java.io.Serializable;
import java.util.Date;

public class LargeActivity implements Serializable {
    private Integer id;

    private String title;

    private String target;

    private String place;

    private Integer memberFk;

    private String sponsor;

    private String undertaker;

    private String money;

    private String guest;

    private Integer status;

    private Date starttime;

    private Date endtime;

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

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target == null ? null : target.trim();
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

    public String getSponsor() {
        return sponsor;
    }

    public void setSponsor(String sponsor) {
        this.sponsor = sponsor == null ? null : sponsor.trim();
    }

    public String getUndertaker() {
        return undertaker;
    }

    public void setUndertaker(String undertaker) {
        this.undertaker = undertaker == null ? null : undertaker.trim();
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money == null ? null : money.trim();
    }

    public String getGuest() {
        return guest;
    }

    public void setGuest(String guest) {
        this.guest = guest == null ? null : guest.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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
        sb.append(", target=").append(target);
        sb.append(", place=").append(place);
        sb.append(", memberFk=").append(memberFk);
        sb.append(", sponsor=").append(sponsor);
        sb.append(", undertaker=").append(undertaker);
        sb.append(", money=").append(money);
        sb.append(", guest=").append(guest);
        sb.append(", status=").append(status);
        sb.append(", starttime=").append(starttime);
        sb.append(", endtime=").append(endtime);
        sb.append(", remark=").append(remark);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}