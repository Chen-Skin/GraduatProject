<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<title>社团活动</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">

	<link href="${pageContext.request.contextPath}/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/style.min862f.css?v=4.1.0" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
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
<body>
<!-- header start -->
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
<!-- end  -->
<div class="bor_banner01">
	 
</div>
<!-- end banner -->
<div class="bor_con_wper">
	  <div class="bor_con px1400">
	  	    <div class="bor_detail">
	  	    	   <h2 class="bor_detail_tit">
	  	    	   	  <span class="bor_decurspan">大型活动</span>
	  	    	   	  <span>部门活动</span>
	  	    	   </h2>
	  	    	   <div class="bor_detail_box">
	  	    	   	    <div class="bor_det_one clearfix">
	  	    	   	    	  <jsp:include page="list-largeActivity.jsp"></jsp:include>

	  	    	   	    </div>
	  	    	   	    <!-- end  -->
	  	    	   	    <div class="bor_det_one" style="display:none;">
							<div class="bor_det_onel fl">
								<h3 class="bor_onel_tit">
									<a href="/deptActivity/list?dept=20"><span>教学部</span></a>
								</h3>
								<h3 class="bor_onel_tit">
									<a href="/deptActivity/list?dept=30"><span>秘书部</span></a>
								</h3>
								<h3 class="bor_onel_tit">
									<a href="/deptActivity/list?dept=40"><span>活动部</span></a>
								</h3>

							</div>
							<div class="bor_det_oner fl">

									<div class="ibox float-e-margins">
										<div class="ibox-title">
											<h5>部门活动管理<small>>>添加部门活动</small></h5>
										</div>
										<div class="ibox-content">
											<form id="saveForm" class="form-horizontal">
												<div class="row">
													<div class="form-group">
														<label class="col-sm-2 control-label">主题</label>
														<div class="col-sm-3">
															<input name="title" type="text" class="form-control input-sm">
														</div>
														<label class="col-sm-2 col-sm-offset-1 control-label">教学老师</label>
														<div class="col-sm-3">
															<input name="teacher" type="text" class="form-control input-sm">
														</div>
													</div>
												</div>
												<div class="row">
													<div class="form-group">
														<label class="col-sm-2 control-label">负责人</label>
														<div class="col-sm-3">
															<select name="memberFk"  class="input-s form-control">
																<option value="0">---选择负责人----</option>																<
																<option value="4">教学部部长———马晓君</option>
																<option value="5">活动部部长———曾宪强</option>
																<option value="6">秘书部部长———陈炜怡</option>
															</select>
														</div>
														<label class="col-sm-2 col-sm-offset-1 control-label">部门</label>
														<div class="col-sm-3">
															<select name="deptFk"  class="input-s form-control">
																<option value="0">---选择部门----</option>
																<option value="20">教学部</option>
																<option value="30">秘书部</option>
																<option value="40">活动部</option>
															</select>
														</div>

													</div>
												</div>
												<div class="row">
													<div class="form-group">
														<label class="col-sm-2 control-label">开始时间</label>
														<div class="col-sm-3">
															<input name="starttime" id="start" class="laydate-icon form-control layer-date">
														</div>
														<label class="col-sm-2 col-sm-offset-1 control-label">结束时间</label>
														<div class="col-sm-3">
															<!--时间控件的id都不能改-->
															<input name="endtime" id="end" class="laydate-icon form-control layer-date">
														</div>
													</div>
												</div>
												<div class="row">
													<div class="form-group">
														<label class="col-sm-2 control-label">地点</label>
														<div class="col-sm-3">
															<input name="place" type="text" class="form-control input-sm">
														</div>
														<label class="col-sm-2 col-sm-offset-1 control-label">预算(/元)</label>
														<div class="col-sm-3">
															<input name="money" type="text" class="form-control input-sm">
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

												<shiro:hasAnyRoles name="system,chairman,minister">
												<div class="row">
													<div class="form-group">
														<div class="col-sm-3 col-sm-offset-3 text-right">
															<button type="button" class="btn btn-primary btnSave"><i class="fa fa-save"></i> 保存内容</button>
														</div>

													</div>
												</div>
												</shiro:hasAnyRoles>
											</form>
										</div>
									</div>

							</div>
	  	    	   	    </div>
	  	    	   	    <!-- end  -->

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
			$.post("/deptActivity/save",data,function (result) {
				if(result=="true"){
					$("#saveForm")[0].reset();
					swal({title:"添加成功",text:"活动成功添加",type:"success"},function () {
						location.href="/deptActivity/list";
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