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
		<title>快递服务-查询快递</title>
		<style type="text/css">
		.collect{
			border-top:1px solid #ddd;
			border-bottom:none;
		}
		.collect .ul{
			padding-left:1rem;
			overflow:hidden;
			border-bottom:1px solid #ddd;
			background:#fff;
			font-size:1.3rem
		}
		.collect .ul li{
			border-bottom:1px solid #e0e0e0;
			line-height:4.5rem; 
			position:relative;
			min-height:4.5rem
		}
		.collect .ul li span{
			width:8rem; 
			position:absolute;
			top:0;left:0; 
			text-align:right;
			color:#666
		}
		.collect .ul li div{
			margin-left:9.5rem;
			padding-right:1rem
		}
		.collect .ul li div input{
			border: 1px solid;
			border-color: #fff;
			font-size: 1.5rem;
			padding-left: 4px;
			width:100%;
			border:none;
			height:4.5rem;
			background:none;
		}
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
		body{font-family: "微软雅黑";background:#e5e5e5}
		</style>
	</head>
	<body>
		<div class="container-fluid">
			<div class="collect">
				<form:form id="searchReqForm" action="/wechat/service/searchForm" method="post" modelAttribute="searchRequestVo">
					<p class="sub-title">查询订单</p>
					<ul class="ul">
						<li>
							<span>承运公司</span>
							<div>
								<select class="dropdown-toggle btn-lg" id="logisticsProviderCode" name="logisticsProviderCode">
  									<ul class="dropdown-menu">
  										<li><option value="-1" selected="selected">快递公司</option></li>
    									<li><option value="ZTO">中通</option></li>
    									<li><option value="YTO">圆通</option></li>
    									<li><option value="SF">顺丰</option></li>
    									<li><option value="HTKY">汇通</option></li>
    									<li><option value="EMS">EMS</option></li>
   									</ul>
								</select>
							</div>
						</li>
						<li>
							<span>快递单号</span>
							<div>
								<input id="orderId" name="orderId" type="text" placeholder="填写快递单号" value="" />
							</div>
						</li>
						<div class="sub-row">
							<p class="next-button">
								<button onclick="submitAll()" type="button" class="next-button-d">提交</button>
							</p>
						</div>
					</ul>
					<button class="next-button-d" id="saveBtn" name="saveBtn" type="submit" style="display:none"></button>
				</form:form>
			</div>
		</div>

		<!-- modal -->
		<div class="modal fade" id="pendingModal_s" tabindex="-1" role="dialog" aria-labelledby="myModalLabel_s" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
        				<h4 class="modal-title" id="myModalLabel_s">警告</h4>
					</div>
					<div class="modal-body">
						<p>请选择正确的快递公司</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="next-button-alert" data-dismiss="modal">确认</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="pendingModal_a" tabindex="-1" role="dialog" aria-labelledby="myModalLabel_a" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
        				<h4 class="modal-title" id="myModalLabel_a">警告</h4>
					</div>
					<div class="modal-body">
						<p>请填写规范的快递单号</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="next-button-alert" data-dismiss="modal">确认</button>
					</div>
				</div>
			</div>
		</div>
		

		<!-- Button trigger modal -->
		<button id="pending_s_Btn" name="pending_s_Btn" type="button" style="display:none" data-toggle="modal" data-target="#pendingModal_s"></button>
		<button id="pending_a_Btn" name="pending_a_Btn" type="button" style="display:none" data-toggle="modal" data-target="#pendingModal_a"></button>

		<!-- js -->
		<script type="text/javascript">
			
			function submitAll(){
				var lg = document.getElementById("logisticsProviderCode").value;
				var mn = document.getElementById("orderId").value;

				if( lg != null && lg != "" && lg != -1){
					if(mn != null && mn != "" && fucCheckNUM(mn) == 1){
						document.getElementById("saveBtn").click();
					}else{
						document.getElementById("pending_a_Btn").click();
					}
				}else{
					document.getElementById("pending_s_Btn").click();
				}
			}
			function fucCheckNUM(NUM){
				var i,j,strTemp;
				strTemp="0123456789";
				if (NUM.length== 0)
  					return 0;
				for (i=0;i<NUM.length;i++){
  					j=strTemp.indexOf(NUM.charAt(i)); 
					if (j==-1){
   						return 0;
  					}
				}
				return 1;
			}
		</script>

	</body>
</html>