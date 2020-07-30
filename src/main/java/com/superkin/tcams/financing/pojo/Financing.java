package com.superkin.tcams.financing.pojo;

import com.superkin.tcams.member.pojo.Member;

import java.io.Serializable;
import java.util.Date;

public class Financing implements Serializable {
    private String id;

    private String type;

    private Double money;

    private Date time;

    private String remark;

    private Integer status;

    private Integer memberFk;

    private String result;

    private static final long serialVersionUID = 1L;

    private Member member;

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getMemberFk() {
        return memberFk;
    }

    public void setMemberFk(Integer memberFk) {
        this.memberFk = memberFk;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result == null ? null : result.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", type=").append(type);
        sb.append(", money=").append(money);
        sb.append(", time=").append(time);
        sb.append(", remark=").append(remark);
        sb.append(", status=").append(status);
        sb.append(", memberFk=").append(memberFk);
        sb.append(", result=").append(result);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}