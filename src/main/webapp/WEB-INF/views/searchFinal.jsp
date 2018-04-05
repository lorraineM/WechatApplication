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
		<script type="text/javascript" src="<c:url value="/resources/js/jquery.mobile.js" />" ></script>
		<title>快递服务-快递信息</title>
		<style type="text/css">
		.collect{
			border-top:1px solid #ddd;
			border-bottom:none;
		}
		.collect .ul{
			padding-left:1rem;
			overflow:hidden;
			font-size:1.3rem;
		}
		.collect .ul li{
			line-height:7rem; 
			position:relative;
			min-height:7rem;
			border-left-style: solid;
			border-left-width: 5px;
			margin-top: 5px;
			margin-left: 8px;
			list-style: none;
		}
		.sub-title{
			padding:1rem;
			font-size:1.5rem;
			height:4rem;
			line-height:2rem;
			color:#000;
			border-bottom:1px solid #ddd;
		}
		.btn-lg{
			border-color: #fff;
			background: #fff;
			width: 14rem;
			font-size:1.5rem;
		}
		.next-button{
			text-align: center;
			padding-top: 3rem;
		}
		.next-button-d{
			width:30%;
			height:4.5rem;
			background:#f60;
			color:#fff;
			border-radius:5px;
			font-size:1.5rem;
			border:none;
		}
		.next-button-alert{
			width:100%;
			background:#fff;
			color:#666;
			font-size:1.5rem;
			border:none;
		}
		.popover{
			box-shadow: none;
			display: block;
			line-height: 1.4rem;
			background-color: #D3D1D1;
			width: 276px;
			text-align: left;
			color:#fff;
			border-color: #fff;
			font-size: 12px;
		}
		.arrow{
			border-color: #fff;
		}
		.popover.right > .arrow:after{
			border-right-color: #D3D1D1;
		}
		.popover.right.a_s > .arrow:after{
			border-right-color: #FF6100;
		}
		.b_active{
			border-left-color: #f60;
		}
		.b_nonactive{
			border-left-color: #D3D1D1;
		}
		.c_active{
			background-color: #f60;
		}
		.a_f{
			border-left-color: #FF6100;
		}
		.a_s{
			background-color: #FF6100;
		}
		.sub-row{
			overflow:hidden;
		}
		.sub-row .t-title{
			position:relative;
			background:#fff;
			border-bottom:1px solid #ddd;
			padding:1rem 1rem;
			font-size:14px;
			overflow:hidden;
			color:#999;
		}
		.sub-row .t-title-l{
			position:relative;
			background:#fff;
			padding:1rem 1rem;
			font-size:14px;
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
			background-image: url("../../resources/images/icons-firms/ems.png");
		}
		body{font-family: "微软雅黑"; background:#fff}
		</style>
	</head>
	<body>
		<c:set var="res" value="${res}" />
		<c:set var="result1" value="${result1}" />
		<c:set var="result2" value="${result2}" />
		<div class="container-fluid">
			<div class="collect">
				<p class="sub-title">物流详情</p>
<c:if test="${res == ''}">
				<div class="sub-row">
					${result1}
				</div>
				<div class="sub-row">
					<ul class="ul">
						${result2}
					</ul>
				</div>
</c:if>
<c:if test="${res != ''}">
				<div class="sub-row">
					${res}
				</div>
</c:if>
			</div>
		</div>
	</body>
</html>