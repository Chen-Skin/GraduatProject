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


    <title>成员管理-添加成员</title>
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
                        <h5>人员管理<small>>添加人员</small></h5>
                    </div>
                    <div class="ibox-content">
                        <form id="saveForm" class="form-horizontal">
                       	<div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-3">
                                    <input name="name" type="text" class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">用户名</label>
                                <div class="col-sm-3">
                                    <input name="username" type="text" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">年龄</label>
                                <div class="col-sm-3">
                                    <input name="age" type="text" class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">性别</label>
                                <div class="col-sm-3">
                                    <select name="sex" class="selectpicker form-control">
                                        <option value="1">男</option>
										<option value="0">女</option>
									</select>
                                </div>
                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">联系电话</label>
                                <div class="col-sm-3">
                                    <input name="telephone" type="text" class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">所在大学</label>
                                <div class="col-sm-3">
                                    <input name="college" type="text" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">所在学院</label>
                                    <div class="col-sm-3">
                                        <input name="academy" type="text" class="form-control input-sm">
                                    </div>
                                    <label class="col-sm-2 col-sm-offset-1 control-label">专业</label>
                                    <div class="col-sm-3">
                                        <input name="major" type="text" class="form-control input-sm">
                                    </div>
                                </div>
                        </div>
                        <div class="row">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">年级(格式如:16级)</label>
                                    <div class="col-sm-3">
                                        <input name="grade" type="text" class="form-control input-sm">
                                    </div>
                                    <label class="col-sm-2 col-sm-offset-1 control-label">入团时间</label>
                                    <div class="col-sm-3">
                                        <!--时间控件的id都不能改-->
                                        <input name="jointime" id="start" class="laydate-icon form-control layer-date">
                                    </div>
                                </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">职位</label>
                                <div class="col-sm-3 tips">
                                    <input  type="radio" name="memberRoleList[0].roleFk" value="1">系统管理员
                                    <input  type="radio" name="memberRoleList[1].roleFk" value="2">会长
                                    <input  type="radio" name="memberRoleList[2].roleFk" value="3">部长
                                    <input  type="radio" name="memberRoleList[3].roleFk" value="4">财务
                                    <input  type="radio" name="memberRoleList[4].roleFk" value="5">会员
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">部门</label>
                                <div class="col-sm-3">
                                    <select name="deptFk" id="deptName" class="selectpicker form-control">
                                        <option value="0">---选择部门----</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                        

                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">备注</label>
                                <div class="col-sm-9">
                                    <textarea name="remark" class="form-control"></textarea>
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


        //加载部门
        function loadDept() {
            $.getJSON("/dept/listJSON",function(result){
                $(result).each(function () {
                    var option="<option  value='"+this.no+"'>"+this.name+"</option>";
                    $("#deptName").append(option).selectpicker('refresh');
                });
            });
        }
        loadDept();





        $(".btnSave").click(function () {
            var data = $("#saveForm").serialize();
            $.post("/member/save",data,function (result) {
                if(result=="true"){
                    $("#saveForm")[0].reset();
                    swal({title:"添加成功",text:"该成员已经成功添加",type:"success"},function () {
                        location.href="/member/list";
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
