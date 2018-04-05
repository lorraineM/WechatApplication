<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>快递下单Demo</title>
		<meta name="author" content="xxx" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.css" />" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/header.css" />" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mycss.css" />" />
		<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js" />" ></script>
		<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js" />" ></script>
		<style type="text/css">
		.main-container{
			color: #666;
			padding-top: 0;
			height: auto;
			margin-top: -47px;
			/*background-color: #eee;*/
		}
		.main-container .banner{
			background: url("/web/resources/images/pic-web/deepblue.jpg") no-repeat center;*/
			padding-top: 42px;
			color: #fff;
			border-bottom: 1px solid #eee;
			position: relative;
		}
		.grid-25{
			width: 990px;
			float: left;
			margin: 0 10px 10px 0;
			padding: 0;
			display: inline;
		}
		.small-title{
			display: block;
			overflow: hidden;
			position: relative;
			color: #4d4d4d;
			clear: both;
		}
		.z-1:after{visibility:hidden;display:block;font-size:0;content:" ";clear:both;height:0}
		
		.s-btns a{
			margin-left: 190px;
			width: 220px;
			height: 40px;
			line-height: 40px;
			padding: 0;
			text-decoration: none;
			background-color: #ffa800;
			text-decoration:none;
		}
		.s-btns a:hover{background-color: #fa7c13;text-decoration: none;color: #fff;}
		.search-a-btn{
			display: inline-block;
			border: none;
			border-radius: 3px;
			overflow: visible;
			font-size: 18px;
			color: #ffffff;
			text-align: center;
			cursor: pointer;
		}
		
		</style>
	</head>
	<body>
		<div class="top_header">
			<div class="d-w-990 top_header-wrap z-1">
				<ul class="topmenu">
					<li class="topmenu-item topmenu-item-first">
						欢迎用户:
					</li>
					<li class="topmenu-item">
						<a href="" title="进入我的快递demo">15200000000</a>
					</li>
					<li class="topmenu-item">
						<a seed="logout" href="">退出登录</a>
					</li>
					<li class="topmenu-item topmenu-item-last">
						<a href="" target="_blank" title="常见问题FAQ">常见问题</a>
					</li>
				</ul>
			</div>
		</div>
		<header class="header">
			<div class="d-w-990 header-wrap z-1">
				<nav role="navigation">
					<ul class="nav">
						<li class="nav-item" id="home">
							<a href="" class="nav-item-link">首页</a>
						</li>
						<li class="nav-item" id="send">
							<a href="/web/service/send" class="nav-item-link">我要寄件</a>
						</li>
						<li class="nav-item" id="srv">
							<a href="/web/service/myLogistics" class="nav-item-link">管理服务</a>
							<div class="nav-item-sub sl-shadow" style="display:none;">
								<table class="nav-item-table">
									<thead></thead>
									<tbody style="font-size:12px">
										<tr>
											<td><a href="/web/service/addressManager">地址管理</a></td>
											<td class="last"><a href="/web/service/myLogistics">运单管理</a></td>
										</tr>
										<tr>
											<td><a>公司管理</a></td>
											<td class="last"><a>站点管理</a></td>
										</tr>
										<tr>
											<td class"last"><a>公司配置</a></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="angle sl-angle"></div>
						</li>
						<li class="nav-item active" id="search">
							<a href="/web/service/search" class="nav-item-link">快件查询</a>
						</li>
						<li class="nav-item" id="about">
							<a class="nav-item-link">关于我们</a>
						</li>
					</ul>
				</nav>
			</div>
		</header>
		<div class="sub-header">
			<ul class="sub-nav">
				<li class="sub-nav-item sub-nav-item-current">
					<a href="/web/service/search">我要查件</a>
				</li>
			</ul>
		</div>
		<div class="main-container">
			<div class="banner">
				<div class="d-w-990 z-1">
					<div class="grid-25">
						<div class="small-title z-1">
							<h4 style="float:left;color:#e4e2e1">快件查询 >> 填写查询条件</h4>
						</div>
					</div>
				</div>
			</div>
			<style type="text/css">
			.search{
				width: 650px;
				margin-top: 50px;
				padding: 6px 20px 20px;
				background: #fcfcfc;
				border: 1px solid #d7d7d7;
				box-shadow: 0 0 4px 1px #eee;
				color: #323232;
				text-align: left;
			}
			.search .top{
				border-bottom: 1px solid #d7d7d7;
				height: 43px;
				padding: 12px 0;
			}
			.search-item-num{
				float: left;
				width: 300px;
			}
			.search-item-title{
				padding: 20px 0 5px;
				line-height: 14px;
				color: #636363;
				font-weight: 700;
			}
			.search-item-num-d , .search-item-select-d input{
				width: 270px;
  				height: 36px;
  				padding: 8px 0 8px 10px;
  				border: 1px solid #c0c0c0;
 				background: #fff;
  				font-size: 14px;
  				line-height: 18px;
  				color: #323232;
			}
			.search-item-select-d span{
				display: block;
  				width: 270px;
  				height:36px;
  				padding: 5px 5px;
  				border: 1px solid #c0c0c0;
  				font-size: 14px;
  				line-height: 18px;
  				color: #323232;
  				background: #fff url("/web/resources/images/pic-web/icon_arrowdrop.png") no-repeat 250px center;
  				cursor: pointer;
			}
			.search-item-select-d .dp{
				position: absolute;
				left: 0;
				top: 36px;
				width: 270px;
				background: #fff;
				border: 1px solid #c0c0c0;
				padding-left:0; 
			}
			.search-item-select-d .dp li.first{
				border-top: 0;
			}
			.search-item-select-d .dp li {
  				border-top: 1px solid #d7d7d7;
  				margin-left: 10px;
			}
			.search-item-select-d a{
				height: 36px;
				display: block;
  				font-size: 14px;
  				line-height: 36px;
  				text-align: left;
  				color: #323232;
			}
			.search-item-select{
				float: left;
				width: 270px;
			}
			input{
				border: none;
				outline: none;
			}
			.info{
				width: 650px;
				margin: 30px 0;
				margin-left: -40px;
			}
			.info .one{
				background: url("/web/resources/images/pic-web/airplane.png") no-repeat 0 0;
			}
			.info .two{
				background: url("/web/resources/images/pic-web/medal.png") no-repeat 0 0;
			}
			.info li{
				float: left;
				width: 265px;
				padding-left: 55px;
				margin-left: 40px;
			}
			.info .small-title{
				font-size: 14px;
				line-height: 16px;
				font-weight: 700;
				margin-bottom: 5px;
			}
			.info .text{
				color: #959595;
			} 
			.sidebar{
				float: right;
				width: 270px;
				margin-top: 50px;
			}
			.s-title{
				width: 100%;
				height: 20px;
				margin-bottom: 20px;
			}
			.s-title .name {
  				float: left;
  				font: 18px/20px "hiragino sans gb","Microsoft YaHei",\9ED1\4F53,\5b8b\4f53,sans-serif;
  				color: #636363;
			}
			.main-left{
				float: left;
				width: 650px;
				position: relative;
			}
			.mobile-list li{
  				padding-left: 12px;
  				background: url("/web/resources/images/pic-web/search-sidebar-sorrow.png") no-repeat 0 5px;
  				margin-bottom: 5px;
 				color: #636363;
 				float: left;
			}
			.sidebar .line{
				width: 100%;
				height: 2px;
				overflow: hidden;
				margin: 30px 0;
				background-color: #d7d7d7;
			}
			</style>
			<div class="second-div d-w-990 z-1">
				<div class="grid-25">
					<div class="main-left">
					<div class="search z-1">
						<form>
							<div class="top" style="font-size:18px;margin-bottom:5px;">
								<div>订单查询条件</div>
							</div>
							<div class="search-item">
								<div class="search-item-num">
									<p class="search-item-title">订单号</p>
									<div class="search-item-num-d" style="position:relative">
										<input id="order-ipt" name="order-ipt" type="text" placeholder="请输入订单号" value="">
									</div>
								</div>
							</div>
							<style type="text/css">
							/*ui-select*/
    						.ui-select{
								border: 1px solid #eee;
  								font-family: tahoma;
  								overflow-y: auto;
  								overflow-x: hidden;
  								width: 154px;
  								_height: expression(this.scrollHeight>252?"253px":"auto");
 			 					max-height: 253px;
							}
							.ui-select-mini{
								width: 200px;
							}
							.ui-select-content{
								background: #f2f2f2;
							}
							.ui-select-item:hover{
								background: #f9f9f9;
							}
							.ui-select ul li.ui-select-item-selected{
								background: #f0f0f0;
							}
							.ui-select-item{
								font-size: 12px;
  								list-style: none;
 			 					height: 28px;
  								line-height: 28px;
  								padding: 0 15px 0 10px;
  								cursor: default;
  								width: 225px;
  								background: #fff;
  								word-break: keep-all;
  								white-space: nowrap;
  								overflow: hidden;
  								text-overflow: ellipsis;
							}
							/*ui-select-mini ui-select-item width has changed*/
    						/*ui-select end*/
    						#cmp-selector.select-item{
    							width: 200px;
    							height: 36px;
    						}
    						#cmp-selector.select-trigger{
    							background-position: right -523px;
    							line-height: 36px;
    						}
    						</style>
							<div class="search-item">
								<div class="search-item-select">
									<p class="search-item-title">承运公司</p>
									<div id="cmp-div" name="cmp-div" class="form-item-content">
										<a id="cmp-selector" name="cmp-selector" class="select-trigger select-item">中通</a>
										<input type="hidden" id="cmp-tg_ipt" name="cmp-tg_ipt" value="ZTO">
										<div id="cmp-tg" name="cmp-tg" class="ui-select ui-select-mini" data-widget-cid="widget-8" style="z-index:99;display:none;position:absolute;margin-left:10px;">
											<ul class="ui-select-content" data-role="content" style="padding:0;margin:0;">
												<li data-role="item" class="ui-select-item ui-select-item-selected" data-value="ZTO" data-disabled>中通</li>
												<li data-role="item" class="ui-select-item" data-value="YTO" data-disabled>圆通</li>
												<li data-role="item" class="ui-select-item" data-value="SF" data-disabled>顺丰</li>
												<li data-role="item" class="ui-select-item" data-value="HTKY" data-disabled>汇通</li>
												<li data-role="item" class="ui-select-item" data-value="EMS" data-disabled>EMS</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="s-btns z-1" style="padding-top:120px">
								<a onclick="SubmitAll()" class="search-a-btn">一键查询</a>
							</div>
						</form>
					</div>
					<div class="info z-1">
						<li class="one">
							<h2 class="small-title">随时把握快件动态</h2>
							<p class="text">
								迟迟没有收到快递？不用担心。我们与多家快递公司合作，您可以随时利用相应的快递单号获取您的快递状态。
							</p>
						</li>
						<li class="two">
							<h2 class="small-title" style="z-index:-1">支持范围广</h2>
							<p class="text">
								目前我们支持利用以下公司的快递单号进行查询：中通，圆通，顺丰，汇通，EMS。请输入正确的快递单号，并选择相匹配的承运公司，就能获取您的快递动态哦！
							</p>
						</li>
					</div>
					</div>
					<div class="sidebar z-1">
						<p>
							<img width="270" height="186" alt src="/web/resources/images/pic-web/weixin.png" style="border:0">
						</p>
						<div>
							<div class="s-title">
								<h3 class="name">移动端·更精彩</h3>
							</div>
							<ul class="mobile-list" style="padding-left:0">
								<li>关注公众微信平台。随时随地，掏出手机就能查快递。</li>
								<li>每次查快递都要登录，很麻烦！移动端帮你解决。方便省心，免登陆，还等什么呢！</li>
							</ul>
						</div>
						<div class="line"></div>
					</div>
				</div>
			</div>
		</div>

		<!-- form -->
		<form:form id="searchReqForm" action="/web/service/searchForm" method="post" modelAttribute="searchRequestVo">
		<input type="hidden" id="logisticsProviderCode" name="logisticsProviderCode" value="">
		<input type="hidden" id="orderId" name="orderId" value="">
		<button id="saveBtn" name="saveBtn" type="submit" style="display:none;"></button>
		</form:form>
		<!-- form end -->

		<!-- warning -->
		<div class="modal fade" id="WarningModal" tabindex="-1" role="dialog" aria-labelledby="WarningLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
        				<h4 class="modal-title" id="WarningLabel">警告</h4>
					</div>
					<div class="modal-body">
						<p id="warning"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="next-button-alert" data-dismiss="modal">确认</button>
					</div>
				</div>
			</div>
		</div>
		<button id="WarningBtn" name="WarningBtn" type="button" style="display:none" data-toggle="modal" data-target="#WarningModal"></button>
		<!-- warning end-->

		<script type="text/javascript" charset="UTF-8">
		$("#srv").mouseover(function(){
			$("#srv").children("div").css('display','block');
		});
		$("#srv").mouseout(function(){
			$("#srv").children("div").css('display','none');
		});
		$("body").bind("click",function(e){
			if(e.target.name == "cmp-selector" && $(e.target).parents("#cmp-div").length != 0){
				$("#cmp-tg").css('display','block');
			}else{
				$("#cmp-tg").css('display','none');
			}
		});
		$("#cmp-tg").children("ul").bind("click",function(e){
			var nowNode = $("#cmp-tg").children("ul").find('li.ui-select-item-selected');
			nowNode.removeClass('ui-select-item-selected');
			nowNode.attr("data-selected","false");
			if($(e.target).parents("ul").length != 0){
				var s = $(e.target);
				var m = e.target;
				s.attr("data-selected","true");
				s.addClass('ui-select-item-selected');
				document.getElementById("cmp-selector").innerHTML = m.innerHTML;
				document.getElementById("cmp-tg_ipt").value = m.getAttribute("data-value");
			}
		});

		function SubmitAll(){
			var lg = document.getElementById("cmp-tg_ipt").value;
			var oi = document.getElementById("order-ipt").value;
			if( lg != null && lg != ""){
				if(oi != null && oi != "" && fucCheckNUM(oi) == 1){
					document.getElementById("logisticsProviderCode").value = lg;
					document.getElementById("orderId").value = oi;
					document.getElementById("saveBtn").click();
				}else{
					$("#warning").text("请填写正确的快递面单号");
					document.getElementById("WarningBtn").click();
				}
			}else{
				$("#warning").text("请选择承运快递公司");
				document.getElementById("WarningBtn").click();
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