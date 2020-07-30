package com.superkin.tcams.member.controller;

import com.github.pagehelper.PageInfo;
import com.superkin.tcams.common.utils.MyFileUploadAndDownloadUtils;
import com.superkin.tcams.member.pojo.Member;
import com.superkin.tcams.member.pojo.MemberRole;
import com.superkin.tcams.member.pojo.Position;
import com.superkin.tcams.member.service.MemberRoleService;
import com.superkin.tcams.member.service.MemberService;
import com.superkin.tcams.member.service.PositionService;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;
    @Autowired
    private PositionService positionService;
    @Autowired
    private MemberRoleService memberRoleService;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "type",required = false,defaultValue ="0") int type,
                       @RequestParam(value = "keyword",required = false,defaultValue ="") String keyword,
                       @RequestParam(value = "pageNum",required = false,defaultValue ="1") int pageNum){
        List<Member> list = memberService.list(type, keyword, pageNum);
        PageInfo<Member> page=new PageInfo<>(list);
        if(type==0){
            keyword="";
        }
        model.addAttribute("list",list);
        model.addAttribute("keyword",keyword);
        model.addAttribute("type",type);
        model.addAttribute("page",page);
        return "list-member";

    }

    @RequestMapping("/tosave")
    public String tosave(){
        return "save-member";
    }

    @RequestMapping("/save")
    @ResponseBody
    public String save(Member member){
        try {
            member.setPassward("123456");
            Position position = positionService.getByDeptFK(member.getDeptFk());
            member.setPositionFk(position.getId());
            int result = memberService.save(member);
            List<MemberRole> memberRoleList=null;
            Member newMember=null; //获取新增数据的id
            if (result>0){
                memberRoleList=member.getMemberRoleList();
                newMember=memberService.getNewestId(member);
            }
            ArrayList<MemberRole> memRole = new ArrayList<>();
            if (memberRoleList!=null&&memberRoleList.size()>0){
                for (MemberRole formMemberRole : memberRoleList) {
                    if (formMemberRole.getRoleFk()!=null){
                        memRole.add(new MemberRole(0,formMemberRole.getRoleFk(),newMember.getId()));
                    }
                }
                int row=memberRoleService.save(memRole);
                if (row>0){
                    return "true";
                }
            }

            return "false";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }

    }

    @RequestMapping("/toupdate")
    public String toupdate(Model model,int id,int pageNum){
        Member member = memberService.getById(id);
        List<Integer> rolefks = memberRoleService.listByMemberfk(id);
        model.addAttribute("member",member);
        model.addAttribute("rolefks",rolefks);
        model.addAttribute("pageNum",pageNum);
        return "update-member";

    }
    @RequestMapping("/update")
    @ResponseBody
    public String update(Member member){

        try {
            int result = memberService.update(member);
            int remove = memberRoleService.remove(member.getId());
            List<MemberRole> memberRoleList = member.getMemberRoleList();
            List<MemberRole> memRole=new ArrayList<>();
            if(memberRoleList!=null && memberRoleList.size()>0){
                for (MemberRole formMemberRole : memberRoleList) {
                    if (formMemberRole.getRoleFk()!=null){
                        memRole.add(new MemberRole(0,formMemberRole.getRoleFk(),member.getId()));
                    }

                }
                int row = memberRoleService.save(memRole);
                if (row<0){
                    return "rolefkFalse";
                }
            }


            if (result<0){
                return "memFalse";
            }

            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }


    }



    @RequestMapping("/remove")
    @ResponseBody
    public String remove(Integer[] ids){
        try {
            List<Integer> integers = Arrays.asList(ids);
            int result = memberService.remove(integers);
            if(result>0){
                return "true";
            }
            return "false";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }


    }

    /*1、查询当前这一页的数据
      2、把这一页的数据写到Excel中
      3、把Excel下载下来 */
    @RequestMapping("/downloadExcel")
    public ResponseEntity<byte[]> downloadExcel() throws IOException {
        List<Member> list = memberService.listAll();
        File file = listToExcel(list);
        if (file==null){
            return null;
        }
        return MyFileUploadAndDownloadUtils.download(file.getName(),null);

    }

    public File listToExcel(List<Member> list){
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("成员信息");
        HSSFRow headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("ID");
        headerRow.createCell(1).setCellValue("姓名");
        headerRow.createCell(2).setCellValue("性别");
        headerRow.createCell(3).setCellValue("联系电话");
        headerRow.createCell(4).setCellValue("学校");
        headerRow.createCell(5).setCellValue("学院");
        headerRow.createCell(6).setCellValue("专业");
        headerRow.createCell(7).setCellValue("年级");
        headerRow.createCell(8).setCellValue("入团时间");
        headerRow.createCell(9).setCellValue("职位");
        headerRow.createCell(10).setCellValue("部门");
        headerRow.createCell(11).setCellValue("密码");
        headerRow.createCell(12).setCellValue("用户名");
        headerRow.createCell(13).setCellValue("备注");

        for (int i = 0; i < list.size(); i++) {
            Member member = list.get(i);
            HSSFRow row = sheet.createRow(i + 1);
            row.createCell(0).setCellValue(member.getId());
            row.createCell(1).setCellValue(member.getName());
            row.createCell(2).setCellValue(member.getSex());
            row.createCell(3).setCellValue(member.getTelephone());
            row.createCell(4).setCellValue(member.getCollege());
            row.createCell(5).setCellValue(member.getAcademy());
            row.createCell(6).setCellValue(member.getMajor());
            row.createCell(7).setCellValue(member.getGrade());
            row.createCell(8).setCellValue(new SimpleDateFormat("yyyy-MM-dd").format(member.getJointime()));
            row.createCell(9).setCellValue(member.getPositionFk());
            row.createCell(10).setCellValue(member.getDeptFk());
            row.createCell(11).setCellValue(member.getPassward());
            row.createCell(12).setCellValue(member.getUsername());
            row.createCell(13).setCellValue(member.getRemark());


        }

        File file=new File("F:\\upload\\成员信息.xls");
        try {
            workbook.write(file);
            return file;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }


    }



    @RequestMapping("/tologin")
    public String tologin(){
        return "login";
    }

    @RequestMapping("/login")
    @ResponseBody
    public String login(Member member){
        Subject subject = SecurityUtils.getSubject();
        if (subject.isAuthenticated()) {
            return "true";
        }
        // 组装token，用户名,密码
        UsernamePasswordToken token = new UsernamePasswordToken(member.getUsername(), member.getPassward().toCharArray(), null);
        token.setRememberMe(true);
        // shiro登陆验证
        try {
            subject.login(token);
            return "true";
        } catch (UnknownAccountException ex) {
            return "false";
        } catch (IncorrectCredentialsException ex) {
            return "false";
        } catch (Exception ex) {
            ex.printStackTrace();
            return "false";
        }
    }

    @RequestMapping("/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Subject subject = SecurityUtils.getSubject();
        if (subject != null) {
            try{
                subject.logout();
            }catch(Exception ex){
            }
        }
        response.sendRedirect("/member/tologin");
    }

    @RequestMapping("/unauthorized")    //没有权限跳转的页面
    public String unauthorized() {
        return "unauthorized";
    }









}
