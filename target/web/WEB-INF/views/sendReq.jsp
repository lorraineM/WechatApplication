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
		<title>快递服务-寄快递</title>
		<style type="text/css">
		.icon-jiantou{
			width:2rem;
			height:2rem;
			display: inline-block; 
			position:absolute;
			margin-top:-1rem;
			top:50%;
			right:0.8rem;
			background-size:100% auto; 
			background-image: url(<c:url value="/resources/images/icons-png/jiantou.png" />);
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
		.icon-jt{
			width:1.66rem;
			height:1.66rem;
			display: inline-block;
			background-size:100% auto; 
			background-image: url(<c:url value="/resources/images/icons-png/wxz.png" />);
			margin-left:1rem
		}
		.sub-title{
			padding:1rem;
			font-size:1.5rem;
			height:4rem;
			line-height:2rem;
			color:#999;
			border-bottom:1px solid #ddd;
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
		.next-button{
			text-align: center;
			padding-top: 3rem;
		}
		.next-button-d{
			width:90%;
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
		.sub-row .ul{
			padding-left:1rem;
			overflow:hidden;
			border-bottom:1px solid #ddd;
			background:#fff;
			font-size:1.3rem
		}
		.sub-row .ul li{
			border-bottom:1px solid #e0e0e0;
			line-height:4.5rem; 
			position:relative;
			min-height:4.5rem
		}
		.sub-row .ul li span{
			top:0;left:0; 
			text-align:right;
			color:#666
		}
		.sub-row .ul li div{
			margin-left:9.5rem;
			padding-right:1rem
		}
		body{font-family: "微软雅黑";background:#e5e5e5}
		</style>
	</head>
	<body>
		<div class="container-fluid">
			<div class="sub-row">
				<div onclick="forwardToSender()">
					<p class="sub-title">寄件人</p>
					${echo1}
				</div>
			</div>
			<div class="sub-row">
				<div onclick="forwardToReceiver()">
					<p class="sub-title">收件人</p>
					${echo3}
					</div>
				</div>
			</div>
			<div class="sub-row">
				<p class="next-button">
					<button onclick="submitAll()" id="finalButton" name="finalButton" class="next-button-d">下一步</button>
				</p>
			</div>
		</div>
		<form:form action="/wechat/service/senderChoose" method="post">
			<input type="hidden" id="openid" name="openid" value='${openid}' />
			<input type="hidden" id="hs" name="hs" value='${hsRecord}' />
			<button id="sbutton" name="sbutton" type="submit" style="display:none"></button>
		</form:form>
		<form:form action="/wechat/service/receiverChoose" method="post">
			<input type="hidden" id="openid" name="openid" value='${openid}' />
			<button id="rbutton" name="rbutton" type="submit" style="display:none"></button>
		</form:form>
		<form:form action="/wechat/service/sendResult" modelAttribute="senderVo" method="post">
			<input type="hidden" id="username" name="username" value='${username}' />
			<input type="hidden" id="senderMan" name="senderMan" value='${senderMan}' />
			<input type="hidden" id="senderManAddress" name="senderManAddress" value='${senderManAddress}' />
			<input type="hidden" id="senderManPhone" name="senderManPhone" value='${senderManPhone}' />
			<input type="hidden" id="senderProvince" name="senderProvince" value='${senderProvince}' />
			<input type="hidden" id="senderCity" name="senderCity" value='${senderCity}' />
			<input type="hidden" id="senderCounty" name="senderCounty" value='${senderCounty}' />
			<button id="finalbutton_s" name="finalbutton_s" type="submit" style="display:none"></button>
		</form:form>
		<form:form action="/wechat/service/sendResult" modelAttribute="receiverVo" method="post">
			<input type="hidden" id="username" name="username" value='${username}' />
			<input type="hidden" id="receiverMan" name="receiverMan" value='${receiverMan}' />
			<input type="hidden" id="receiverManAddress" name="receiverManAddress" value='${receiverManAddress}' />
			<input type="hidden" id="receiverManPhone" name="receiverManPhone" value='${receiverManPhone}' />
			<input type="hidden" id="receiverProvince" name="receiverProvince" value='${receiverProvince}' />
			<input type="hidden" id="receiverCity" name="receiverCity" value='${receiverCity}' />
			<input type="hidden" id="receiverCounty" name="receiverCounty" value='${receiverCounty}' />
			<button id="finalbutton_r" name="finalbutton_r" type="submit" style="display:none"></button>
		</form:form>
		
		<!-- model -->
		<div class="modal fade" id="pendingModal_s" tabindex="-1" role="dialog" aria-labelledby="myModalLabel_s" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
        				<h4 class="modal-title" id="myModalLabel_s">警告</h4>
					</div>
					<div class="modal-body">
						<p>请填写寄件人信息</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="next-button-alert" data-dismiss="modal">确认</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="pendingModal_r" tabindex="-1" role="dialog" aria-labelledby="myModalLabel_r" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
        				<h4 class="modal-title" id="myModalLabel_r">警告</h4>
					</div>
					<div class="modal-body">
						<p>请填写收件人信息</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="next-button-alert" data-dismiss="modal">确认</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Button trigger modal -->

		<input id="pending_s" name="pending_s" value="" type="hidden" />
		<button id="pending_s_Btn" name="pending_s_Btn" type="button" style="display:none" data-toggle="modal" data-target="#pendingModal_s"></button>

		<input id="pending_r" name="pending_r" value="" type="hidden" />
		<button id="pending_r_Btn" name="pending_r_Btn" type="button" style="display:none" data-toggle="modal" data-target="#pendingModal_r"></button>


		<script type="text/javascript">
			function forwardToSender(){
				document.getElementById("sbutton").click();
			}
			function forwardToReceiver(){
				document.getElementById("rbutton").click();
			}
			function submitAll(){
				//sender
				var senderMan = document.getElementById("senderMan").value;
				var senderManAddress = document.getElementById("senderManAddress").value;
				var senderManPhone = document.getElementById("senderManPhone").value;
				var senderProvince = document.getElementById("senderProvince").value;
				var senderCity = document.getElementById("senderCity").value;
				var senderCounty = document.getElementById("senderCounty").value;
				//receiver
				var receiverMan = document.getElementById("receiverMan").value;
				var receiverManAddress = document.getElementById("receiverManAddress").value;
				var receiverManPhone = document.getElementById("receiverManPhone").value;
				var receiverProvince = document.getElementById("receiverProvince").value;
				var receiverCity = document.getElementById("receiverCity").value;
				var receiverCounty = document.getElementById("receiverCounty").value;

				if(senderMan != null && senderMan != "" && 
				senderManAddress != null && senderManAddress != "" && 
				senderManPhone != null && senderManPhone != "" && 
				senderProvince != null && senderProvince != "" && 
				senderCity != null && senderCity != "" && 
				senderCounty != null && senderCounty != ""){
					if(receiverMan != null && receiverMan != "" && 
					receiverManAddress != null && receiverManAddress != "" &&
					receiverManPhone != null && receiverManPhone != "" &&
					receiverProvince != null && receiverProvince != "" &&
					receiverCity != null && receiverCity != "" &&
					receiverCounty != null && receiverCounty != ""){
							document.getElementById("finalbutton_s").click();
							document.getElementById("finalbutton_r").click();
							window.location.href="logisticsChoose"
					}else{
						document.getElementById("pending_r_Btn").click();
					}
				}else{
					document.getElementById("pending_s_Btn").click();
				}
			}
		</script>
	</body>
</html>