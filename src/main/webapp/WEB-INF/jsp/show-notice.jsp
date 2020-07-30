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
    <title>项目管理系统 - 文章页面</title>
    <meta name="keywords" content="项目管理系统">
    <meta name="description" content="项目管理系统">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/pinglun.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">


</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight article">
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1">
                <div class="ibox">
                    <div class="ibox-content">
                        <div class="text-center  article-title">
                            <h2><strong>${notice.title}</strong></h2>
                        </div>
                        <div id="">
                            ${notice.content}
                        </div>
                        <hr>

                        <div class="row">
                            <div class="col-lg-12">

                                <h2>摘要：</h2>
                                <div class="social-feed-box">
                                    ${notice.discription}
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <ul>
                                <li><h4>时间：</h4><fmt:formatDate value="${notice.time}" pattern="yyyy-MM-dd"/></li>
                                <li><h4>发布者：</h4> ${notice.member.name}</li>
                            </ul>

                        </div>
                        <hr>
                        <div class="row text-center">
                        <a href="javascript:history.back(-1)" class="btn btn-white btn-sm" ><i class="fa fa-reply"></i> 返回</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="/js/content.min.js?v=1.0.0"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>

    <script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/select/bootstrap-select.min.js"></script>


    <script type="text/javascript">
        $(document).ready(function() {
            //初始化日期控件
            laydate({elem: "#start"});



        });



    </script>
    <!-- 修复日期控件长度-->
    <link href="${pageContext.request.contextPath}/css/customer.css" rel="stylesheet">
</body>


<!-- Mirrored from www.gzsxt.cn/theme/hplus/article.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:47 GMT -->
</html>
