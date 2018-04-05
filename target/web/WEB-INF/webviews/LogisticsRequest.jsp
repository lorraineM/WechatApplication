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
		<script type="text/javascript" src="<c:url value="/resources/js/jquery.form.js" />" ></script>
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
			background: url("/web/resources/images/pic-web/lightgreen.jpg") no-repeat center;*/
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
						<li class="nav-item active" id="send">
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
					<a href="/web/service/send">我要寄件</a>
				</li>
			</ul>
		</div>
		<div class="main-container">
			<div class="banner" style="background:none">
				<div class="d-w-990 z-1">
					<div class="grid-25">
					</div>
				</div>
			</div>

			<div class="second-div d-w-990 z-1" style="width:650px;">
				<i class="side-line"></i>
				<div class="grid-25">
					<div class="left-side z-1">
						<div class="d-s-title z-1">
							<div class="inline-area" style="float:left;">
								<div class="circle"></div>
								<h2><a>寄件人地址</a><a onclick="getAddressList_sender()" class="add-add">[更改]</a></h2>
							</div>
						</div>
						<div id="s-a-div" name="s-a-div" class="address_block">
							${echo1}
						</div>
						<div class="d-s-title z-1">
							<div class="inline-area" style="float:left;">
								<div class="circle"></div>
								<h2><a>收件人地址</a><a onclick="getAddressList_receiver()" class="add-add">[更改]</a></h2>
							</div>
						</div>
						<div id="r-a-div" name="r-a-div" class="address_block">
							${echo3}
						</div>
						<div class="d-s-title z-1">
							<div class="inline-area" style="float:left;">
								<div class="circle"></div>
								<h2><a>其他信息</a></h2>
							</div>
						</div>
						<style type="text/css">
						.o-info-box{
							line-height: 28px;
							height: 28px;
							margin-top: 15px;
						}
						
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
    					.o-info-box .form-label{
							float: left;
							height: 28px;
							line-height: 28px;
							font-weight: 700;
							text-align: right;
							vertical-align: top;
							color: #4d4d4d;
							margin-left: 20px;
						}
						.o-info-box .form-item-content{
							float: left;
							width: 150px;
						}
						.o-info-box .form-item-content .input{
    						height:28px;
    						font-size: 12px;
    						color: #595959;
    						vertical-align: middle;
    						width: 120px;
    						margin-left: 10px;
    					}
    					.address_block textarea{
    						border: none;
    						width: 100%;
    						height: 100%;
    					}
    					.beizhu:hover{
    						border: none;
    						text-decoration: none;
    					}
    					/*重复*/
    					.address_block .preview{
    						line-height: 16px;
    						font-size: 14px;
    						color: #444;
    					}
    					.preview .sed{
    						margin-left: 10px;
    					}
    					.one-block{
    						border-bottom: solid 1px #ccc;
    					}
    					.p-btns a{
							width: 140px;
							height: 40px;
							line-height: 40px;
							padding: 0;
							text-decoration: none;
						}
						/*ffa800 80c7ec*/
						.address-add-btn-o{
							display: inline-block;
							border: none;
							border-radius: 3px;
							overflow: visible;
							font-size: 14px;
							color: #fff;
							text-align: center;
							cursor: pointer;
							background-color: #ffa800;
						}
						.address-add-btn-b{
							display: inline-block;
							border: none;
							border-radius: 3px;
							overflow: visible;
							font-size: 14px;
							color: #fff;
							text-align: center;
							cursor: pointer;
							background-color: #80c7ec;
						}
						.p-btns a:hover{
							text-decoration: none;color: #fff;
						}
						.p-btns a.address-add-btn-o:hover{background-color: #fa7c13;}
						.p-btns a.address-add-btn-b:hover{background-color: #12a5f2;}
						</style>
						<div class="address_block">
							<div class="o-info-box">
								<label class="form-label">承运公司: </label>
								<div id="cmp-div" name="cmp-div" class="form-item-content">
									<a id="cmp-selector" name="cmp-selector" class="select-trigger select-item">中通</a>
									<div id="cmp-tg" name="cmp-tg" class="ui-select ui-select-mini" data-widget-cid="widget-8" style="z-index:99;display:none;position:absolute;margin-left:10px;">
										<ul class="ui-select-content" data-role="content" style="padding:0;margin:0;">
											<li data-role="item" class="ui-select-item ui-select-item-selected" value="ZTO" data-default-selected="true" data-selected="true" data-disabled>中通</li>
											<li data-role="item" class="ui-select-item" alue="YTO" data-default-selected="false" data-selected="false" data-disabled>圆通</li>
											<li data-role="item" class="ui-select-item" value="SF" data-default-selected="false" data-selected="false" data-disabled>顺丰</li>
											<li data-role="item" class="ui-select-item" value="HTKY" data-default-selected="false" data-selected="false" data-disabled>汇通</li>
											<li data-role="item" class="ui-select-item" value="EMS" data-default-selected="false" data-selected="false" data-disabled>EMS</li>
										</ul>
									</div>
								</div>
								<label class="form-label">货品种类: </label>
								<div id="spe-div" name="spe-div" class="form-item-content">
									<a id="spe-selector" name="spe-selector" class="select-trigger select-item">食品</a>
									<div id="spe-tg" name="spe-tg" class="ui-select ui-select-mini" data-widget-cid="widget-8" style="z-index:99;display:none;position:absolute;margin-left:10px;">
										<ul class="ui-select-content" data-role="content" style="padding:0;margin:0;">
											<li data-role="item" class="ui-select-item ui-select-item-selected" value="食品" data-default-selected="true" data-selected="true" data-disabled>食品</li>
											<li data-role="item" class="ui-select-item" value="药品" data-default-selected="false" data-selected="false" data-disabled>药品</li>
											<li data-role="item" class="ui-select-item" value="电子产品/器件" data-default-selected="false" data-selected="false" data-disabled>电子产品/器件</li>
											<li data-role="item" class="ui-select-item" value="服饰" data-default-selected="false" data-selected="false" data-disabled>服饰</li>
											<li data-role="item" class="ui-select-item" value="文件" data-default-selected="false" data-selected="false" data-disabled>文件</li>
											<li data-role="item" class="ui-select-item" value="贵重物品" data-default-selected="false" data-selected="false" data-disabled>贵重物品</li>
											<li data-role="item" class="ui-select-item" value="其他" data-default-selected="false" data-selected="false" data-disabled>其他</li>
										</ul>
									</div>
								</div>
							</div>
							<style type="text/css">
							.radio_btn{
								display: inline-block;
								background-color: #fff;
								border: none;
								padding: 6px 12px;
								font-size: 13px;
								font-weight: normal;
  								line-height: 1.42857143;
  								text-align: center;
  								touch-action: manipulation;
  								cursor: pointer;
  								border-top-right-radius: 0;
  								border-bottom-right-radius: 0;
  								vertical-align: middle;
							}
							.radio_btn input[type="radio"]{
								position: absolute;
  								clip: rect(0, 0, 0, 0);
  								pointer-events: none;
							}
							.radio_btn.active{
								background-color: #12a5f2;
							color: #fff;
							}
							.btn-group > .radio_btn{
								float: left;
								position: relative;
							}
							</style>
							<div class="o-info-box">
								<label class="form-label">支付方式: </label>
								<div class="btn-group" data-toggle="buttons" style="margin-left:10px;">
  									<label name="cmp-pay" id="cmp-pay" class="radio_btn active">
    									<input type="radio" autocomplete="off" checked> 公司支付
 						 			</label>
 									<label name="ind-pay" id="ind-pay" class="radio_btn">
    									<input type="radio" autocomplete="off"> 个人支付
 									</label>
								</div>
							</div>	
						</div>
						<div class="d-s-title z-1">
							<div class="p-btns" id="address_btn" name="address_btn" style="margin-top:20px">
								<a class="address-add-btn-o" onclick="ship_req_submit()">提交并打印</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- modal select address-->
		<div class="modal fade" id="address_select_modal_s" tabindex="-1" role="dialog" aria-labelledby="address_select_modal_label_s" aria-hidden="true">
			<style type="text/css">
			.scroll-y-for-window{
				height: 300px;
				overflow-x: hidden;
				overflow-y: scroll;
			}
			.ft-gray{
				color: #9a9a9a;
			}
			#address-tg_r p,#address-tg_s p{
				font-size: 12px;
				margin: 0;
			}
			.s-btns.p-center{
				text-align: center;
				margin-top: 30px;
			}
			</style>
			<!-- 寄件人模块 -->
			<div class="second-div d-w-990 z-1">
				<div class="grid-25 z-1" style="float:none">
					<div class="main-left" id="address_dialog_window_s">
						<div class="card z-1">
							<div class="panel">
								<div class="crumb mg-25" style="margin-left:5px;">
									<a class="current" id="address_select_modal_label_s">选择寄件人地址</a>
									<button id="closebtn_s" name="closebtn_s" type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-right:30px;"><span aria-hidden="true">&times;</span></button>
								</div>
								<div class="address-box-select">
									<table class="address-table table-hover">
										<colgroup>
											<col width="5%">
											<col width="15%">
											<col width="20%">
											<col width="30%">
											<col width="5%">
										</colgroup>
										<thead>
											<tr>
												<th></th>
												<th>寄件人姓名</th>
												<th>手机号码</th>
												<th>详细地址</th>
												<th></th>
											</tr>
										</thead>
									</table>
								</div>
								<div name="a-s-div" id="a-s-div" class="address-box-select scroll-y-for-window">
									<table class="address-table table-hover">
										<colgroup>
											<col width="5%">
											<col width="15%">
											<col width="20%">
											<col width="30%">
											<col width="5%">
										</colgroup>
										<thead style="display:none;">
											<tr>
												<th></th>
												<th>寄件人姓名</th>
												<th>手机号码</th>
												<th>详细地址</th>
												<th></th>
											</tr>
										</thead>
										<tbody id="address-tg_s" name="address-tg_s">
											<!-- address List -->
										</tbody>
									</table>
								</div>
								<div id="address_btn_s" name="address_btn_s" class="s-btns z-1 p-center">
									<a onclick="address_add_action_s()" class="search-a-btn" style="width:300px;">新增地址</a>
								</div>	
							</div>	
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="address_select_modal_r" tabindex="-1" role="dialog" aria-labelledby="address_select_modal_label_r" aria-hidden="true">
			<!-- 收件人模块 -->
			<div class="second-div d-w-990 z-1">
				<div class="grid-25 z-1" style="float:none">
					<div class="main-left" id="address_dialog_window_r">
						<div class="card z-1">
							<div class="panel">
								<div class="crumb mg-25" style="margin-left:5px;">
									<a class="current" id="address_select_modal_label_r">选择收件人地址</a>
									<button id="closebtn_r" name="closebtn_r" type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-right:30px;"><span aria-hidden="true">&times;</span></button>
								</div>
								<div class="address-box-select">
									<table class="address-table table-hover">
										<colgroup>
											<col width="5%">
											<col width="15%">
											<col width="20%">
											<col width="30%">
											<col width="5%">
										</colgroup>
										<thead>
											<tr>
												<th></th>
												<th>收件人姓名</th>
												<th>手机号码</th>
												<th>详细地址</th>
												<th></th>
											</tr>
										</thead>
									</table>
								</div>
								<div name="a-r-div" id="a-r-div" class="address-box-select scroll-y-for-window">
									<table class="address-table table-hover">
										<colgroup>
											<col width="5%">
											<col width="15%">
											<col width="20%">
											<col width="30%">
											<col width="5%">
										</colgroup>
										<thead style="display:none;">
											<tr>
												<th></th>
												<th>收件人姓名</th>
												<th>手机号码</th>
												<th>详细地址</th>
												<th></th>
											</tr>
										</thead>
										<tbody id="address-tg_r" name="address-tg_r">
											<!-- address List-->
										</tbody>
									</table>
								</div>
								<div id="address_btn_r" name="address_btn_r" class="s-btns z-1 p-center">
									<a onclick="address_add_action_r()" class="search-a-btn" style="width:300px;">新增地址</a>
								</div>	
							</div>	
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- modal select address end-->
		<!-- modal add address -->
		<div class="modal fade" id="address_add_modal_s" tabindex="-1" role="dialog" aria-labelledby="address_add_modal_label_s" aria-hidden="true">
			<!-- 新增寄件人地址 -->
			<div class="second-div d-w-990 z-1">
				<div class="grid-25 z-1" style="float:none">
					<div class="main-left" id="address_dialog_window_s">
						<div class="card z-1">
							<div class="panel">
								<div class="crumb mg-25" style="margin-left:45px;">
									<span>地址管理</span><em>>></em>
									<a class="current" id="address_add_modal_label_s">新增寄件人</a>
									<button id="add_closebtn_s" name="add_closebtn_s" type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-right:30px;"><span aria-hidden="true">&times;</span></button>
								</div>
								<div class="address-box-select mg-25">
									<div class="ul_s">
										<ul style="padding-left:0px;">
											<li>
												<div class="detail-ipt">
													<span class="icon-rt"></span>
													<input id="fsenderMan" name="fsenderMan" type="text" value="" placeholder="寄件人">
												</div>
											</li>
											<li>
												<div class="detail-ipt">
													<span class="icon-sj"></span>
													<input id="fsenderManPhone" name="fsenderManPhone" type="text" value="" placeholder="联系电话">
												</div>
											</li>
											<li>
												<div id="addr-div_s" name="addr-div_s" class="z-1" style="width:300px;">
													<div id="pro-selector_s" name="pro-selector_s" class="detail-ipt f-0" style="width:110px;">
														<span class="icon-map"></span><span id="pro-d_s" name="pro-d_s">省</span>
														<input type="hidden" id="pro-d_s_ipt" name="pro-d_s_ipt" value="" >
														<ul id="pro-tg_s" name="pro-tg_s" class="pro-dp" style="display:none;">
															${provinceMenu}
														</ul>
													</div>
													<div id="city-selector_s" name="city-selector_s" class="detail-ipt f-0" style="width:90px;">
														<span id="city-d_s" name="city-d_s">市</span>
														<input type="hidden" id="city-d_s_ipt" name="city-d_s_ipt" value="" >
														<ul id="city-tg_s" name="city-tg_s" class="pro-dp" style="display:none;">
														</ul>
													</div>
													<div id="county-selector_s" name="county-selector_s" class="detail-ipt f-0" style="width:80px;margin-right:0;">
														<span id="county-d_s" name="county-d_s" value="">区</span>
														<input type="hidden" id="county-d_s_ipt" name="county-d_s_ipt" value="" >
														<ul id="county-tg_s" name="county-tg_s" class="pro-dp" style="display:none;">
														</ul>
													</div>
												</div>
											</li>
											<li>
												<div class="detail-ipt" style="padding:0">
													<textarea id="fsenderManAddress" name="fsenderManAddress" cols="4" placeholder="详细地址"></textarea>
												</div>
											</li>
											<li>
												<div class="detail-ipt">
													<span class="icon-address"></span>
													<input type="text" id="fsenderCode" name="fsenderCode" value="" placeholder="邮编">
												</div>
											</li>
										</ul>
									</div>
								</div>
								<div onclick="new_sender_submit()" class="s-btns mg-25 z-1">
									<a class="search-a-btn" style="width:300px;">保存地址</a>
								</div>	
							</div>	
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="address_add_modal_r" tabindex="-1" role="dialog" aria-labelledby="address_add_modal_label_r">
			<!-- 新增收件人地址 -->
			<div class="second-div d-w-990 z-1">
				<div class="grid-25 z-1" style="float:none">
					<div class="main-left" id="address_dialog_window_r">
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
		<!-- modal add address end -->
		<!-- address-select-modal button trigger -->
		<button id="address_select_modal_btn_s" name="address_select_modal_btn_s" type="button" data-toggle="modal" data-target="#address_select_modal_s" style="display:none">
		</button>
		<button id="address_select_modal_btn_r" name="address_select_modal_btn_r" type="button" data-toggle="modal" data-target="#address_select_modal_r" style="display:none">
		</button>
		<!-- address-select-modal button trigger end -->
		<!-- address-add-modal button trigger -->
		<button id="address_add_modal_btn_s" name="address_add_modal_btn_s" type="button" data-toggle="modal" data-target="#address_add_modal_s" style="display:none">
		</button>
		<button id="address_add_modal_btn_r" name="address_add_modal_btn_r" type="button" data-toggle="modal" data-target="#address_add_modal_r" style="display:none">
		</button>
		<!-- address-add-modal button trigger end -->

		<!-- true form -->
		<!-- logistics form -->
		<form:form action="/web/service/logisticsSave" modelAttribute="shippingRequestVo" method="post">
			<input type="hidden" id="username" name="username" value='${openid}' />
			<!-- sender -->
			<!-- receiver -->
			<!-- company -->
			<input type="hidden" id="logisticsProviderCode" name="logisticsProviderCode" value="YTO" >
			<input type="hidden" id="itemName" name="itemName" value="食品" >

			<button id="shipButton" name="shipButton" type="submit" style="display:none;"></button>
		</form:form>
		<!-- logistics form end -->

		<!-- new sender form -->
		<form:form action="/web/service/senderSaveAJAX" modelAttribute="senderVo" method="post">
			<input type="hidden" id="username" name="username" value='${openid}' />
			<!-- sender -->
			<button id="senderButton" name="senderButton" type="submit" style="display:none;"></button>
		</form:form>
		<!-- new sender form end -->
		<!-- new receiver form -->
		<form:form action="/web/service/receiverSaveAJAX" modelAttribute="receiverVo" method="post">
			<input type="hidden" id="username" name="username" value='${openid}' />
			<!-- receiver -->
			<button id="receiverButton" name="receiverButton" type="submit" style="display:none;"></button>
		</form:form>
		<div id="sform" name="sform">
			<input type="hidden" id="senderMan" name="senderMan" value='${senderMan}' />
			<input type="hidden" id="senderManAddress" name="senderManAddress" value='${senderManAddress}' />
			<input type="hidden" id="senderManPhone" name="senderManPhone" value='${senderManPhone}' />
			<input type="hidden" id="senderProvince" name="senderProvince" value='${senderProvince}' >
			<input type="hidden" id="senderCity" name="senderCity" value='${senderCity}' />
			<input type="hidden" id="senderCounty" name="senderCounty" value='${senderCounty}' />
		</div>
		<div id="rform" name="rform">
			<input type="hidden" id="receiverMan" name="receiverMan" value="" >
			<input type="hidden" id="receiverManAddress" name="receiverManAddress" value="" >
			<input type="hidden" id="receiverManPhone" name="receiverManPhone" value="" >
			<input type="hidden" id="receiverProvince" name="receiverProvince" value="" >
			<input type="hidden" id="receiverCity" name="receiverCity" value="" >
			<input type="hidden" id="receiverCounty" name="receiverCounty" value="" >
		</div>
		<!-- new receiver form end -->
		<input id="selectedId_s" name="selectedId_s" type="hidden" value="-1" > 
		<input id="selectedId_r" name="selectedId_r" type="hidden" value="-1" > 
		<input id="openid" name="openid" type="hidden" value='${openid}' />
		<!-- true form end-->

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
		})
		$("#srv").mouseout(function(){
			$("#srv").children("div").css('display','none');
		})
		$("body").bind("click",function(e){
			if(e.target.name == "cmp-selector" && $(e.target).parents("#cmp-div").length != 0){
				$("#cmp-tg").css('display','block');
				$("#spe-tg").css('display','none');
			}else if(e.target.name == "spe-selector" && $(e.target).parents("#spe-div").length != 0){
				$("#spe-tg").css('display','block');
				$("#cmp-tg").css('display','none');
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
			}else if($(e.target).parents("#pro-selector_s").length != 0){
				if($(e.target).parents("#pro-tg_s").length != 0);
				else{
					$("#pro-tg_s").css('display','block')
					$("#city-tg_s").css('display','none');
					$("#county-tg_s").css('display','none');
				}
			}else if($(e.target).parents("#city-selector_s").length != 0){
				if($(e.target).parents("#city-tg_s").length != 0);
				else{
					$("#city-tg_s").css('display','block');
					$("#pro-tg_s").css('display','none');
					$("#county-tg_s").css('display','none');
				} 
			}else if($(e.target).parents("#county-selector_s").length != 0){
				if($(e.target).parents("#county-tg_s").length != 0);
				else{
					$("#county-tg_s").css('display','block');
					$("#pro-tg_s").css('display','none');
					$("#city-tg_s").css('display','none');
				} 
			}
			else{
				$("#cmp-tg").css('display','none');
				$("#spe-tg").css('display','none');
				$("#pro-tg_r").css('display','none');
				$("#city-tg_r").css('display','none');
				$("#county-tg_r").css('display','none');
				$("#pro-tg_s").css('display','none');
				$("#city-tg_s").css('display','none');
				$("#county-tg_s").css('display','none');
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
				document.getElementById("logisticsProviderCode").value = m.getAttribute("value");
			}
		});
		$("#spe-tg").children("ul").bind("click",function(e){
			var nowNode = $("#spe-tg").children("ul").find('li.ui-select-item-selected');
			nowNode.removeClass('ui-select-item-selected');
			nowNode.attr("data-selected","false");
			if($(e.target).parents("ul").length != 0){
				var s = $(e.target);
				var m = e.target;
				s.attr("data-selected","true");
				s.addClass('ui-select-item-selected');
				document.getElementById("spe-selector").innerHTML = m.innerHTML;
				document.getElementById("itemName").value = m.getAttribute("value");
			}
		});

		/*checkbox button*/
		$("#cmp-pay").bind('click',function(){
			$("#cmp-pay").addClass("active");
			$("#ind-pay").removeClass("active");
		});
		$("#ind-pay").bind('click',function(){
			$("#ind-pay").addClass("active");
			$("#cmp-pay").removeClass("active");
		});
		/*checkbox button end*/

		/*bind click for province menu */
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
		$("#pro-tg_s").children("li").children("a").bind("click",function(e){
			$("#pro-tg_s").css('display','none');
			var obj = e.target;
			document.getElementById("pro-d_s").innerHTML = obj.innerHTML;
			var province = obj.getAttribute("value");
			$("#pro-d_s_ipt").val(province).trigger('change');
		});
		$("#pro-d_s_ipt").change(function(){
			loadSecondMenu('2');
		});
		$("#city-d_s_ipt").change(function(){
			loadThirdMenu('2');
		});

		/*bind click for province menu end*/

		/*address add function*/
		function address_add_action_s(){
			getEmptyFormS();
			document.getElementById("address_add_modal_btn_s").click();
			$("#address_select_modal_s").fadeOut("slow");
		}
		function address_add_action_r(){
			getEmptyFormR();
			document.getElementById("address_add_modal_btn_r").click();
			$("#address_select_modal_r").fadeOut("slow");
		}
		/*address add function end*/

		var str1 = "<p><span class=\"icon-rt\"></span>";
		var str2 = "<span class=\"icon-sj\"></span>";
		var str3 = "</p><p class=\"last\">";
		var str4 = "</p>";
		function bindClickS(){
			$("#address-tg_s").children("tr").bind("click",function(e){
				var obj = $(e.target).parents("tr");
				var child = obj.children("td");
				var sc = child.eq(1);
				var tc = child.eq(2);
				var fc = child.eq(3);
				var name = sc.text();
				var tel = tc.text();
				var addr = fc.text();

				var dd = fc.children("p").children("span");
				var p = dd.eq(0).text();
				var c = dd.eq(1).text();
				var county = dd.eq(2).text();
				var address = dd.eq(3).text();

				document.getElementById("s-a-div").innerHTML = str1 + name + str2 + tel + str3 + addr + str4;

				/*add to form*/
				document.getElementById("senderMan").value = name;
				document.getElementById("senderManPhone").value = tel;
				document.getElementById("senderManAddress").value = address;
				document.getElementById("senderProvince").value = p;
				document.getElementById("senderCity").value = c;
				document.getElementById("senderCounty").value = county;

				/*关闭modal split*/
				document.getElementById("selectedId_s").value = obj.get(0).getAttribute("value");
				document.getElementById("closebtn_s").click();

			});
		}
		function bindClickR(){
			$("#address-tg_r").children("tr").bind("click",function(e){
				var obj = $(e.target).parents("tr");
				var child = obj.children("td");
				var sc = child.eq(1);
				var tc = child.eq(2);
				var fc = child.eq(3);
				var name = sc.text();
				var tel = tc.text();
				var addr = fc.text();

				var dd = fc.children("p").children("span");
				var p = dd.eq(0).text();
				var c = dd.eq(1).text();
				var county = dd.eq(2).text();
				var address = dd.eq(3).text();

				document.getElementById("r-a-div").innerHTML = str1 + name + str2 + tel + str3 + addr + str4;

				/*add to form*/
				document.getElementById("receiverMan").value = name;
				document.getElementById("receiverManPhone").value = tel;
				document.getElementById("receiverManAddress").value = address;
				document.getElementById("receiverProvince").value = p;
				document.getElementById("receiverCity").value = c;
				document.getElementById("receiverCounty").value = county;

				/*关闭modal*/
				document.getElementById("selectedId_r").value = obj.get(0).getAttribute("value");
				document.getElementById("closebtn_r").click();
			});
		}

		/*shipping request submit function*/
		function ship_req_submit(){
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

			var logisticsProviderCode = document.getElementById("logisticsProviderCode").value;
			var itemName = document.getElementById("itemName").value;

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
					var formDoc1 = document.getElementById("sform").innerHTML;
					var formDoc2 = document.getElementById("rform").innerHTML;
					var oldFormDoc = document.getElementById("shippingRequestVo").innerHTML;
					$("#shippingRequestVo").append(formDoc1+formDoc2);
					document.getElementById("shipButton").click();
					document.getElementById("shippingRequestVo").innerHTML = oldFormDoc;
						
				}else{
					$("#warning").text("收件人信息不完整");
					document.getElementById("WarningBtn").click();
				}
			}else{
				$("#warning").text("寄件人信息不完整");
				document.getElementById("WarningBtn").click();
			}
		}
		/*shipping request submit function end */
		/*new sender address*/
		function new_sender_submit(){
			var name = document.getElementById("fsenderMan").value;
			var address = document.getElementById("fsenderManAddress").value;
			var tel = document.getElementById("fsenderManPhone").value;
			var p = document.getElementById("pro-d_s_ipt").value;
			var c = document.getElementById("city-d_s_ipt").value;
			var county = document.getElementById("county-d_s_ipt").value;

			if( p != null && p != "" && 
			c != null && c != ""  && 
			county != null && county != ""){
				if(name != null && name != ""){
					if(address != null && address != ""){
						if(tel != null && tel != "" && fucCheckNUM(tel) == 1){
							document.getElementById("s-a-div").innerHTML = str1 + name + str2 + tel + str3 + address + str4;
							/*add to form*/
							document.getElementById("senderMan").value = name;
							document.getElementById("senderManPhone").value = tel;
							document.getElementById("senderManAddress").value = address;
							document.getElementById("senderProvince").value = p;
							document.getElementById("senderCity").value = c;
							document.getElementById("senderCounty").value = county;
							var formDoc = document.getElementById("sform").innerHTML;
							var oldFormDoc = document.getElementById("senderVo").innerHTML;
							$("#senderVo").append(formDoc);
							$("#senderVo").ajaxForm();
							document.getElementById("senderButton").click();
							document.getElementById("senderVo").innerHTML = oldFormDoc;
							document.getElementById("add_closebtn_s").click();
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
		/*new sender address end*/
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
							document.getElementById("r-a-div").innerHTML = str1 + name + str2 + tel + str3 + address + str4;

							/*add to form*/
							document.getElementById("receiverMan").value = name;
							document.getElementById("receiverManPhone").value = tel;
							document.getElementById("receiverManAddress").value = address;
							document.getElementById("receiverProvince").value = p;
							document.getElementById("receiverCity").value = c;
							document.getElementById("receiverCounty").value = county;
							var formDoc = document.getElementById("rform").innerHTML;
							var oldFormDoc = document.getElementById("receiverVo").innerHTML;
							$("#receiverVo").append(formDoc);
							$("#receiverVo").ajaxForm();
							document.getElementById("receiverButton").click();
							document.getElementById("receiverVo").innerHTML = oldFormDoc;
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

		/*use AJAX to get Location information */
		function loadThirdMenu(formNum){
			var menu2Value = -1;
			if(formNum == 1){
				menu2Value = document.getElementById("city-d_r_ipt").value;
			}else if(formNum == 2){
				menu2Value = document.getElementById("city-d_s_ipt").value;	
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
					}else if(formNum == 2){
						document.getElementById("county-tg_s").innerHTML=xmlHttp.responseText;
						$("#county-tg_s").css('display','block');

						$("#county-tg_s").children("li").children("a").bind("click",function(e){	
							$("#county-tg_s").css('display','none');
							var obj = e.target;
							document.getElementById("county-d_s").innerHTML = obj.innerHTML;
							var county = obj.getAttribute("value");
							$("#county-d_s_ipt").val(county);
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
			}else if(formNum == 2){
				menu1Value = document.getElementById("pro-d_s_ipt").value;

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
					}else if(formNum == 2){
						document.getElementById("city-tg_s").innerHTML=xmlHttp.responseText;
						$("#city-tg_s").css('display','block');

						$("#city-tg_s").children("li").children("a").bind("click",function(e){
							$("#city-tg_s").css('display','none');
							var obj = e.target;
							document.getElementById("city-d_s").innerHTML = obj.innerHTML;
							var city = obj.getAttribute("value");
							$("#city-d_s_ipt").val(city).trigger('change');
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

		//AJAX for address list
		function getAddressList_sender(){
			//var hasRecord = document.getElementById("hasRecord_s").value;
			var selectedId = document.getElementById("selectedId_s").value;
			var openid = document.getElementById("openid").value;

			var xmlHttp;
			if(window.XMLHttpRequest){
				xmlHttp = new XMLHttpRequest();
			}else{
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlHttp.onreadystatechange=function(){
				if (xmlHttp.readyState==4 && xmlHttp.status==200){
					var resultXML = xmlHttp.responseXML.documentElement;
					var hasRecord = resultXML.getElementsByTagName("hs")[0].childNodes[0].nodeValue;
					if(hasRecord == "0"){
						getEmptyFormS();
						document.getElementById("address_add_modal_btn_s").click();
					}else if(hasRecord == "1"){
						var addressList = resultXML.getElementsByTagName("dr")[0].innerHTML;
						document.getElementById("address-tg_s").innerHTML = addressList;
						bindClickS();
						document.getElementById("address_select_modal_btn_s").click();
					}else;
				}
			}
			xmlHttp.open("POST","../service/hasSender",true);
			xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlHttp.send("selectedId="+selectedId+"&openid="+openid);
		}
		function getAddressList_receiver(){
			var selectedId = document.getElementById("selectedId_r").value;
			var openid = document.getElementById("openid").value;

			var xmlHttp;
			if(window.XMLHttpRequest){
				xmlHttp = new XMLHttpRequest();
			}else{
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlHttp.onreadystatechange=function(){
				if (xmlHttp.readyState==4 && xmlHttp.status==200){
					var resultXML = xmlHttp.responseXML.documentElement;
					var hasRecord = resultXML.getElementsByTagName("hs")[0].childNodes[0].nodeValue;
					if(hasRecord == "0"){
						getEmptyFormR();
						document.getElementById("address_add_modal_btn_r").click();
					}else if(hasRecord == "1"){
						var addressList = resultXML.getElementsByTagName("dr")[0].innerHTML;
						document.getElementById("address-tg_r").innerHTML = addressList;
						bindClickR();
						document.getElementById("address_select_modal_btn_r").click();
					}else;
				}
			}
			xmlHttp.open("POST","../service/hasReceiver",true);
			xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlHttp.send("selectedId="+selectedId+"&openid="+openid);
		}

		//empty form
		function getEmptyFormS(){
			document.getElementById("fsenderMan").value = "";
			document.getElementById("fsenderManAddress").value = "";
			document.getElementById("fsenderManPhone").value = "";
			document.getElementById("pro-d_s_ipt").value = "";
			document.getElementById("city-d_s_ipt").value = "";
			document.getElementById("county-d_s_ipt").value = "";
			document.getElementById("fsenderCode").value = "";
		}
		function getEmptyFormR(){
			document.getElementById("freceiverMan").value = "";
			document.getElementById("freceiverManAddress").value = "";
			document.getElementById("freceiverManPhone").value = "";
			document.getElementById("pro-d_r_ipt").value = "";
			document.getElementById("city-d_r_ipt").value = "";
			document.getElementById("county-d_r_ipt").value = "";
			document.getElementById("freceiverCode").value = "";
		}
		</script>
	</body>
</html>