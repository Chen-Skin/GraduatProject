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
                        <h5>报销<small>>修改申请</small></h5>
                    </div>
                    <div class="ibox-content">
                        <form id="saveForm" class="form-horizontal">
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">报销单号</label>
                                <div class="col-sm-3">
                                    <input name="id" value="${financing.id}" type="text" class="form-control" >
                                </div>

                                <label class="col-sm-2 control-label">支出类型</label>
                                <div class="col-sm-3">
                                    <select name="type" class="selectpicker form-control">
                                        <option value="0">-----请选择类型-----</option>
                                        <option value="1" <c:if test="${financing.type==1}">selected</c:if>>大型活动</option>
                                        <option value="2" <c:if test="${financing.type==2}">selected</c:if>>部门活动</option>
                                        <option value="3" <c:if test="${financing.type==3}">selected</c:if>>会议开销</option>
                                        <option value="4" <c:if test="${financing.type==4}">selected</c:if>>其他</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">总金额</label>
                                <div class="col-sm-3">
                                    <input name="money" value="${financing.money}" type="text" class="form-control" >
                                </div>
                                <label class="col-sm-2 control-label">使用时间</label>
                                <div class="col-sm-3">
                                    <!--时间控件的id都不能改-->
                                    <input name="time" id="start" value='<fmt:formatDate value="${financing.time}" pattern="yyyy-MM-dd"/> '  class="laydate-icon form-control layer-date">
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">备注</label>
                                <div class="col-sm-9">
                                    <textarea name="remark" class="form-control">${financing.remark}</textarea>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">批准信息</label>
                                <div class="col-sm-9">
                                    <textarea readonly name="result" class="form-control">${financing.result}</textarea>
                                </div>
                            </div>
                        </div>
                        
                     	<div class="row">
                     		<div class="hr-line-dashed"></div>
                     	</div>
                          
                         <div class="row">
                            <div class="form-group">
                                <div class="col-sm-3 col-sm-offset-3 text-right">
                                    <button type="button" class="btn btn-primary btnSave"><i class="fa fa-save"></i> 提交</button>
                                </div>
                               
                                <div class="col-sm-3">
                                    <a href="javascript:history.back(-1)" class="btn btn-white"><i class="fa fa-reply">返回</i> </a>
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
	<script src="${pageContext.request.contextPath}/js/inputfile.js"></script>
	
   <script>
	$(document).ready(function() {
		
		// 设置按钮的样式
		$('.selectpicker').selectpicker('setStyle', 'btn-white');
		//初始化日期控件
		laydate({elem: "#start"});
        $(".btnSave").click(function () {
            var data = $("#saveForm").serialize();
            $.post("/reimbursement/update",data,function (result) {
                if(result=="true"){
                    $("#saveForm")[0].reset();
                    swal({title:"添加成功",text:"活动成功添加",type:"success"},function () {
                        location.href="/reimbursement/listMy?pageNum=${pageNum}";
                    });
                }else{
                    swal("添加失败","添加失败,请检查数据有效性","error");
                }
            },"text");
        });


    });
   </script>
</body>


</html>
