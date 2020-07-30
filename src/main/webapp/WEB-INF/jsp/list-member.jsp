 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>


 <!DOCTYPE html>
 <html>
<head>

     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">


     <title>社团管理-成员管理</title>
     <meta name="keywords" content="社团管理系统">
     <meta name="description" content="社团管理系统">
     <link rel="stylesheet" type="text/css" href="/css/style.css">
     <link rel="shortcut icon" href="favicon.ico">
     <link href="/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
     <link href="/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
     <link href="/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
     <link href="/css/animate.min.css" rel="stylesheet">
     <link href="/css/style.min862f.css?v=4.1.0" rel="stylesheet">
     <link href="/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">

 </head>

 <body class="gray-bg">
 <div class="zxcf_top_wper">
     <div class="zxcf_top px1000 clearfix">
         <div class="zxcf_top_l fl">
             <img src="/images/zxcf_phone.png" alt="">
             紧急事务联系方式：247-027-0101
             <a href=""><img src="/images/zxcf_weixin.png" alt=""></a>
             <a href=""><img src="/images/zxcf_qq.png" alt=""></a>
         </div>
         <div class="zxcf_top_r fr">
             <a href="/member/logout" class="curspan">退出登录</a>
         </div>
     </div>
 </div>
 <div class="zxcf_nav_wper">
     <div class="zxcf_nav clearfix px1000">
         <div class="zxcf_nav_l fl"><img src="/images/zxcf_logo.png" alt=""></div>
         <div class="zxcf_nav_r fr">
             <img src="/images/zxcf_perinfo.png" alt="">
             <span>当前登录用户：<shiro:principal/>
		 	<img src="/images/zxcf_icon01.png" alt=""></span>
             <ul class="zxcf_perinfo" style="display:none;">
                 <li><a href=""><shiro:hasAnyRoles name="system">职位--管理员</shiro:hasAnyRoles></a></li>
                 <li><a href=""><shiro:hasAnyRoles name="chairman">职位--会长</shiro:hasAnyRoles></a></li>
                 <li><a href=""><shiro:hasAnyRoles name="minister">职位--部长</shiro:hasAnyRoles></a></li>
                 <li><a href=""><shiro:hasAnyRoles name="financing">职位--财务</shiro:hasAnyRoles></a></li>
                 <li><a href=""><shiro:hasAnyRoles name="administration">职位--会员</shiro:hasAnyRoles></a></li>
             </ul>
         </div>
     </div>
 </div>
 <div class="zxcf_menu_wper">
     <div class="zxcf_menu px1000">
         <a href="/" class="zm_cura">首页</a>
         <a href="/member/list">成员管理</a>
         <a href="/activity/list">社团活动</a>
         <a href="/reimbursement/list">报销</a>
         <a href="/financing/list">财务</a>
         <a href="/notice/list">公告</a>

     </div>
 </div>
 <div class="wrapper2 wrapper-content2 animated fadeInRight">
     <div class="ibox float-e-margins">
         <div class="ibox-content">
             <div class="row">
                 <form action="/member/list" method="post">
                     <div class="col-sm-3 col-sm-offset-2 text-right">
                         <h3><small>搜索条件:</small></h3>
                     </div>
                     <div class="col-sm-2">
                         <select name="type" class="selectpicker form-control">

                             <option value="0" <c:if test="${type==0}">selected</c:if>  >选择类型</option>
                             <option value="1"  <c:if test="${type==1}">selected</c:if> >名字</option>
                             <option value="2"  <c:if test="${type==2}">selected</c:if> >学院</option>
                             <option value="3"  <c:if test="${type==3}">selected</c:if> >专业</option>
                             <option value="4"  <c:if test="${type==4}">selected</c:if> >部门</option>
                         </select>
                     </div>

                     <div class="col-sm-3">
                         <div class="input-group">
                             <input value="${keyword}" name="keyword"  type="text" placeholder="请输入关键词" class="input-sm form-control">
                             <span class="input-group-btn">
                                  <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-search"></i> 搜索</button>
                             </span>
                         </div>

                     </div>
                    <shiro:hasAnyRoles name="system,chairman">
                       <div class="col-sm-2 text-right">
                          <a href="/member/tosave" class="btn btn-sm btn-primary" type="button"><i class="fa fa-plus-circle"></i> 添加成员</a>
                       </div>
                    </shiro:hasAnyRoles>
                 </form>
             </div>
             <div class="hr-line-dashed2"></div>
             <div class="table-responsive">
                 <table class="table table-striped list-table">
                     <thead>
                     <tr>
                         <th>选择</th>
                         <th>名字</th>
                         <th>性别</th>
                         <th>电话</th>
                         <th>学校</th>
                         <th>学院</th>
                         <th>专业</th>
                         <th>年级</th>
                         <th>入团时间</th>
                         <th>职位</th>
                         <th>部门</th>
                         <th>操作</th>
                     </tr>
                     </thead>
                     <tbody>
                     <c:if test="${list!=null}">
                     <c:forEach items="${list}" var="member">
                     <tr>
                         <td>
                             <input  type="checkbox" value="${member.id}">
                         </td>
                         <td>${member.name}</td>
                         <td>
                             <c:if test="${member.sex==0}">女</c:if>
                             <c:if test="${member.sex==1}">男</c:if>
                         </td>
                         <td>${member.telephone}</td>
                         <td>${member.college}</td>
                         <td>${member.academy}</td>
                         <td>${member.major}</td>
                         <td>${member.grade}</td>
                         <td><fmt:formatDate value="${member.jointime}" pattern="yyyy-MM-dd" /></td>
                         <td>${member.position.name}</td>
                         <td>${member.position.dept.name}</td>
                         <td>
                             <a href="/member/toupdate?id=${member.id}&pageNum=${page.pageNum}"><i class="glyphicon glyphicon-edit  text-navy"></i></a>
                             <a id="${member.id}"  href="javascript:void(0)" class="btndel"><i class="glyphicon glyphicon-remove  text-navy"></i></a>
                         </td>
                     </tr>
                     </c:forEach>
                     </c:if>
                     <c:if test="${fn:length(list)==0}">
                         <tr>
                             <td colspan="12" class="text-center">没有相关数据</td>
                         </tr>
                     </c:if>




                     </tbody>
                 </table>
             </div>
             <c:if test="${fn:length(list)>0}">
              <div class="row">
                 <div class="col-sm-5">
                     <button class="btn btn-sm btn-primary btnAll" type="button"><i class="fa fa-check-square-o"></i> 全选</button>
                     <button class="btn btn-sm btn-primary btnRever" type="button"><i class="fa fa-square-o"></i> 反选</button>
                     <button class="btn btn-sm btn-primary btnRemove" type="button"><i class="fa fa-times-circle-o"></i> 删除</button>
                     <a href="/member/downloadExcel"  class="btn btn-sm btn-primary"><i class="fa fa-table"></i> 导出Excel</a>
                 </div>
                 <div class="col-sm-7 text-right">
                     <div class="btn-group">
                         <a href="/member/list?pageNum=${page.pageNum-1}&keyword=${keyword}&type=${type}" class="btn btn-sm btn-white <c:if test="${page.pageNum<=1}">disabled</c:if>  "><i class="glyphicon glyphicon-chevron-left"></i></a>
                         <c:forEach begin="1" end="${page.pages}" varStatus="index">
                             <a href="/member/list?pageNum=${index.index}&keyword=${keyword}&type=${type}" class="btn btn-sm btn-white <c:if test="${page.pageNum==index.index}">active</c:if> ">${index.index}</a>
                         </c:forEach>
                         <a href="/member/list?pageNum=${page.pageNum+1}&keyword=${keyword}&type=${type}" class="btn btn-sm btn-white <c:if test="${page.pageNum>=page.pages}">disabled</c:if>  "><i class="glyphicon glyphicon-chevron-right"></i></a>
                     </div>

                 </div>
              </div>
             </c:if>
         </div>
     </div>
 </div>
 <script src="/js/jquery.min.js?v=2.1.4"></script>
 <script src="/js/bootstrap.min.js?v=3.3.6"></script>
 <script src="/js/plugins/select/bootstrap-select.min.js"></script>
 <script src="/js/plugins/sweetalert/sweetalert.min.js"></script>

 <script>
     $(document).ready(function() {
         // 设置按钮的样式
         $('.selectpicker').selectpicker('setStyle', 'btn-white').selectpicker('setStyle', 'btn-sm');

         //全选
         $(".btnAll").click(function () {
             $("input:checkbox").prop("checked","checked");
         });
         //反选
         $(".btnRever").click(function () {
             $("input:checkbox").each(function () {
                 var state= $(this).prop("checked");
                 $(this).prop("checked",!state);
             });
         });


         $(".btndel").click(function () {
             var id=$(this).prop("id");
             swal({
                 title: "您确定要删除这条信息吗",
                 text: "删除后将无法恢复，请谨慎操作！",
                 type: "warning",
                 showCancelButton: true,
                 cancelButtonText:"取消",
                 confirmButtonColor: "#DD6B55",
                 confirmButtonText: "确定",
                 closeOnConfirm: false
             }, function () {//此函数是点击删除执行的函数
                 doRemove(id);//调用删除方法
             });

         });

         $(".btnRemove").click(function () {
             var ids="";
             //获取被选中的复选框
             $("input:checked").each(function () {
                 var id=$(this).val();
                 ids+=","+id;
             });
             ids=ids.substring(1);
             doRemove(ids);
         });



         function doRemove(ids) {
             if (ids.length>0&&ids!=null){
                 $.post("/member/remove?ids="+ids,function (result) {
                     if (result=="true"){
                         swal({title:"删除成功",text:"数据全部删除成功，为你返回列表",type:"success"},function () {
                             location.reload();
                         })
                     }else {
                         swal("删除失败","删除失败","error");
                     }


                 },"text")

             }



         }


     });
 </script>

 </body>

 </html>

