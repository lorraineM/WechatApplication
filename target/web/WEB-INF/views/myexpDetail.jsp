<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.css" />" />
		<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js" />" ></script>
		<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js" />" ></script>
		<title>快递服务-快递详细信息</title>
		<style type="text/css">
		.sub-title{
			padding:1rem;
			font-size:1.5rem;
			height:4rem;
			line-height:2rem;
			color:#999;
			border-bottom:1px solid #ddd;
		}
		.btn-lg{
			border-color: #fff;
			background: #fff;
			width: 14rem;
			font-size:1.5rem;
		}
		.icon-sj{
			width:1.66rem;
			height:1.66rem;
			display: inline-block;
			background-size:100% auto; 
			background-image:url(<c:url value="/resources/images/icons-png/sj.png" />);
			margin-right:0.8rem
		}
		.icon-rt{
			width:1.66rem;
			height:1.66rem;
			display: inline-block;
			background-size:100% auto; 
			background-image:url(<c:url value="/resources/images/icons-png/ren.png" />);
			margin-right:0.8rem;
		}
		.icon-map{
			width:1.66rem;
			height:1.66rem;
			display: inline-block;
			background-size:100% auto; 
			background-image:url(<c:url value="/resources/images/icons-png/dz.png" />);
			margin:0 0.8rem 0 0; 
		}
		.icon-send{
			width:4rem;
			height:5rem;
			display: inline-block; 
			position:absolute;
			margin-top:-1rem;
			top:10%;
			left:0.8rem;
			background-size:100% auto; 
			background-image: url(<c:url value="/resources/images/icons-png/send.png" />);
		}
		.icon-receive{
			width:4rem;
			height:5rem;
			display: inline-block; 
			position:absolute;
			margin-top:-1rem;
			top:10%;
			left:0.8rem;
			background-size:100% auto; 
			background-image: url(<c:url value="/resources/images/icons-png/receive.png" />);
		}
		.sub-row{
			overflow:hidden;
		}
		.sub-row .t-title{
			position:relative;
			background:#fff;
			border-bottom:1px solid #ddd;
			padding:2rem 1rem;
			font-size:1.5rem;
			overflow:hidden;
			color:#999;
		}
		.sub-row .t-title div{
			width: 85%;
			overflow: hidden;
			margin-left: 5rem;
		}
		.icon-ems{
			width:4rem;
			height:4rem;
			display: inline-block; 
			position:absolute;
			margin-top:-1rem;
			top:40%;
			left:0.8rem;
			background-size:100% auto; 
			background-image: url(<c:url value="/resources/images/icons-firms/ems.png" />);
		}
		.icon-sf{
			width:4rem;
			height:4rem;
			display: inline-block; 
			position:absolute;
			margin-top:-1rem;
			top:40%;
			left:0.8rem;
			background-size:100% auto; 
			background-image: url(<c:url value="/resources/images/icons-firms/shunfeng.png" />);
		}
		.icon-yto{
			width:4rem;
			height:4rem;
			display: inline-block; 
			position:absolute;
			margin-top:-1rem;
			top:40%;
			left:0.8rem;
			background-size:100% auto; 
			background-image: url(<c:url value="/resources/images/icons-firms/yuantong.png" />);
		}
		.icon-sto{
			width:4rem;
			height:4rem;
			display: inline-block; 
			position:absolute;
			margin-top:-1rem;
			top:40%;
			left:0.8rem;
			background-size:100% auto; 
			background-image: url(<c:url value="/resources/images/icons-firms/shengtong.png" />);
		}
		.icon-zto{
			width:4rem;
			height:4rem;
			display: inline-block; 
			position:absolute;
			margin-top:-1rem;
			top:40%;
			left:0.8rem;
			background-size:100% auto; 
			background-image: url(<c:url value="/resources/images/icons-firms/zhongtong.png" />);
		}
		.icon-htky{
			width:4rem;
			height:4rem;
			display: inline-block; 
			position:absolute;
			margin-top:-1rem;
			top:40%;
			left:0.8rem;
			background-size:100% auto; 
			background-image: url(<c:url value="/resources/images/icons-firms/huitong.png" />);
		}
		body{font-family: "微软雅黑";background:#e5e5e5}
		</style>
	</head>
	<body>
		<div class="container-fluid">
			<div class="sub-row">
				${result}
			</div>
			<div class="sub-row">
				<p class="sub-title">具体信息</p>
				${s}
				${r}
			</div>
		</div>
		<script type="text/javascript">
		</script>
	</body>
</html>
