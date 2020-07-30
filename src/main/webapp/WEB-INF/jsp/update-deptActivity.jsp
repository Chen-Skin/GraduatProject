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


    <title>部门活动管理-修改活动</title>
    <meta name="keywords" content="社团管理系统">
    <meta name="description" content="社团管理系统">

    <link rel="shortcut icon" href="favicon.ico"> 
    	<link href="${pageContext.request.contextPath}/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        
      <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>部门活动管理<small>>修改活动</small></h5>
                    </div>
                    <div class="ibox-content">
                        <form id="saveForm" class="form-horizontal">
                            <input type="hidden" name="id" value="${deptActivity.id}">
                       	<div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">主题</label>
                                <div class="col-sm-3">
                                    <input name="title" value="${deptActivity.title}" type="text" class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">教学老师</label>
                                <div class="col-sm-3">
                                    <input name="teacher"  value="${deptActivity.teacher}" type="text" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">预算/元</label>
                                <div class="col-sm-3">
                                    <input name="money" value="${deptActivity.money}" type="text" class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">负责人</label>
                                <div class="col-sm-3">
                                    <select name="memberFk" class="selectpicker form-control">
                                        <option value="0">------请选择负责人------</option>
                                        <option value="4" <c:if test="${deptActivity.memberFk==4}">selected</c:if>>马晓君</option>
										<option value="5" <c:if test="${deptActivity.memberFk==5}">selected</c:if>>曾宪强</option>
                                        <option value="6" <c:if test="${deptActivity.memberFk==6}">selected</c:if>>陈炜怡</option>
									</select>
                                </div>
                                
                            </div>
                        </div>

                        <div class="row">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">地点</label>
                                    <div class="col-sm-3">
                                        <input name="place" value="${deptActivity.place}" type="text" class="form-control input-sm">
                                    </div>
                                    <label class="col-sm-2 col-sm-offset-1 control-label">部门</label>
                                    <div class="col-sm-3">
                                        <select name="deptFk" class="selectpicker form-control">
                                            <option value="3">------请选择部门------</option>
                                            <option value="20" <c:if test="${deptActivity.deptFk==20}">selected</c:if>>教学部</option>
                                            <option value="30" <c:if test="${deptActivity.deptFk==30}">selected</c:if>>秘书部</option>
                                            <option value="40" <c:if test="${deptActivity.deptFk==40}">selected</c:if>>活动部</option>
                                        </select>

                                    </div>
                                </div>
                        </div>
                        <div class="row">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">开始时间</label>
                                    <div class="col-sm-3">
                                        <input name="starttime" id="start" value='<fmt:formatDate value="${deptActivity.starttime}" pattern="yyyy-MM-dd"/> ' class="laydate-icon form-control layer-date">
                                    </div>
                                    <label class="col-sm-2 col-sm-offset-1 control-label">结束时间</label>
                                    <div class="col-sm-3">
                                        <!--时间控件的id都不能改-->
                                        <input name="endtime" id="end" value='<fmt:formatDate value="${deptActivity.endtime}" pattern="yyyy-MM-dd"/> ' class="laydate-icon form-control layer-date">
                                    </div>
                                </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">备注</label>
                                <div class="col-sm-9">
                                    <textarea name="remark" class="form-control">${deptActivity.remark}</textarea>
                                </div>

                            </div>
                        </div>
                        
                     	<div class="row">
                     		<div class="hr-line-dashed"></div>
                     	</div>
                          
                         <div class="row">
                            <div class="form-group">
                                <div class="col-sm-3 col-sm-offset-3 text-right">
                                    <button type="button" class="btn btn-primary btnSave"><i class="fa fa-save"></i> 保存内容</button>
                                </div>
                                <div class="col-sm-3">
                                	<a href="javascript:history.back(-1)" class="btn btn-white"><i class="fa fa-reply"></i> 返回</a>
                                	</div>
                            </div>
                       </div>
                       </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

 
    
    
    <script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/select/bootstrap-select.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/layer/laydate/laydate.js"></script>
   <script>
	$(document).ready(function() {
		// 设置按钮的样式
		$('.selectpicker').selectpicker('setStyle', 'btn-white');
		//初始化日期控件
		laydate({elem: "#start"});
        laydate({elem: "#end"});

        $(".btnSave").click(function () {
            var data = $("#saveForm").serialize();
            $.post("/deptActivity/update",data,function (result) {
                if(result=="true"){
                    $("#saveForm")[0].reset();
                    swal({title:"添加成功",text:"活动成功添加",type:"success"},function () {
                        location.href="/deptActivity/list?dept=${dept}&pageNum=${pageNum}";
                    });
                }else{
                    swal("添加失败","添加失败,请检查数据有效性","error");
                }
            },"text");
        });






    });
   </script>
   <!-- 修复日期控件长度-->
   <link href="${pageContext.request.contextPath}/css/customer.css" rel="stylesheet">
</body>


</html>
