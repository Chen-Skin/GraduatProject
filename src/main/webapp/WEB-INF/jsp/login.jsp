<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<STYLE>
	body{
		background: #ebebeb;
		font-family: "Helvetica Neue","Hiragino Sans GB","Microsoft YaHei","\9ED1\4F53",Arial,sans-serif;
		color: #222;
		font-size: 12px;
	}
	*{padding: 0px;margin: 0px;}
	.top_div{
		background: #008ead;
		width: 100%;
		height: 400px;
	}
	.ipt{
		border: 1px solid #d3d3d3;
		padding: 10px 10px;
		width: 290px;
		border-radius: 4px;
		padding-left: 35px;
		-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
		box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
		-webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
		-o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
		transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
	}
	.ipt:focus{
		border-color: #66afe9;
		outline: 0;
		-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
		box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
	}
	.u_logo{
		background: url("/images/username.png") no-repeat;
		padding: 10px 10px;
		position: absolute;
		top: 43px;
		left: 40px;

	}
	.p_logo{
		background: url("/images/password.png") no-repeat;
		padding: 10px 10px;
		position: absolute;
		top: 12px;
		left: 40px;
	}
	a{
		text-decoration: none;
	}
	.tou{
		background: url("/images/tou.png") no-repeat;
		width: 97px;
		height: 92px;
		position: absolute;
		top: -87px;
		left: 140px;
	}
	.left_hand{
		background: url("/images/left_hand.png") no-repeat;
		width: 32px;
		height: 37px;
		position: absolute;
		top: -38px;
		left: 150px;
	}
	.right_hand{
		background: url("/images/right_hand.png") no-repeat;
		width: 32px;
		height: 37px;
		position: absolute;
		top: -38px;
		right: -64px;
	}
	.initial_left_hand{
		background: url("/images/hand.png") no-repeat;
		width: 30px;
		height: 20px;
		position: absolute;
		top: -12px;
		left: 100px;
	}
	.initial_right_hand{
		background: url("/images/hand.png") no-repeat;
		width: 30px;
		height: 20px;
		position: absolute;
		top: -12px;
		right: -112px;
	}
	.left_handing{
		background: url("/images/left-handing.png") no-repeat;
		width: 30px;
		height: 20px;
		position: absolute;
		top: -24px;
		left: 139px;
	}
	.right_handinging{
		background: url("/images/right_handing.png") no-repeat;
		width: 30px;
		height: 20px;
		position: absolute;
		top: -21px;
		left: 210px;
	}

</STYLE>





<head>
	<title>Home</title>
	<!-- Meta tag Keywords -->
	<META name="GENERATOR" content="MSHTML 11.00.9600.17496"></HEAD>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content=""/>
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>

<link href="/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">



</head>

<body>
<DIV class="top_div"></DIV>
<DIV style="background: rgb(255, 255, 255); margin: -100px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 200px; text-align: center;">
	<DIV style="width: 165px; height: 96px; position: absolute;">
		<DIV class="tou"></DIV>
		<DIV class="initial_left_hand" id="left_hand"></DIV>
		<DIV class="initial_right_hand" id="right_hand"></DIV>
	</DIV>

<!-- content -->
	<form id="saveForm" method="post">
		<P style="padding: 30px 0px 10px; position: relative;"><SPAN class="u_logo"></SPAN>
			<INPUT name="username" class="ipt" type="text" placeholder="请输入用户名" >
		</P>

		<P style="position: relative;"><SPAN class="p_logo"></SPAN>
			<INPUT  name="passward" type="password" class="ipt" placeholder="请输入密码"/>
		</P>


		<P style="margin: 30px 35px 20px 130px;">
        <SPAN style="float: left;">
           <button type="button"  class="btnSave"
				   style="background: rgb(0, 142, 173); padding: 7px 50px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); border-image: none; color: rgb(255, 255, 255); font-weight: bold;">
                登录
           </button>
        </SPAN>
		</P>


	</form>

</DIV>
<div style="text-align:center;">
	<p>Copyright © 2015 QFlying. All rights reserved. 粤ICP备14048414号</p>
</div>




<script src="/js/jquery.min.js"></script>

<script src="/js/canva_moving_effect.js"></script>
<script src="/js/plugins/sweetalert/sweetalert.min.js"></script>

<script>
	$(function () {
		$(".btnSave").click(function () {
			var data=$("#saveForm").serialize();
			$.post("/member/login",data,function (result) {
				if (result=="false"){
					swal({
						title: "登录失败",
						text: "用户名或密码不正确！",
						type: "error"
					}, function () {
						location.reload();
					});

				}else {
					location.href="/";
				}

			},"text")

		});

	})

</script>
</body>


</html>