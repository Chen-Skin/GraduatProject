package com.superkin.tcams.member.pojo;

import java.io.Serializable;

public class MemberRole implements Serializable {
    private Integer id;

    private Integer roleFk;

    private Integer memberFk;

    private static final long serialVersionUID = 1L;

    private Role role;

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoleFk() {
        return roleFk;
    }

    public void setRoleFk(Integer roleFk) {
        this.roleFk = roleFk;
    }

    public Integer getMemberFk() {
        return memberFk;
    }

    public void setMemberFk(Integer memberFk) {
        this.memberFk = memberFk;
    }

    public MemberRole() {
    }

    public MemberRole(Integer id, Integer roleFk, Integer memberFk) {
        this.id = id;
        this.roleFk = roleFk;
        this.memberFk = memberFk;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", roleFk=").append(roleFk);
        sb.append(", memberFk=").append(memberFk);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}