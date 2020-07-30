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
    <title>社团管理系统 - 社团公告</title>
    <meta name="keywords" content="社团管理系统">
    <meta name="description" content="社团管理系统">

    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">


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

<div class="zxcf_nav_wper">
    <div class="zxcf_nav clearfix px1000">
        <div class="zxcf_nav_l fl"><img src="/images/zxcf_logo.png" alt=""></div>

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
<div class="wrapper wrapper-content">

        <div class="zscf_block3 mt30 ">
            <h2 class="block3_tit clearfix"><span class="block3_curspan">公告列表</span><em><img src="/images/shu.png" alt=""></em><shiro:hasAnyRoles name="system,chairman"><span>发布公告</span></shiro:hasAnyRoles></h2>
            <div class="block3_pro_box clear">
                <div class="block3_prolist">

                    <c:if test="${list!=null}">
                        <c:forEach items="${list}" var="notice">
                            <div class="block3_proone clearfix clear">
                                <span class="fl proone_left"><img src="/images/xin.png" alt=""></span>
                                <!--  -->
                                <div class="fl proone_center">
                                    <div class="clearfix">
                                        <span class="fl proone_center_span1">主题: ${notice.title}</span>
                                        <div class="block2_biao_r fr">
                                            <div class="tjxm_jindu ">

                                            </div>
                                        </div>
                                    </div>
                                    <ul class="clearfix proone_center_ul clear pt10">
                                        <li>时间: <span><fmt:formatDate value="${notice.time}" pattern="yyyy-MM-dd"></fmt:formatDate> </span></li>
                                        <li>地点: <span>${notice.place}</span></li>
                                        <li>发布者：<span>${notice.member.position.dept.name}--${notice.member.name}</span></li>
                                    </ul>
                                </div>
                                <!--  -->
                                <a href="/notice/show?id=${notice.id}" class="block3_btn fl">查看详情</a>
                                <shiro:hasAnyRoles name="system,chairman">
                                     <a href="javascript:void(0)" id="${notice.id}" class="btndel block3_btn fl"><i class="glyphicon glyphicon-remove  text-navyredd"></i>  删除</a>
                                </shiro:hasAnyRoles>
                            </div>

                        </c:forEach>
                    </c:if>

                    <p class="notic_pagelink">
                        <a href="/notice/list?pageNum=${page.pageNum-1}" class="btn-white <c:if test="${page.pageNum<=1}">disabled</c:if>  "><i class="glyphicon glyphicon-chevron-left"></i></a>
                        <c:forEach begin="1" end="${page.pages}" varStatus="index">
                            <a href="/notice/list?pageNum=${index.index}" class="btn-white <c:if test="${page.pageNum==index.index}">active</c:if> ">${index.index}</a>
                        </c:forEach>
                        <a href="/notice/list?pageNum=${page.pageNum+1}" class="btn-white <c:if test="${page.pageNum>=page.pages}">disabled</c:if>  "><i class="glyphicon glyphicon-chevron-right"></i></a>
                   </p>


                </div>
                <!-- end 项目列表 -->
                <div class="block3_prolist" style="display:none;">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content">
                            <form id="saveForm" class="form-horizontal">

                                <div class="row">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">标题</label>
                                        <div class="col-sm-9">
                                            <input name="title" type="text" class="form-control input-sm">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">时间</label>
                                        <div class="col-sm-3">
                                            <!--时间控件的id都不能改-->
                                            <input name="time" id="start" class="laydate-icon form-control layer-date">

                                        </div>
                                        <label class="col-sm-2 col-sm-offset-1 control-label">地点</label>
                                        <div class="col-sm-3">
                                            <input name="place" type="text" class="form-control input-sm" placeholder="无">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">摘要</label>
                                        <div class="col-sm-9">
                                            <textarea name="discription" class="form-control"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">内容</label>
                                        <div class="col-sm-9">
                                            <input type="hidden" name="content" id="content">
                                            <script id="editor" type="text/plain"></script>
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
                                            <a href="/notice/list" class="btn btn-white"><i class="fa fa-reply"></i>返回</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>



                </div>
            </div>
        </div>


</div>
<script src="/js/jquery.min.js?v=2.1.4"></script>
<script src="/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/js/content.min.js?v=1.0.0"></script>
<script src="/js/plugins/iCheck/icheck.min.js"></script>




<script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/select/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/layer/laydate/laydate.js"></script>

<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"> </script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
<script>
    $(document).ready(function() {
        //初始化日期控件
        laydate({elem: "#start"});
        //实例化编辑器
        var ue = UE.getEditor('editor');

        // 设置按钮的样式
        $('.selectpicker').selectpicker('setStyle', 'btn-white');


        $(".btnSave").click(function () {
                var content=UE.getEditor('editor').getContent();
                $("#content").val(content);

                $.ajax({
                    url:"/notice/save",
                    type:"post",
                    dataType:"text",
                    cashe:false,
                    data:new FormData($("#saveForm")[0]),
                    processData: false,
                    contentType: false,
                    success:function (result) {
                        if(result=="true"){
                            swal("发布成功","发布成功","success");
                            //重置表单内容与文本
                            $("#saveForm")[0].reset();
                            UE.getEditor('editor').setContent('', false);
                        }else{
                            swal("发布失败","请检查数据有效性","error");
                        }


                    }



                })
        })




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
            }, function () {//此函数是点击删除执行的函数
                doRemove(id);//调用删除方法
            });

        });



        function doRemove(ids) {
            if (ids.length>0&&ids!=null){
                $.post("/notice/remove?ids="+ids,function (result) {
                    if (result=="true"){
                        swal({title:"删除成功",text:"公告删除成功，为你返回列表",type:"success"},function () {
                            location.reload();
                        })
                    }else {
                        swal("删除失败","公告删除失败","error");
                    }


                },"text")

            }



        }



    });
</script>



</body>
</html>