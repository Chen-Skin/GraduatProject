package com.superkin.tcams.home.pojo;

import com.superkin.tcams.member.pojo.Member;

import java.io.Serializable;

public class Home implements Serializable {
    private Integer id;

    private String name;

    private Integer numbers;

    private Integer leader;

    private String phone;

    private Integer memberFk;

    private Integer noticeFk;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getNumbers() {
        return numbers;
    }

    public void setNumbers(Integer numbers) {
        this.numbers = numbers;
    }

    public Integer getLeader() {
        return leader;
    }

    public void setLeader(Integer leader) {
        this.leader = leader;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getMemberFk() {
        return memberFk;
    }

    public void setMemberFk(Integer memberFk) {
        this.memberFk = memberFk;
    }

    public Integer getNoticeFk() {
        return noticeFk;
    }

    public void setNoticeFk(Integer noticeFk) {
        this.noticeFk = noticeFk;
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
        sb.append(", name=").append(name);
        sb.append(", numbers=").append(numbers);
        sb.append(", leader=").append(leader);
        sb.append(", phone=").append(phone);
        sb.append(", memberFk=").append(memberFk);
        sb.append(", noticeFk=").append(noticeFk);
        sb.append(", remark=").append(remark);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}