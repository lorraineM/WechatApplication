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
		<title>快递服务-其他信息填写</title>
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
		body{font-family: "微软雅黑";background:#e5e5e5}
		</style>
	</head>
	<body>
		<div class="container-fluid">
			<div class="collect">
				<form:form id="sendReqForm3" action="/wechat/service/logisticsSave" method="post" modelAttribute="shippingRequestVo">
					<p class="sub-title">其他信息</p>
					<ul class="ul">
						<li>
							<span>承运公司</span>
							<div>
								<select class="dropdown-toggle btn-lg" id="logisticsProviderCode" name="logisticsProviderCode">
  									<ul class="dropdown-menu">
  										<li><option value="" selected="selected">请选择快递公司</option></li>
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
							<span>货品类别</span>
							<div>
								<select class="dropdown-toggle btn-lg" id="itemName" name="itemName">
									<ul class="dropdown-menu">
										<li><option value="食品" selected="selected">请选择货品类别</option></li>
    									<li><option value="食品">食品</option></li>
    									<li><option value="药品">药品</option></li>
    									<li><option value="电子产品/器件">电子产品/器件</option></li>
    									<li><option value="服饰">服饰</option></li>
    									<li><option value="文件">文件</option></li>
    									<li><option value="贵重物品">贵重物品</option></li>
    									<li><option value="其他">其他</option></li>
									</ul>
								</select>
							</div>
						</li>
						<li>
							<span>备注</span>
							<div>
								<input id="remark" name="remark" type="text" placeholder="备注信息" value="" />
							</div>
						</li>
						<div class="sub-row">
							<p class="next-button">
								<button onclick="submit()" id="finalButton" name="finalButton" class="next-button-d">提交</button>
							</p>
						</div>
					</ul>
				</form:form>
			</div>
		</div>
		
		<div class="modal fade" id="pendingModal_l" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
        				<h4 class="modal-title" id="myModalLabel">警告</h4>
					</div>
					<div class="modal-body">
						<p>请选择快递公司</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">确认</button>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="pendingModal_n" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
        				<h4 class="modal-title" id="myModalLabel">警告</h4>
					</div>
					<div class="modal-body">
						<p>请选择货品种类</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">确认</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Button trigger modal -->
		<input id="pending_l" name="pending_l" value="" type="hidden" />
		<button id="pending_l_Btn" name="pending_l_Btn" type="button" style="display:none" data-toggle="modal" data-target="#pendingModal_l"></button>

		<input id="pending_n" name="pending_n" value="" type="hidden" />
		<button id="pending_n_Btn" name="pending_n_Btn" type="button" style="display:none" data-toggle="modal" data-target="#pendingModal_n"></button>

		<script type="text/javascript">
			function submit(){
				var logisticsProviderCode = document.getElementById("logisticsProviderCode").value;
				var itemName = document.getElementById("itemName").value;
				if(logisticsProviderCode != null && logisticsProviderCode != ""){
					if(if(itemName != null && itemName != "")){
						document.getElementById("finalButton").click();
					}else{
						document.getElementById("pending_n_Btn").click();
					}
				}else{
					document.getElementById("pending_l_Btn").click();
				}
			}
		</script>
	</body>
</html>