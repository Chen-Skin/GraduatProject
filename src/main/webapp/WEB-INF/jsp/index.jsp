<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<title>首页</title>
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
<body>
<!-- header start -->
<div class="zxcf_top_wper">
	<div class="zxcf_top px1000 clearfix">
		 <div class="zxcf_top_l fl">
		    <img src="/images/zxcf_phone.png" alt="">
		     紧急事务联系方式：${home.phone}
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
<!-- end  -->
<div class="zscf_banner_wper">
	<div class="zscf_banner px1000">
		<div class="zscf_box">
			<p><strong>欢迎登录社团管理系统</strong></p>
			<p>社团名：<strong>${home.name}</strong></p>
			<p>社团会长：<strong>${home.member.name}</strong></p>
			<a href="/member/tologin" class="btn btn1">切换用户</a><br>
			<a href="/member/logout" class="btn btn2">安全退出</a>
		</div>
	</div>
</div>
<!-- end banner -->
<div class="zscf_con_wper pb30">
	<div class="zscf_con px1000">
	      <div class="zscf_block1 mt30 ">
	      	  <h2 class="zscf_block1_tit clearfix"><span class="fl"><strong>社团人数与公告</strong> </span><a href="/notice/list" class="fr">查看更多>></a></h2>
	      	  <div class="clearfix clear">
		      	  <ul class="zscf_block1_text clearfix fl">
		      	  	   <li>
		      	  	   	   <span class="block1_libg01">已加入社团会员</span>
		      	  	   	   <br>
		      	  	   	   <em><strong></strong>${home.numbers}人</em>
		      	  	   </li>
		      	  	   <li>
		      	  	   	   <span class="block1_libg01">社团理事</span>
		      	  	   	   <br>
		      	  	   	   <em><strong>${home.leader}</strong>人</em>
		      	  	   </li>

		      	  </ul>
		      	 <!-- end l -->
		      	  <div class="block1_r fl">
		      	  	  <h2 class="block1_r_tit clearfix"><span>社团公告</span><a href="/notice/list">前往></a></h2>
		      	  	  <ul >
						  <c:if test="${list!=null}">
							  <c:forEach items="${list}" var="notice">
								  <li><span>${notice.title}</span><em><fmt:formatDate value="${notice.time}" pattern="yyyy-MM-dd"/> </em></li>
							  </c:forEach>
						  </c:if>



		      	  	  </ul>
		      	  </div>
	      	  </div>
	      </div>

         <!-- end block -->
         <div class="zscf_partner mt30">
         	 <h2 class="block3_tit clearfix "><span class="block3_curspan">常合作的伙伴</span></h2>
         	 <div class="partner_con">
         	      <div id="demo">
					<div id="indemo">
					<div id="demo1">
					<a href="#"><img src="/images/ifri01.png" border="0" /></a>
					<a href="#"><img src="/images/ifri02.png" border="0" /></a>
					<a href="#"><img src="/images/ifri01.png" border="0" /></a>
					<a href="#"><img src="/images/ifri02.png" border="0" /></a>
					<a href="#"><img src="/images/ifri01.png" border="0" /></a>
					<a href="#"><img src="/images/ifri02.png" border="0" /></a>
					</div>
					<div id="demo2"></div>
					</div>
					</div>
               <script>
				<!--
				var speed=10;
				var tab=document.getElementById("demo");
				var tab1=document.getElementById("demo1");
				var tab2=document.getElementById("demo2");
				tab2.innerHTML=tab1.innerHTML;
				function Marquee(){
				if(tab2.offsetWidth-tab.scrollLeft<=0)
				tab.scrollLeft-=tab1.offsetWidth
				else{
				tab.scrollLeft++;
				}
				}
				var MyMar=setInterval(Marquee,speed);
				tab.onmouseover=function() {clearInterval(MyMar)};
				tab.onmouseout=function()  {MyMar=setInterval(Marquee,speed)};
				-->
				</script>

          	 </div>
         </div>
	</div>
</div>
<!-- footer start -->
<div class="zscf_aboutus_wper">
	  <div class="zscf_aboutus px1000 clearfix">
	  	    <div class="zscf_aboutus_l fl">
	  	    	   <ul class="zscf_aboutus_lul clearfix">
	  	    	   	  <li class="pt10"><a href=""><img src="/images/app.png" alt=""></a>
	  	    	   	  </li>
	  	    	   	  <li>
	  	    	   	  <p class="pb20">服务热线</p>
	  	    	   	  <strong>${home.phone}</strong>
	  	    	   	  </li>
	  	    	   	  <li>
	  	    	   	  	  <p class="pb10 linkpic">
	  	    	   	  	     <a href=""><img src="/images/ft_sina.png" alt=""></a>
	  	    	   	  	     <a href=""><img src="/images/ft_weixin.png" alt=""></a>
	  	    	   	  	     <a href=""><img src="/images/ft_erji.png" alt=""></a>
	  	    	   	  	  </p>
	  	    	   	  	  <p><a href="">kefu@zhongxincaifu.com</a></p>
	  	    	   	  </li>
	  	    	   </ul>
	  	    </div>
	  	    <!-- end left -->
	  	    <div class="zscf_aboutus_r fl clearfix">
	  	    	 <a href="#" class="fl ft_ewm"><img src="/images/ft_erweima.png" alt=""></a>
	  	    	 <ul class="fl clearfix">
	  	    	 	<li><a href="">联系我们</a></li>
	  	    	 	<li><a href="">我要融资</a></li>
	  	    	 	<li><a href="">帮助中心</a></li>
	  	    	 	<li><a href="">友情链接</a></li>
	  	    	 	<li><a href="">招贤纳士</a></li>
	  	    	 	<li><a href="">收益计算器</a></li>
	  	    	 </ul>
	  	    </div>
	  	    <!-- end right -->

	  </div>
</div>

<div class="zscf_bottom_wper">
	<div class="zscf_bottom px1000 clearfix">
		  <p class="fl">© 2014 zhongxincaifu &nbsp;  &nbsp;&nbsp;   superkin信息股份有限公司 &nbsp;&nbsp;&nbsp;    鄂ICP备14017254号-1</p>
		  <p class="fr">
		    <a href=""><img src="/images/360.png" alt=""></a>
		    <a href=""><img src="/images/kexin.png" alt=""></a>
		    <a href=""><img src="/images/norton.png" alt=""></a>
		  </p>
	</div>
</div>
<!-- footer end -->
</body>
</html>