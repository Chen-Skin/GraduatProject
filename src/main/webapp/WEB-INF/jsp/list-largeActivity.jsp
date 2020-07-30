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
    	<link href="${pageContext.request.contextPath}/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    	<link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper2 wrapper-content2 animated fadeInRight">
    <div class="ibox float-e-margins">
                   <div class="ibox-content">
                        <div class="row">
                            <form action="/activity/list" method="post">
                        		<div class="col-sm-3 col-sm-offset-2 text-right">
                        			<h3><small>搜索条件:</small></h3>
                        		</div>
                            <div class="col-sm-2">
                                <select name="type" class="input-sm form-control">
                                    <option value="0" <c:if test="${type==0}">selected</c:if>>选择类型</option>
                                    <option value="1" <c:if test="${type==1}">selected</c:if>>主题</option>
                                    <option value="2" <c:if test="${type==2}">selected</c:if>>地点</option>
                                    <option value="3" <c:if test="${type==3}">selected</c:if>>负责人</option>
                                </select>
                            </div>
                           
                            <div class="col-sm-3">
                                <div class="input-group">
                                    <input type="text" name="keyword" value="${keyword}" placeholder="请输入关键词" class="input-sm form-control">
                                    <span class="input-group-btn">
                                        <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-search"></i>  搜索</button>
                                    </span>
                                </div>
                                
                            </div>
                            <shiro:hasAnyRoles name="system,chairman">
                                <div class="col-sm-2 text-right">
                            		<a href="/activity/tosave" class="btn btn-sm btn-primary" type="button"><i class="fa fa-plus-circle"></i> 添加活动</a>
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
                                        <th>序号</th>
                                        <th>主题</th>
                                        <th>目的</th>
                                        <th>地点</th>
                                        <th>负责人</th>
                                        <th>主办方</th>
                                        <th>承办方</th>
                                        <th>预算/元</th>
                                        <th>嘉宾</th>
                                        <th>活动状态</th>
                                        <th>开始时间</th>
                                        <th>结束时间</th>
                                        <th>备注</th>
                                        <shiro:hasAnyRoles name="system,chairman">
                                            <th class="text-center">操作</th>
                                        </shiro:hasAnyRoles>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:if test="${list!=null}">
                                    <c:forEach items="${list}" var="activity">
                                        <tr>
                                            <td><input  type="checkbox" value="${activity.id}"></td>
                                            <td>${activity.id}</td>
                                            <td>${activity.title}</td>
                                            <td>${activity.target}</td>
                                            <td>${activity.place}</td>
                                            <td>${activity.member.name}</td>
                                            <td>${activity.sponsor}</td>
                                            <td>${activity.undertaker}</td>
                                            <td>${activity.money}</td>
                                            <td>${activity.guest}</td>
                                            <td>
                                                <c:if test="${activity.status==0}">未开始</c:if>
                                                <c:if test="${activity.status==1}">进行中</c:if>
                                                <c:if test="${activity.status==2}">已结束</c:if>

                                            </td>
                                            <td><fmt:formatDate value="${activity.starttime}" pattern="yyyy-MM-dd"/></td>
                                            <td><fmt:formatDate value="${activity.endtime}" pattern="yyyy-MM-dd"/></td>
                                            <td>${activity.remark}</td>
                                            <shiro:hasAnyRoles name="system,chairman">
                                            <td class="text-right">
                                                <a href="/activity/toupdate?id=${activity.id}&pageNum=${page.pageNum}" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>修改</a>
                                                <button id="${activity.id}" class="btn btn-danger btn-xs btndel"><i class="fa fa-close"></i>删除</button>
                                            </td>
                                            </shiro:hasAnyRoles>
                                        </tr>

                                    </c:forEach>
                                </c:if>

                                <c:if test="${list.size()==0}">
                                    <tr>
                                        <td colspan="15" class="text-center">没有相关数据</td>
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
                                    <shiro:hasAnyRoles name="system,chairman">
	                        		   <button class="btn btn-sm btn-primary btndel" type="button"><i class="fa fa-times-circle-o"></i> 删除</button>
                                    </shiro:hasAnyRoles>
                                </div>
							<div class="col-sm-7 text-right">
                                <div class="btn-group">

                                    <a href="/activity/list?pageNum=${page.pageNum-1}&keyword=${keyword}&type=${type}" class="btn btn-sm btn-white  <c:if test="${page.pageNum<=1}">disabled</c:if>"><i class="glyphicon glyphicon-chevron-left"></i></a>
                                    <c:forEach  begin="1" end="${page.pages}" varStatus="p">

                                        <a href="/activity/list?pageNum=${p.index}&keyword=${keyword}&type=${type}" class="btn btn-sm btn-white <c:if test="${page.pageNum==p.index}">active</c:if> ">${p.index}</a>
                                    </c:forEach>

                                    <a href="/activity/list?pageNum=${page.pageNum+1}&keyword=${keyword}&type=${type}" class="btn btn-sm btn-white  <c:if test="${page.pageNum>=page.pages}">disabled</c:if>"><i class="glyphicon glyphicon-chevron-right"></i></a>

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
            }, function () {
                doRemove(id);
            });

        });
        $(".btndel").click(function () {
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
                $.post("/activity/remove?ids="+ids,function (result) {
                    if (result=="true"){
                        swal({title:"删除成功",text:"活动删除成功，为你返回列表",type:"success"},function () {
                            location.reload();
                        })
                    }else{
                        swal("删除失败","活动删除失败","error");
                    }
                },"text");
            }
        }



	});
    </script>
    
</body>


</html>
