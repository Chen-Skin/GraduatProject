<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>项目管理系统 - 基础表格</title>
    <meta name="keywords" content="项目管理系统">
    <meta name="description" content="项目管理系统">
    <link rel="shortcut icon" href="favicon.ico"> 
    	<link href="${pageContext.request.contextPath}/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">


    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <!-- <link rel="stylesheet/less" type="text/css" href="css/style.less" /> -->
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
                            <form action="/reimbursement/listMy" method="post">
                                <input type="hidden" name="status" value="1">
                        		<div class="col-sm-3 col-sm-offset-4 text-right">
                        			<h3><small>搜索条件:</small></h3>
                        		</div>
                            <div class="col-sm-2">
                                <select class="selectpicker form-control" name="type">
                                    <option  value="0" <c:if test="${type==0}">selected</c:if> >选择类型</option>
                                    <option value="1" <c:if test="${type==1}">selected</c:if> >订单号</option>
                                    <option value="2" <c:if test="${type==2}">selected</c:if> >申请时间</option>

                                </select>
                            </div>
                           
                            <div class="col-sm-3">
                                <div class="input-group">
                                    <input type="text" name="keyword" value="${keyword}" placeholder="请输入关键词" class="input-sm form-control">
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
                                        <th>总金额</th>
                                        <th>使用时间</th>
                                        <th>备注信息</th>
                                        <th>审批意见</th>
                                        <th>审批状态</th>
                                        <th class="text-center">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:if test="${list!=null}">
                                    <c:forEach items="${list}" var="financing">
                                        <tr>
                                            <td>${financing.id}</td>
                                            <td>
                                                <c:if test="${financing.type==1}">大型活动</c:if>
                                                <c:if test="${financing.type==2}">部门活动</c:if>
                                                <c:if test="${financing.type==3}">会议开销</c:if>
                                                <c:if test="${financing.type==4}">其他</c:if>
                                            </td>
                                            <td>${financing.member.name}</td>
                                            <td>${financing.money}</td>
                                            <td><fmt:formatDate value="${financing.time}" pattern="yyyy-MM-dd" /></td>
                                            <td>
                                                <c:if test="${financing.remark.length()>6}">${financing.remark.substring(0,6)}...</c:if>
                                                <c:if test="${financing.remark.length()<=6}">${financing.remark}</c:if>
                                            </td>
                                            <td>
                                                <c:if test="${financing.result.length()>10}">${financing.result.substring(0,10)}...</c:if>
                                                <c:if test="${financing.result.length()<=10}">${financing.result}</c:if>

                                            </td>
                                            <td>
                                                <c:if test="${financing.status==0}"><span style="color: red">驳回</span></c:if>
                                                <c:if test="${financing.status==1}">待审批</c:if>
                                                <c:if test="${financing.status==2}">待付款</c:if>
                                                <c:if test="${financing.status==3}"><span style="color: green">已付款</span></c:if>

                                            </td>
                                            <td class="text-right">
                                                <a href="/reimbursement/toupdate?id=${financing.id}&pageNum=${page.pageNum}" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>编辑</a>
                                                <button id="${financing.id}" class="btn btn-danger btn-xs btndel"><i class="fa fa-close"></i>撤销</button>
                                            </td>

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
                                    <a href="/reimbursement/listMy?pageNum=${page.pageNum-1}&keyword=${keyword}&type=${type}" class="btn btn-sm btn-white  <c:if test="${page.pageNum<=1}">disabled</c:if>"><i class="glyphicon glyphicon-chevron-left"></i></a>
                                    <c:forEach  begin="1" end="${page.pages}" varStatus="p">
                                        <a href="/reimbursement/listMy?pageNum=${p.index}&keyword=${keyword}&type=${type}" class="btn btn-sm btn-white <c:if test="${page.pageNum==p.index}">active</c:if> ">${p.index}</a>
                                    </c:forEach>
                                    <a href="/reimbursement/listMy?pageNum=${page.pageNum+1}&keyword=${keyword}&type=${type}" class="btn btn-sm btn-white  <c:if test="${page.pageNum>=page.pages}">disabled</c:if>"><i class="glyphicon glyphicon-chevron-right"></i></a>

                                </div>
							</div>
                        </div>
                        </c:if>

                    </div>
                </div>
     </div>       
    <script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
     <script src="${pageContext.request.contextPath}/js/plugins/select/bootstrap-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>

   <script>
	$(document).ready(function() {
		// 设置按钮的样式
		$('.selectpicker').selectpicker('setStyle', 'btn-white').selectpicker('setStyle', 'btn-sm');
		
		//点击删除
		$(".btndel").click(function () {
            var id= $(this).prop("id");
		    swal({
		        title: "您确定要删除这条信息吗",
		        text: "删除后将无法恢复，请谨慎操作！",
		        type: "warning",
		        showCancelButton: true,
                cancelButtonText:"取消",
		        confirmButtonColor: "#DD6B55",
		        confirmButtonText: "删除",
		        closeOnConfirm: false
		    }, function () {

		        $.post("/reimbursement/remove?id="+id,function (result) {
                    if (result=="true"){
                        swal({title:"删除成功！",text:"您已经永久删除了这条信息。",type:"success"},function () {
                            location.reload();
                        });

                    }else{
                        swal("删除失败！",  "error");
                    }
                },"text")


		    });
		});
		
		

	});
    </script>
    
</body>


</html>
