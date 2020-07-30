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


    <title>项目管理系统 - 基础表格</title>
    <meta name="keywords" content="项目管理系统">
    <meta name="description" content="项目管理系统">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="/js/all.js"></script>
    <!--[if IE 6]>
    <script src="./js/iepng.js" type="text/javascript"></script>
    <script type="text/javascript">
        EvPNG.fix('div, ul, img, li, input,span, p');
    </script>
    <![endif]-->

</head>

<body class="gray-bg">
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
                <a href="javascript:history.back(-1)" class="btn btn-white"><i class="fa fa-reply"></i> 返回</a>
                <form action="/financing/listAll" method="post">
                    <input type="hidden" name="status" value="1">
                    <div class="col-sm-3 col-sm-offset-4 text-right">
                        <h4>搜索条件:</h4>
                    </div>
                    <div class="col-sm-2">
                        <select name="type" class="selectpicker form-control">

                            <option value="0" <c:if test="${type==0}">selected</c:if>>选择类型</option>
                            <option value="1" <c:if test="${type==1}">selected</c:if>>订单号</option>
                            <option value="2" <c:if test="${type==2}">selected</c:if>>申请时间</option>
                            <option value="3" <c:if test="${type==3}">selected</c:if>>申请人</option>
                        </select>
                    </div>

                    <div class="col-sm-3">
                        <div class="input-group">
                            <input name="keyword" value="${keyword}" type="text" placeholder="输关键词" class="input-sm form-control">
                            <span class="input-group-btn">
                                 <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-search"></i> 搜索</button>
                            </span>
                        </div>

                    </div>
                </form>
            </div>
            <div class="hr-line-dashed2"></div>
            <div class="table-responsive">
                <table class="table table-striped list-table">
                    <thead>
                    <tr>

                        <th>单号</th>
                        <th>类型</th>
                        <th>报销人</th>
                        <th>总金额(/元)</th>
                        <th>使用时间</th>
                        <th>备注信息</th>
                        <th>审批状态</th>
                        <shiro:hasAnyRoles name="system,chairman,financing">
                        <th>操作</th>
                        </shiro:hasAnyRoles>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${list!=null}">
                        <c:forEach items="${list}" var="financing">
                            <tr>

                                <td>${financing.id}</td>
                                <td>
                                    <c:if test="${financing.type==1}">大型活动报销</c:if>
                                    <c:if test="${financing.type==2}">部门活动报销</c:if>
                                    <c:if test="${financing.type==3}">会议开销报销</c:if>
                                    <c:if test="${financing.type==4}">其他</c:if>
                                </td>
                                <td>${financing.member.name}</td>
                                <td>${financing.money}</td>
                                <td><fmt:formatDate value="${financing.time}" pattern="yyyy-MM-dd"/></td>
                                <td>${financing.remark}</td>
                                <td>未审批</td>
                                <shiro:hasAnyRoles name="system,chairman,financing">
                                <td>
                                    <a class="btn btn-danger btn-xs" href="/financing/toapprove?id=${financing.id}">审批</a>
                                </td>
                                </shiro:hasAnyRoles>
                            </tr>
                        </c:forEach>
                    </c:if>
                    <c:if test="${fn:length(list)==0}">
                        <tr>
                            <td colspan="8" class="text-center">没有相关数据</td>
                        </tr>
                    </c:if>


                    </tbody>
                </table>
            </div>
            <c:if test="${fn:length(list)>0}">
            <div class="row">
                <div class="col-sm-12 text-right">
                    <div class="btn-group">
                        <a href="/financing/listAll?pageNum=${page.pageNum-1}&keyword=${keyword}&type=${type}" class="btn btn-sm btn-white  <c:if test="${page.pageNum<=1}">disabled</c:if>"><i class="glyphicon glyphicon-chevron-left"></i></a>
                        <c:forEach  begin="1" end="${page.pages}" varStatus="p">
                            <a href="/financing/listAll?pageNum=${p.index}&keyword=${keyword}&type=${type}" class="btn btn-sm btn-white <c:if test="${page.pageNum==p.index}">active</c:if> ">${p.index}</a>
                        </c:forEach>
                        <a href="/financing/listAll?pageNum=${page.pageNum+1}&keyword=${keyword}&type=${type}" class="btn btn-sm btn-white  <c:if test="${page.pageNum>=page.pages}">disabled</c:if>"><i class="glyphicon glyphicon-chevron-right"></i></a>

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

    });
</script>

</body>


</html>