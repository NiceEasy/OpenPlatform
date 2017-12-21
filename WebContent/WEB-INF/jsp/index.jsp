<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form"%>
<%  //路径配置 
String path = request.getContextPath();   
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>OpenPlaform Index Page</title>
<link href="<%=basePath%>css/index/index.css" rel="stylesheet" />
<style type="text/css">
	.index_top{
		width: 100%;
		height:10%;
		background-color: #337ab7;
	}
	.index_top_title{
		float:left;
		width:92%;
		height: 100%;
		font-size: 41px;
        text-align: center;
        color: #333;
	}
	.index_top_logout{
		margin-top: 2%;
		float:left;
		width:4%;
	}
	.index_top_logout_span{
		color: #00ffaf;
	}
</style>
<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-3.2.1.min.js"> </script>
<script type="text/javascript">
	function testfonction(){
		alert("测试方法!");
	}
</script>
</head>
<body id="bg">
	<div class="index_top" id = "index_top">
		<div class = "index_top_title">测试平台</div>
		<div class="index_top_logout">
			<span class = "index_top_logout_span" onclick="top_logout()">退出登录</span>
		</div>
	</div>
	<div class="leftsidebar_box" id = "sidebar">
		<dl class="custom">
			<dt onClick="changeImage()">用户管理<img src="img/left/select_xl01.png"></dt>
			<dd class = "first_dd"><a href="#" >用户</a></dd>
			<dd class = "first_menu"><a href="#">菜单</a></dd>
			<dd class = "first_dd"><a href="#">角色</a></dd>
			<dd class = "first_main"><a href="#">主页测试</a></dd>
			<dd class = "fileUpload_main"><a href="#">图片测试</a></dd>
			<dd class = "vueTest_main"><a href="#">vue测试</a></dd>
		</dl>
	</div>


  <div id="result" style="width: 88%;margin-left:12%;">
	<iframe id="iframe-page-content" 
			src="<%=basePath%>backGround.do"  
					 style ="width:100%;
							frameborder:no;
							border:0;
							marginwidth:0;
							marginheight:0;scrolling:no;
							allowtransparency:yes;">
	</iframe>
</div>
<div style="display: none">
	<form action="<%=basePath%>logOut.do" method="post" id = "top_logOut_form">
	</form>
</div>
</body>
<script type="text/javascript">
	$(".leftsidebar_box dt").css({"background-color":"#3992d0"});
	$(".leftsidebar_box dt img").attr("src","img/left/select_xl01.png");
	$(function(){
		$(".leftsidebar_box dd").hide();
		$(".leftsidebar_box dt").click(function(){
			$(".leftsidebar_box dt").css({"background-color":"#3992d0"})
			$(this).css({"background-color": "#317eb4"});
			$(this).parent().find('dd').removeClass("menu_chioce");
			$(".leftsidebar_box dt img").attr("src","img/left/select_xl01.png");
			$(this).parent().find('img').attr("src","img/left/select_xl.png");
			$(".menu_chioce").slideUp(); 
			$(this).parent().find('dd').slideToggle();
			$(this).parent().find('dd').addClass("menu_chioce");
		});
	})
	
	function changeImage(){
	}
	
	//退出登录方法
	function top_logout(){
		console.info("退出方法!"+new Date());
		// 退出方法
		$("#top_logOut_form").submit();
	}
	
	$(function() {
		var height=document.documentElement.clientHeight;
			document.getElementById('iframe-page-content').style.height=(height*0.9)+'px';
			console.info(height);
		});

		var menuClick = function(menuUrl) {
			$("#iframe-page-content").attr('src',menuUrl);
		};
	
	
	$("#sidebar .first_dd").click(function(){
		$("#iframe-page-content").attr('src',"user/userMain.do");
	});
	
	
	$("#sidebar .first_menu").click(function(){
		$("#iframe-page-content").attr('src',"menu/menuMain.do");
	});
	
	
	$("#sidebar .first_main").click(function(){
		$("#iframe-page-content").attr('src',"<%=basePath%>backGround.do");
	});
	
	$("#sidebar .fileUpload_main").click(function(){
		$("#iframe-page-content").attr('src',"<%=basePath%>user/fileUpload.do");
	});
	
	$("#sidebar .vueTest_main").click(function(){
		$("#iframe-page-content").attr('src',"<%=basePath%>user/vueTest.do");
	});
</script>
</html>