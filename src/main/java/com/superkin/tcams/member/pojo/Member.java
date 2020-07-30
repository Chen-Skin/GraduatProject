package com.superkin.tcams.member.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Member implements Serializable {
    private Integer id;

    private String name;

    private String sex;

    private String telephone;

    private String college;

    private String academy;

    private String major;

    private String grade;

    private Date jointime;

    private Integer positionFk;

    private Integer deptFk;

    private String passward;

    private String username;

    private String remark;

    private static final long serialVersionUID = 1L;

    private Position position;

    private List<MemberRole> memberRoleList;

    public List<MemberRole> getMemberRoleList() {
        return memberRoleList;
    }

    public void setMemberRoleList(List<MemberRole> memberRoleList) {
        this.memberRoleList = memberRoleList;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
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

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college == null ? null : college.trim();
    }

    public String getAcademy() {
        return academy;
    }

    public void setAcademy(String academy) {
        this.academy = academy == null ? null : academy.trim();
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major == null ? null : major.trim();
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade == null ? null : grade.trim();
    }

    public Date getJointime() {
        return jointime;
    }

    public void setJointime(Date jointime) {
        this.jointime = jointime;
    }

    public Integer getPositionFk() {
        return positionFk;
    }

    public void setPositionFk(Integer positionFk) {
        this.positionFk = positionFk;
    }

    public Integer getDeptFk() {
        return deptFk;
    }

    public void setDeptFk(Integer deptFk) {
        this.deptFk = deptFk;
    }

    public String getPassward() {
        return passward;
    }

    public void setPassward(String passward) {
        this.passward = passward == null ? null : passward.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
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
        sb.append(", sex=").append(sex);
        sb.append(", telephone=").append(telephone);
        sb.append(", college=").append(college);
        sb.append(", academy=").append(academy);
        sb.append(", major=").append(major);
        sb.append(", grade=").append(grade);
        sb.append(", jointime=").append(jointime);
        sb.append(", positionFk=").append(positionFk);
        sb.append(", deptFk=").append(deptFk);
        sb.append(", passward=").append(passward);
        sb.append(", username=").append(username);
        sb.append(", remark=").append(remark);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}