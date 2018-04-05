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
		.sub-header{
			position: relative;
			z-index: 1;
			background-color: rgba(255,255,255,.7);
			box-shadow: 0 1px 2px rgba(0,0,0,.8);
			height: 32px;
			margin-bottom: 15px;
			line-height: 32px;
		}
		.main-container{
			color: #666;
			padding-top: 0;
			height: auto;
			margin-top: -47px;
			/*background-color: #eee;*/
		}
		.main-container .banner{
			background: url('/web/resources/images/pic-web/yellow.jpg') no-repeat center;
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
						<li class="nav-item active" id="srv">
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
						<li class="nav-item" id="search">
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
					<a href="/web/service/addressManager">地址管理</a>
				</li>
				<li class="sub-nav-item">
					<a href="/web/service/myLogistics">运单管理</a>
				</li>
				<li class="sub-nav-item">
					<a>公司管理</a>
				</li>
				<li class="sub-nav-item">
					<a>站点管理</a>
				</li>
				<li class="sub-nav-item">
					<a>公司设置</a>
				</li>
			</ul>
		</div>
		<div class="main-container">
			<div class="banner">
				<div class="d-w-990 z-1">
					<div class="grid-25">
						<div class="small-title z-1">
							<h4 style="float:left">服务管理 >> 地址管理</h4>
							<div style="padding:45px 0 0 100px; float:left; background: url('/web/resources/images/pic-web/address-1.png') no-repeat center;"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="second-div d-w-990 z-1">
				<div class="grid-25">
					<div>
						<h5 style="float:left">检索地址</h5>
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
							width: 100px;
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
  							width: 125px;
  							background: #fff;
  							word-break: keep-all;
  							white-space: nowrap;
  							overflow: hidden;
  							text-overflow: ellipsis;
						}
    					/*ui-select end*/
    				</style>
					<form class="address-search-form address-search-max">
						<div class="z-1">
							<div class="z-1">
								<style type="text/css">
								</style>
								<div class="form-item fn-left">
									<label class="form-label">添加时间: </label>
									<div id="time-div" name="time-div" class="form-item-content">
										<select class="form-select" style="display:none">
											<option value="">今天</option>
											<option value="">最近三天</option>
											<option value="">最近一周</option>
											<option value="">最近一个月</option>
										</select>
										<a id="time-selector" name="time-selector" class="select-trigger select-item">今天</a>
										<div id="time-tg" name="time-tg" class="ui-select ui-select-mini" data-widget-cid="widget-8" style="z-index:99;display:none;position:absolute;margin-left:10px;">
											<ul class="ui-select-content" data-role="content" style="padding:0;margin:0;">
												<li data-role="item" class="ui-select-item ui-select-item-selected" data-value="ZTO" data-default-selected="true" data-selected="true" data-disabled>中通</li>
												<li data-role="item" class="ui-select-item" data-value="t" data-default-selected="false" data-selected="false" data-disabled>今天</li>
												<li data-role="item" class="ui-select-item" data-value="td" data-default-selected="false" data-selected="false" data-disabled>最近三天</li>
												<li data-role="item" class="ui-select-item" data-value="w" data-default-selected="false" data-selected="false" data-disabled>最近一周</li>
												<li data-role="item" class="ui-select-item" data-value="m" data-default-selected="false" data-selected="false" data-disabled>最近一个月</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="form-item fn-left">
									<label class="form-label">联系人姓名: </label>
									<div class="form-item-content">
										<input type="text" class="input">
									</div>
								</div>
								<div class="form-item fn-left">
									<label class="form-label">手机号码: </label>
									<div class="form-item-content">
										<input type="text" class="input">
									</div>
								</div>
								<div class="form-item fn-left">
									<div class="form-item-content">
										<p class="btns">
											<a href="" class="address-add-btn" style="width:100px;height:26px;font-size:13px;line-height:26px;margin-left:30px;">搜索</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</form>

					<div class="tab-div z-1">
						<ul class="z-1 in-0">
							<li class="tab-item tab-item-current">
								<a href="<c:url value='/service/receiverAddressManager'/>">收件人地址</a>
							</li>
							<li class="tab-item">
								<a href="<c:url value='/service/senderAddressManager' />">寄件人地址</a>
							</li>
						</ul>
					</div>
					<table class="address-table">
						<colgroup>
							<col width="15%">
							<col width="15%">
							<col width="20%">
							<col width="30%">
							<col width="">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<th class="time">创建时间</th>
								<th>收件人姓名</th>
								<th>手机号码</th>
								<th>详细地址</th>
								<th class="memo"></th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="address-bd">
							<!-- -->
							${AddressList}
						</tbody>
					</table>
					<div class="btns" id="address_btn_r" name="address_btn_r" style="margin-top:20px">
						<a onclick="address_add_action_r()" class="address-add-btn">添加新地址</a>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="address_add_modal_r" tabindex="-1" role="dialog" aria-labelledby="address_add_modal_label_r">
			<!-- style for modal -->
			<!-- style for modal end-->
			<!-- 新增收件人地址 -->
			<div class="second-div d-w-990 z-1">
				<div class="grid-25 z-1" style="float:none">
					<div class="main-left" id="address_dialog_window">
						<div class="card z-1">
							<div class="panel">
								<div class="crumb mg-25" style="margin-left:45px;">
									<span>地址管理</span><em>>></em>
									<a class="current" id="address_add_modal_label_r">新增收件人</a>
									<button id="add_closebtn_r" name="add_closebtn_r" type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-right:30px;"><span aria-hidden="true">&times;</span></button>
								</div>
								<div class="address-box-select mg-25">
									<div class="ul_s">
										<ul style="padding-left:0px;">
											<li>
												<div class="detail-ipt">
													<span class="icon-rt"></span>
													<input id="freceiverMan" name="freceiverMan" type="text" value="" placeholder="收件人">
												</div>
											</li>
											<li>
												<div class="detail-ipt">
													<span class="icon-sj"></span>
													<input id="freceiverManPhone" name="freceiverManPhone" type="text" value="" placeholder="联系电话">
												</div>
											</li>
											<li>
												<div id="addr-div_r" name="addr-div_r" class="z-1" style="width:300px;">
													<div id="pro-selector_r" name="pro-selector_r" class="detail-ipt f-0" style="width:110px;">
														<span class="icon-map"></span><span id="pro-d_r" name="pro-d_r">省</span>
														<input type="hidden" id="pro-d_r_ipt" name="pro-d_r_ipt" value="" >
														<ul id="pro-tg_r" name="pro-tg_r" class="pro-dp" style="display:none;">
															${provinceMenu}
														</ul>
													</div>
													<div id="city-selector_r" name="city-selector_r" class="detail-ipt f-0" style="width:90px;">
														<span id="city-d_r" name="city-d_r">市</span>
														<input type="hidden" id="city-d_r_ipt" name="city-d_r_ipt" value="" >
														<ul id="city-tg_r" name="city-tg_r" class="pro-dp" style="display:none;">
														</ul>
													</div>
													<div id="county-selector_r" name="county-selector_r" class="detail-ipt f-0" style="width:80px;margin-right:0;">
														<span id="county-d_r" name="county-d_r" value="">区</span>
														<input type="hidden" id="county-d_r_ipt" name="county-d_r_ipt" value="" >
														<ul id="county-tg_r" name="county-tg_r" class="pro-dp" style="display:none;">
														</ul>
													</div>
												</div>
											</li>
											<li>
												<div class="detail-ipt" style="padding:0">
													<textarea id="freceiverManAddress" name="freceiverManAddress" cols="4" placeholder="详细地址"></textarea>
												</div>
											</li>
											<li>
												<div class="detail-ipt">
													<span class="icon-address"></span>
													<input id="freceiverCode" name="freceiverCode" type="text" value="" placeholder="邮编">
												</div>
											</li>
										</ul>
									</div>
								</div>
								<div onclick="new_receiver_submit()" class="s-btns mg-25 z-1">
									<a class="search-a-btn" style="width:300px;">保存地址</a>
								</div>	
							</div>	
						</div>
					</div>
				</div>
			</div>		
		</div>
		<!-- address-add-modal button trigger -->
		<button id="address_add_modal_btn_r" name="address_add_modal_btn_r" type="button" data-toggle="modal" data-target="#address_add_modal_r" style="display:none">
		</button>
		<!-- address-add-modal button trigger end -->
		<!-- new receiver form -->
		<form:form action="/web/service/receiverSaves" modelAttribute="receiverVo" method="post">
			<input type="hidden" id="username" name="username" value='${openid}' />
			<!-- receiver -->
			<input type="hidden" id="receiverMan" name="receiverMan" value="" >
			<input type="hidden" id="receiverManAddress" name="receiverManAddress" value="" >
			<input type="hidden" id="receiverManPhone" name="receiverManPhone" value="" >
			<input type="hidden" id="receiverProvince" name="receiverProvince" value="" >
			<input type="hidden" id="receiverCity" name="receiverCity" value="" >
			<input type="hidden" id="receiverCounty" name="receiverCounty" value="" >
			<button id="receiverButton" name="receiverButton" type="submit" style="display:none;"></button>
		</form:form>
		<!-- new receiver form end -->

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
			if(e.target.name == "time-selector" && $(e.target).parents("#time-div").length != 0){
				$("#time-tg").css('display','block');
			}else if($(e.target).parents("#pro-selector_r").length != 0){
				if($(e.target).parents("#pro-tg_r").length != 0);
				else{
					$("#pro-tg_r").css('display','block')
					$("#city-tg_r").css('display','none');
					$("#county-tg_r").css('display','none');
				}
			}else if($(e.target).parents("#city-selector_r").length != 0){
				if($(e.target).parents("#city-tg_r").length != 0);
				else{
					$("#city-tg_r").css('display','block');
					$("#pro-tg_r").css('display','none');
					$("#county-tg_r").css('display','none');
				} 
			}else if($(e.target).parents("#county-selector_r").length != 0){
				if($(e.target).parents("#county-tg_r").length != 0);
				else{
					$("#county-tg_r").css('display','block');
					$("#pro-tg_r").css('display','none');
					$("#city-tg_r").css('display','none');
				} 
			}
			else{
				$("#time-tg").css('display','none');
				$("#pro-tg_r").css('display','none');
				$("#city-tg_r").css('display','none');
				$("#county-tg_r").css('display','none');
			}
		});
		
		/*address add function*/
		function address_add_action_r(){
			getEmptyForm();
			document.getElementById("address_add_modal_btn_r").click();
		}
		/*address add function end*/
		$("#pro-tg_r").children("li").children("a").bind("click",function(e){
			$("#pro-tg_r").css('display','none');
			var obj = e.target;
			document.getElementById("pro-d_r").innerHTML = obj.innerHTML;
			var province = obj.getAttribute("value");
			$("#pro-d_r_ipt").val(province).trigger('change');
		});
		$("#pro-d_r_ipt").change(function(){
			loadSecondMenu('1');
		});
		$("#city-d_r_ipt").change(function(){
			loadThirdMenu('1');
		});

		/*new receiver address*/
		function new_receiver_submit(){
			var name = document.getElementById("freceiverMan").value;
			var address = document.getElementById("freceiverManAddress").value;
			var tel = document.getElementById("freceiverManPhone").value;
			var p = document.getElementById("pro-d_r_ipt").value;
			var c = document.getElementById("city-d_r_ipt").value;
			var county = document.getElementById("county-d_r_ipt").value;

			if( p != null && p != "" && 
			c != null && c != ""  && 
			county != null && county != ""){
				if(name != null && name != ""){
					if(address != null && address != ""){
						if(tel != null && tel != "" && fucCheckNUM(tel) == 1){
							/*add to form*/
							document.getElementById("receiverMan").value = name;
							document.getElementById("receiverManPhone").value = tel;
							document.getElementById("receiverManAddress").value = address;
							document.getElementById("receiverProvince").value = p;
							document.getElementById("receiverCity").value = c;
							document.getElementById("receiverCounty").value = county;
							document.getElementById("receiverButton").click();
							document.getElementById("add_closebtn_r").click();
						}else{
							$("#warning").text("联系电话格式不正确");
							document.getElementById("WarningBtn").click();
						}
					}else{
						$("#warning").text("联系人地址不能为空");
						document.getElementById("WarningBtn").click();
					}
				}else{
					$("#warning").text("联系人姓名不能为空");
					document.getElementById("WarningBtn").click();
				}
			}else{
				$("#warning").text("联系人地址信息不完整");
				document.getElementById("WarningBtn").click();
			}
		}
		/*new receiver address end*/

		/*delete receiver*/
		$("#address-bd").children("tr").children("td").children("p").children("a").bind("click",function(e){
			var trElement = $(e.target).parents("tr");
			var nowId = trElement.eq(0).attr("id");
			deleteOne(nowId);
		});
		function deleteOne(id){
			var xmlHttp;
			if(window.XMLHttpRequest){
				xmlHttp = new XMLHttpRequest();
			}else{
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlHttp.onreadystatechange=function(){
				if (xmlHttp.readyState==4 && xmlHttp.status==200){
					$("#"+id).remove();
				}
			}
			xmlHttp.open("POST","../service/receiverDelete",true);
			xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlHttp.send("deletedId="+id);
		}
		/*delete receiver end*/

		/*use AJAX to get Location information */
		function loadThirdMenu(formNum){
			var menu2Value = -1;
			if(formNum == 1){
				menu2Value = document.getElementById("city-d_r_ipt").value;
			}
			if(menu2Value == -1){
				return;
			}
			var xmlHttp;
			if(window.XMLHttpRequest){
				xmlHttp = new XMLHttpRequest();
			}else{
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlHttp.onreadystatechange=function(){
				if (xmlHttp.readyState==4 && xmlHttp.status==200){
					if(formNum == 1){
						document.getElementById("county-tg_r").innerHTML=xmlHttp.responseText;
						$("#county-tg_r").css('display','block');

						$("#county-tg_r").children("li").children("a").bind("click",function(e){	
							$("#county-tg_r").css('display','none');
							var obj = e.target;
							document.getElementById("county-d_r").innerHTML = obj.innerHTML;
							var county = obj.getAttribute("value");
							$("#county-d_r_ipt").val(county);
						});
					}
				}
			}
			xmlHttp.open("POST","../service/sendMenu",true);
			xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlHttp.send("menu1=&menu2="+menu2Value);
		}
		function loadSecondMenu(formNum){
			var menu1Value = -1;
			if(formNum == 1){
				menu1Value = document.getElementById("pro-d_r_ipt").value;
			}
			if(menu1Value == -1){
				return;
			}
			var xmlHttp;
			if(window.XMLHttpRequest){
				xmlHttp = new XMLHttpRequest();
			}else{
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlHttp.onreadystatechange=function(){
				if (xmlHttp.readyState==4 && xmlHttp.status==200){
					if(formNum == 1){
						document.getElementById("city-tg_r").innerHTML=xmlHttp.responseText;
						$("#city-tg_r").css('display','block');

						$("#city-tg_r").children("li").children("a").bind("click",function(e){
							$("#city-tg_r").css('display','none');
							var obj = e.target;
							document.getElementById("city-d_r").innerHTML = obj.innerHTML;
							var city = obj.getAttribute("value");
							$("#city-d_r_ipt").val(city).trigger('change');
						});
					}
				}
			}
			xmlHttp.open("POST","../service/sendMenu",true);
			xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlHttp.send("menu1="+menu1Value+"&menu2=");
		}
		/*AJAX end*/

		//other
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
			if(NUM.length > 11)
				return 0;
			return 1;
		}
		function getEmptyForm(){
			document.getElementById("freceiverMan").value = "";
			document.getElementById("freceiverManAddress").value = "";
			document.getElementById("freceiverManPhone").value = "";
			document.getElementById("pro-d_r_ipt").value = "";
			document.getElementById("city-d_r_ipt").value = "";
			document.getElementById("county-d_r_ipt").value = "";
			document.getElementById("freceiverCode").value = "";
		}
		//on change trigger
		</script>
	</body>
</html>