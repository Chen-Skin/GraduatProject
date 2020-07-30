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
	<title>公告列表</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">

	<link href="${pageContext.request.contextPath}/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/style.min862f.css?v=4.1.0" rel="stylesheet">
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
<!-- end top -->
<div class="zxcf_nav_wper">
    <div class="zxcf_nav clearfix px1000">
        <div class="zxcf_nav_l fl"><img src="/images/zxcf_logo.png" alt=""></div>
        <div class="zxcf_nav_r fr">
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
<div class="notic_con_wper">
	  <div class="notic_con px1000">
	  	     <div class="notic_section clearfix">
				 <shiro:hasAnyRoles name="system,chairman,financing">
				 <div class="notic_sec_l fl">
					 <ul class="notic_secl_ul">
						 <a href="/financing/listAll?status=1"><li>待审批 </li></a>
						 <a href="/financing/listAll?status=2"><li>待付款</li></a>
						 <a href="/financing/listAll?status=3"><li>已付款</li></a>

					 </ul>
				 </div>
				 </shiro:hasAnyRoles>
	  	     	  <!-- end l -->

	  	     	  <div class="notic_sec_r fl">
					  <h2 class="notic_secr_tit">财务统计</h2>
					  <ul style="width:800px">

						  <div class="wrapper2 wrapper-content2 animated fadeInRight">
							  <div class="row">

								  <div class="col-sm-12">
									  <div class="ibox float-e-margins">

										  <div class="ibox-content">
											  <div class="echarts" id="echarts-bar-chart"></div>
										  </div>
									  </div>
								  </div>
							  </div>
							  <div class="row">
								  <div class="col-sm-7 text-right">
									  <div class="btn-group">
										  <a href="/financing/list?pageNum=${page.pageNum-1}" class="btn btn-sm btn-white  <c:if test="${page.pageNum<=1}">disabled</c:if>"><i class="glyphicon glyphicon-chevron-left"></i></a>
										  <c:forEach  begin="1" end="${page.pages}" varStatus="p">

											  <a href="/financing/list?pageNum=${p.index}" class="btn btn-sm btn-white <c:if test="${page.pageNum==p.index}">active</c:if> ">${p.index}</a>
										  </c:forEach>

										  <a href="/financing/list?pageNum=${page.pageNum+1}" class="btn btn-sm btn-white  <c:if test="${page.pageNum>=page.pages}">disabled</c:if>"><i class="glyphicon glyphicon-chevron-right"></i></a>

									  </div>

								  </div>

							  </div>
						  </div>


					  </ul>

	  	     	  </div>

	  	     </div>
	  </div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/js/plugins/select/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/echarts/echarts-all.js"></script>
<script>
	$(document).ready(function() {
		// 设置按钮的样式
		$('.selectpicker').selectpicker('setStyle', 'btn-white').selectpicker('setStyle', 'btn-sm');

		var listJSON=${listJSON};  //获取后台的传过来的数据

		//获取json中的数值，数组的形式
		var dataTime = [];
		var dataMoney = [];




		//匿名函数解析json串中的数值，关键点
		(function() {
			for(var i = 0; i < listJSON.length; i++) {
				dataTime.push(listJSON[i].time);
				dataMoney.push(listJSON[i].money);



			}
		})();

		var option = {
			title: {
				text: '社团支出统计'
			},
			tooltip: {},
			legend: {
				data: ['支出金额']
			},
			xAxis: {
				data: dataTime,
				axisLabel: {
					formatter: function(value, index) {
						return new Date(value).toLocaleDateString();
					}
				}

			},

			yAxis: {
				type: 'value',
				name: '金额（元）',
				splitNumber: 6
			},
			series: [{
				name: '金额',
				type: 'bar',
				//柱状宽度
				barWidth: 10,
				data: dataMoney
			}]
		};
		echarts.init(document.getElementById("echarts-bar-chart")).setOption(option);


	});
</script>
</body>
</html>