package com.superkin.tcams.common.shiro;

import com.superkin.tcams.member.pojo.Member;
import com.superkin.tcams.member.pojo.MemberRole;
import com.superkin.tcams.member.service.MemberService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class ShiroDbRealm extends AuthorizingRealm {
    @Autowired
    private MemberService memberService;

    public static final String SESSION_USER_KEY = "gray";

    /**
     * 拦截访问路径，进行权限判断而后进行开放
     * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用,负责在应用程序中决定用户的访问控制的方法
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
        // 获取当前对象
        Member member = (Member) SecurityUtils.getSubject().getSession().getAttribute(ShiroDbRealm.SESSION_USER_KEY);
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();

        List<MemberRole> memberRoleList = member.getMemberRoleList();

        List<String> roles=new ArrayList<>();
        for (MemberRole memberRole : memberRoleList) {
            roles.add(memberRole.getRole().getName());
        }

        //获取角色
        info.addRoles(roles);//加入当前用户权限
        return info;
    }

    /**
     * 认证回调函数，登录信息和用户验证信息验证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken authcToken) throws AuthenticationException {
        // 把token转换成User对象
        Member memberToken=tokenToUser((UsernamePasswordToken) authcToken);
        // 验证用户是否可以登录
        Member member = memberService.login(memberToken);
        if(member == null)
            return null; // 异常处理，找不到数据
        // 设置session
        Session session = SecurityUtils.getSubject().getSession();
        session.setAttribute(ShiroDbRealm.SESSION_USER_KEY, member);
        //当前 Realm 的 name
        String realmName = this.getName();
        //登陆的主要信息: 可以是一个实体类的对象, 但该实体类的对象一定是根据 token 的 username 查询得到的.
        Object principal = authcToken.getPrincipal();
        return new SimpleAuthenticationInfo(principal, memberToken.getPassward(), realmName);
    }

    private Member tokenToUser(UsernamePasswordToken authcToken) {
        Member member = new Member();
        member.setUsername(authcToken.getUsername());
        member.setPassward(String.valueOf(authcToken.getPassword()));
        return member;
    }

}


