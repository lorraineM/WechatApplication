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
			background: url("/web/resources/images/pic-web/yellow.jpg") no-repeat center;*/
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
				<li class="sub-nav-item">
					<a href="/web/service/addressManager">地址管理</a>
				</li>
				<li class="sub-nav-item sub-nav-item-current">
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
							<h4 style="float:left">服务管理 >> 运单管理</h4>
							<div style="padding:45px 0 0 100px; float:left; background:url('/web/resources/images/pic-web/logistics.png') no-repeat center;"></div>
						</div>
					</div>
				</div>
			</div>
			<style type="text/css">
			.inline-block{
				display: inline-block;
				zoom: 1;
			}
			.form-item-content .custom-date-input{
				display: inline-block;
				zoom: 1;
			}
			.form-item .input-len-10{
				width: 100px;
			}
			.fn-hide{
				display: none;
			}
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
			.option-keyword-label{
				display: inline-block;
				margin-left: 2px;
				vertical-align: middle;
			}
			.l-28{
				line-height: 28px;
			}
			.m-10{
				margin-top: 10px;
			}
			.in-0{
				padding-left: 0;
				margin-bottom: 0;
			}
			</style>

			<div class="second-div d-w-990 z-1">
				<div class="grid-25">
					<div>
						<h5 id="log-M-search-form-t" name="log-M-search-form-t" style="float:left">检索订单</h5>
					</div>
					<form id="log-M-search-form" name="log-M-search-form" class="address-search-form address-search-max">
						<div class="z-1">
							<div class="z-1">
								<div class="form-item fn-left">
									<label class="form-label">添加时间: </label>
									<div class="form-item-content"  style="width:auto;">
										<div id="tm-div" name="tm-div" class="inline-block custom-date-input" >
											<input readonly="readonly" class="input input-len-10" id="beginDate" name="beginDate" value="2015.04.02" autocomplete="off" data-widget-cid="widget-5">
											<select id="beginTime" name="beginTime" class="form-select fn-hide" autocomplete="off" style="display:none;">
												<option value="00:00" selected>00:00</option>
												<option value="01:00">01:00</option>
												<option value="02:00">02:00</option>
												<option value="03:00">03:00</option>
												<option value="04:00">04:00</option>
												<option value="05:00">05:00</option>
												<option value="06:00">06:00</option>
												<option value="07:00">07:00</option>
												<option value="08:00">08:00</option>
												<option value="09:00">09:00</option>
												<option value="10:00">10:00</option>
												<option value="11:00">11:00</option>
												<option value="12:00">12:00</option>
												<option value="13:00">13:00</option>
												<option value="14:00">14:00</option>
												<option value="15:00">15:00</option>
												<option value="16:00">16:00</option>
												<option value="17:00">17:00</option>
												<option value="18:00">18:00</option>
												<option value="19:00">19:00</option>
												<option value="20:00">20:00</option>
												<option value="21:00">21:00</option>
												<option value="22:00">22:00</option>
												<option value="23:00">23:00</option>
												<option value="24:00">24:00</option>
											</select>
											<a id="tm-1-selector" name="tm-1-selector" class="select-trigger select-item">00:00</a>
											<div id="tm-1-tg" name="tm-1-tg" class="ui-select ui-select-mini" data-widget-cid="widget-7" style="z-index:99;display:none;position:absolute;margin-left:123px;">
												<ul class="ui-select-content" data-role="content" style="padding:0;margin:0;">
													<li data-role="item" class="ui-select-item ui-select-item-selected" data-value="00:00" data-default-selected="true" data-selected="true" data-disabled>00:00</li>
													<li data-role="item" class="ui-select-item" data-value="01:00" data-default-selected="false" data-selected="false" data-disabled>01:00</li>
													<li data-role="item" class="ui-select-item" data-value="02:00" data-default-selected="false" data-selected="false" data-disabled>02:00</li>
													<li data-role="item" class="ui-select-item" data-value="03:00" data-default-selected="false" data-selected="false" data-disabled>03:00</li>
													<li data-role="item" class="ui-select-item" data-value="04:00" data-default-selected="false" data-selected="false" data-disabled>04:00</li>
													<li data-role="item" class="ui-select-item" data-value="05:00" data-default-selected="false" data-selected="false" data-disabled>05:00</li>
													<li data-role="item" class="ui-select-item" data-value="06:00" data-default-selected="false" data-selected="false" data-disabled>06:00</li>
													<li data-role="item" class="ui-select-item" data-value="07:00" data-default-selected="false" data-selected="false" data-disabled>07:00</li>
													<li data-role="item" class="ui-select-item" data-value="08:00" data-default-selected="false" data-selected="false" data-disabled>08:00</li>
													<li data-role="item" class="ui-select-item" data-value="09:00" data-default-selected="false" data-selected="false" data-disabled>09:00</li>
													<li data-role="item" class="ui-select-item" data-value="10:00" data-default-selected="false" data-selected="false" data-disabled>10:00</li>
													<li data-role="item" class="ui-select-item" data-value="11:00" data-default-selected="false" data-selected="false" data-disabled>11:00</li>
													<li data-role="item" class="ui-select-item" data-value="12:00" data-default-selected="false" data-selected="false" data-disabled>12:00</li>
													<li data-role="item" class="ui-select-item" data-value="13:00" data-default-selected="false" data-selected="false" data-disabled>13:00</li>
													<li data-role="item" class="ui-select-item" data-value="14:00" data-default-selected="false" data-selected="false" data-disabled>14:00</li>
													<li data-role="item" class="ui-select-item" data-value="15:00" data-default-selected="false" data-selected="false" data-disabled>15:00</li>
													<li data-role="item" class="ui-select-item" data-value="16:00" data-default-selected="false" data-selected="false" data-disabled>16:00</li>
													<li data-role="item" class="ui-select-item" data-value="17:00" data-default-selected="false" data-selected="false" data-disabled>17:00</li>
													<li data-role="item" class="ui-select-item" data-value="18:00" data-default-selected="false" data-selected="false" data-disabled>18:00</li>
													<li data-role="item" class="ui-select-item" data-value="19:00" data-default-selected="false" data-selected="false" data-disabled>19:00</li>
													<li data-role="item" class="ui-select-item" data-value="20:00" data-default-selected="false" data-selected="false" data-disabled>20:00</li>
													<li data-role="item" class="ui-select-item" data-value="21:00" data-default-selected="false" data-selected="false" data-disabled>21:00</li>
													<li data-role="item" class="ui-select-item" data-value="22:00" data-default-selected="false" data-selected="false" data-disabled>22:00</li>
													<li data-role="item" class="ui-select-item" data-value="23:00" data-default-selected="false" data-selected="false" data-disabled>23:00</li>
													<li data-role="item" class="ui-select-item" data-value="24:00" data-default-selected="false" data-selected="false" data-disabled>24:00</li>
												</ul>
											</div>
											<em class="ft-bar">-</em>
											<input readonly="readonly" class="input input-len-10" id="endDate" name="endDate" value="2015.04.08" autocomplete="off">
											<select id="endTime" name="endTime" class="form-select fn-hide" autocomplete="off" style="display:none;">
												<option value="00:00">00:00</option>
												<option value="01:00">01:00</option>
												<option value="02:00">02:00</option>
												<option value="03:00">03:00</option>
												<option value="04:00">04:00</option>
												<option value="05:00">05:00</option>
												<option value="06:00">06:00</option>
												<option value="07:00">07:00</option>
												<option value="08:00">08:00</option>
												<option value="09:00">09:00</option>
												<option value="10:00">10:00</option>
												<option value="11:00">11:00</option>
												<option value="12:00">12:00</option>
												<option value="13:00">13:00</option>
												<option value="14:00">14:00</option>
												<option value="15:00">15:00</option>
												<option value="16:00">16:00</option>
												<option value="17:00">17:00</option>
												<option value="18:00">18:00</option>
												<option value="19:00">19:00</option>
												<option value="20:00">20:00</option>
												<option value="21:00">21:00</option>
												<option value="22:00">22:00</option>
												<option value="23:00">23:00</option>
												<option value="24:00" selected>24:00</option>
											</select>
											<a id="tm-2-selector" name="tm-2-selector" class="select-trigger select-item">24:00</a>
											<div id="tm-2-tg" name="tm-2-tg" class="ui-select ui-select-mini" data-widget-cid="widget-7" style="z-index:99;display:none;position:absolute;margin-left:369px;">
												<ul class="ui-select-content" data-role="content" style="padding:0;margin:0;">
													<li data-role="item" class="ui-select-item ui-select-item-selected" data-value="00:00" data-default-selected="true" data-selected="true" data-disabled>00:00</li>
													<li data-role="item" class="ui-select-item" data-value="01:00" data-default-selected="false" data-selected="false" data-disabled>01:00</li>
													<li data-role="item" class="ui-select-item" data-value="02:00" data-default-selected="false" data-selected="false" data-disabled>02:00</li>
													<li data-role="item" class="ui-select-item" data-value="03:00" data-default-selected="false" data-selected="false" data-disabled>03:00</li>
													<li data-role="item" class="ui-select-item" data-value="04:00" data-default-selected="false" data-selected="false" data-disabled>04:00</li>
													<li data-role="item" class="ui-select-item" data-value="05:00" data-default-selected="false" data-selected="false" data-disabled>05:00</li>
													<li data-role="item" class="ui-select-item" data-value="06:00" data-default-selected="false" data-selected="false" data-disabled>06:00</li>
													<li data-role="item" class="ui-select-item" data-value="07:00" data-default-selected="false" data-selected="false" data-disabled>07:00</li>
													<li data-role="item" class="ui-select-item" data-value="08:00" data-default-selected="false" data-selected="false" data-disabled>08:00</li>
													<li data-role="item" class="ui-select-item" data-value="09:00" data-default-selected="false" data-selected="false" data-disabled>09:00</li>
													<li data-role="item" class="ui-select-item" data-value="10:00" data-default-selected="false" data-selected="false" data-disabled>10:00</li>
													<li data-role="item" class="ui-select-item" data-value="11:00" data-default-selected="false" data-selected="false" data-disabled>11:00</li>
													<li data-role="item" class="ui-select-item" data-value="12:00" data-default-selected="false" data-selected="false" data-disabled>12:00</li>
													<li data-role="item" class="ui-select-item" data-value="13:00" data-default-selected="false" data-selected="false" data-disabled>13:00</li>
													<li data-role="item" class="ui-select-item" data-value="14:00" data-default-selected="false" data-selected="false" data-disabled>14:00</li>
													<li data-role="item" class="ui-select-item" data-value="15:00" data-default-selected="false" data-selected="false" data-disabled>15:00</li>
													<li data-role="item" class="ui-select-item" data-value="16:00" data-default-selected="false" data-selected="false" data-disabled>16:00</li>
													<li data-role="item" class="ui-select-item" data-value="17:00" data-default-selected="false" data-selected="false" data-disabled>17:00</li>
													<li data-role="item" class="ui-select-item" data-value="18:00" data-default-selected="false" data-selected="false" data-disabled>18:00</li>
													<li data-role="item" class="ui-select-item" data-value="19:00" data-default-selected="false" data-selected="false" data-disabled>19:00</li>
													<li data-role="item" class="ui-select-item" data-value="20:00" data-default-selected="false" data-selected="false" data-disabled>20:00</li>
													<li data-role="item" class="ui-select-item" data-value="21:00" data-default-selected="false" data-selected="false" data-disabled>21:00</li>
													<li data-role="item" class="ui-select-item" data-value="22:00" data-default-selected="false" data-selected="false" data-disabled>22:00</li>
													<li data-role="item" class="ui-select-item" data-value="23:00" data-default-selected="false" data-selected="false" data-disabled>23:00</li>
													<li data-role="item" class="ui-select-item" data-value="24:00" data-default-selected="false" data-selected="false" data-disabled>24:00</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="form-item fn-left">
									<label class="form-label">承运公司: </label>
									<div id="cmp-div" name="cmp-div" class="form-item-content">
										<select class="form-select" style="display:none">
											<option value="">中通</option>
											<option value="">圆通</option>
											<option value="">顺丰</option>
											<option value="">汇通</option>
											<option value="">EMS</option>
										</select>
										<a id="cmp-selector" name="cmp-selector" class="select-trigger select-item">中通</a>
										<div id="cmp-tg" name="cmp-tg" class="ui-select ui-select-mini" data-widget-cid="widget-8" style="z-index:99;display:none;position:absolute;margin-left:10px;">
											<ul class="ui-select-content" data-role="content" style="padding:0;margin:0;">
												<li data-role="item" class="ui-select-item ui-select-item-selected" data-value="ZTO" data-default-selected="true" data-selected="true" data-disabled>中通</li>
												<li data-role="item" class="ui-select-item" data-value="YTO" data-default-selected="false" data-selected="false" data-disabled>圆通</li>
												<li data-role="item" class="ui-select-item" data-value="SF" data-default-selected="false" data-selected="false" data-disabled>顺丰</li>
												<li data-role="item" class="ui-select-item" data-value="HTKY" data-default-selected="false" data-selected="false" data-disabled>汇通</li>
												<li data-role="item" class="ui-select-item" data-value="EMS" data-default-selected="false" data-selected="false" data-disabled>EMS</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="z-1">
								<div class="form-item fn-left" style="350px;">
									<label class="form-label">打印状态: </label>
									<div class="form-item-content" style="margin-left:10px;width:250px;">
										<input class="m-10" type="checkbox" name="p-1" id="" value="" >
										<label for="p-1" class="option-keyword-label l-28" autocomplete="off">全部</label>
										<input class="m-10" type="checkbox" name="p-2" id="" value="" >
										<label for="p-2" class="option-keyword-label l-28" autocomplete="off">未打印</label>
										<input class="m-10" type="checkbox" name="p-1" id="" value="" >
										<label for="p-3" class="option-keyword-label l-28" autocomplete="off">打印成功</label>
										<input class="m-10" type="checkbox" name="p-1" id="" value="" >
										<label for="p-4" class="option-keyword-label l-28" autocomplete="off">打印失败</label>
									</div>
								</div>
								<div class="form-item fn-left" style="margin-left:19px;width:250px;">
									<label class="form-label">订单号码: </label>
									<div class="form-item-content">
										<input type="text" class="input" style="width:100px;">
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
					<div class="z-1">
						<h5 style="float:left">您的订单</h5>
					</div>
					<!-- detail slide up/down -->
					<style type="text/css">
					.log-detail{
						border: none;
 						background: #fff;
					}
					.log-detail .log-header{
						position: relative;
						background-color: #647390;
					}
					.log-detail .log-header .certify-log-pic{
						display: inline-block;
						text-align: center;
						margin: 33px 0 33px 50px;
					}
					.log-detail .log-header .log-info{
						position: absolute;
						left: 210px;
						padding: 35px 0 30px 0;
						font-size: 14px;
						color: #fff;
					}
					.log-info h3{
						font-size: 15px;
						color: #fff;
					}
					.log-info h3 span{
						color: #ffd73e;					
					}
					.log-info li{
						float: left;
 	 					min-width: 100px;
  						padding-right: 40px;
  						line-height: 25px;
  						font-size: 14px;
  						color: #c1cbdf
					}
					.ui-line .ui-solid{
						width: 618px;
					}
					.ui-line{
						margin: 12px 0 7px 0;
  						border-bottom: 1px solid #c3c3c3;
					}

					/*log-body*/
					.log-body .send-content,.log-body .recv-content{
  						padding: 20px 40px;
  						margin: 15px auto 0 0;
					}
					.single-region{
						margin-top: 15px;
  						border: 1px solid #e7e7e7;
  						background: #fff;
					}
					.log-body h4{
						font-size: 14px;
					}
					.send-content h4{
						color: #61a2ec;
					}
					.recv-content h4{
						color: #f48a11;
					}
					.detail-list{
						display: inline-block;
  						color: gray;
  						font-size: 12px;
  						line-height: 2.2;
					}
					.log-body .detail-list{
						line-height: 1.8em;
  						font-size: 14px;
					}
					.detail-list-t{
  						margin: 0;
					}
					.log-body .detail-list-t1,.log-body .detail-list-t2{
						width: auto;
  						padding-right: 10px;
  						text-align: left;
  						color: #999;
					}
					.detail-list-t1 span{
						margin-right: 25px;
					}
					.detail-list-t2 span{
						margin-right: 10px;
					}
					</style>
					<div name="log-detail" id="log-detail" class="log-detail z-1" style="display:none;">
						<div class="log-header" style="height:146px;">
							<div class="certify-log-pic">
								<img id="log-pic-h" src="" width="92" height="80">
							</div>
							<div class="log-info" style="top:-25px;">
								<h3>订单编号: <span id="log-code"></span></h3>
								<ul class="z-1">
									<li>承运公司: <span id="log-name-d"></span></li>
									<li>收件人姓名: <span id="log-man"></span></li>
								</ul>
								<div class="ui-line ui-solid"></div>
								<p>下单时间: <span id="log-time"></span></p>
							</div>
						</div>
						<div class="log-body z-1">
							<div class="single-region send-content">
								<h4>寄件人信息:</h4>
								<div class="detail-list">
									<div class="detail-list-t1">寄件人姓名: <span id="sman"></span>联系电话: <span id="stel"></span></div>
									<div class="detail-list-t2">寄件人地址: <span id="sp"></span><span id="sc"></span><span id="scc"></span><span id="sa"></span></div>
								</div>
							</div>
							<div class="single-region recv-content">
								<h4>收件人信息:</h4>
								<div class="detail-list">
									<div class="detail-list-t1">收件人姓名: <span id="rman"></span>联系电话: <span id="rtel"></span></div>
									<div class="detail-list-t2">收件人地址: <span id="rp"></span><span id="rc"></span><span id="rcc"></span><span id="ra"></span></div>
								</div>
							</div>
						</div>
					</div>
					<!-- detail slide up/down end -->
					<div id="address-table-tab" name="address-table-tab" class="tab-div z-1">
						<ul class="z-1 in-0">
							<li class="tab-item tab-item-current">
								<a href="">全部</a>
							</li>
							<li class="tab-item">
								<a href="">流转中</a>
							</li>
							<li class="tab-item">
								<a href="">已签收</a>
							</li>
							<li class="tab-item">
								<a href="">未发运</a>
							</li>
							<li class="tab-item">
								<a href="">无流转信息</a>
							</li>
							<li class="tab-item">
								<a href="">获取流转信息错误</a>
							</li>
							<li class="tab-item">
								<a href="">异常</a>
							</li>
						</ul>
					</div>
					<table class="address-table">
						<colgroup>
							<col width="15%">
							<col width="20%">
							<col width="40%">
							<col width="10%">
							<col width="">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<th class="time">下单时间</th>
								<th>订单号</th>
								<th>收件人<em class="ft-bar">|</em>收件地址</th>
								<th>承运公司</th>
								<th class="memo"></th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="address-bd">
							${result}
						</tbody>
					</table>
					<p id="btn-n" name="btn-n" class="btns" style="margin-top:20px">
						<a class="address-add-btn" onclick="newLogistics()">增加新订单</a>
					</p>
					<p id="btn-sq" name="btn-sq" class="btns" style="margin-top:20px;display:none;">
						<a class="address-add-btn">收起详情</a>
					</p>
				</div>
			</div>
		</div>
		<input type="hidden" id="openid" name="openid" value='${openid}' />
		<script type="text/javascript" charset="UTF-8">
		$("#srv").mouseover(function(){
			$("#srv").children("div").css('display','block');
		})
		$("#srv").mouseout(function(){
			$("#srv").children("div").css('display','none');
		})
		$("body").bind("click",function(e){
			if(e.target.name == "tm-1-selector" && $(e.target).parents("#tm-div").length != 0){
				$("#tm-1-tg").css('display','block');
				$("#tm-2-tg").css('display','none');
				$("#cmp-tg").css('display','none');
			}else if(e.target.name == "tm-2-selector" && $(e.target).parents("#tm-div").length != 0){
				$("#tm-2-tg").css('display','block');
				$("#tm-1-tg").css('display','none');
				$("#cmp-tg").css('display','none');
			}else if(e.target.name == "cmp-selector" && $(e.target).parents("#cmp-div").length != 0){
				$("#cmp-tg").css('display','block');
				$("#tm-1-tg").css('display','none');
				$("#tm-2-tg").css('display','none');
			}else{
				$("#tm-1-tg").css('display','none');
				$("#tm-2-tg").css('display','none');
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
			}
		});
		$("#tm-1-tg").children("ul").bind("click",function(e){
			var nowNode = $("#tm-1-tg").children("ul").find('li.ui-select-item-selected');
			nowNode.removeClass('ui-select-item-selected');
			nowNode.attr("data-selected","false");
			if($(e.target).parents("ul").length != 0){
				var s = $(e.target);
				var m = e.target;
				s.attr("data-selected","true");
				s.addClass('ui-select-item-selected');
				document.getElementById("tm-1-selector").innerHTML = m.innerHTML;
			}
		});
		$("#tm-2-tg").children("ul").bind("click",function(e){
			var nowNode = $("#tm-2-tg").children("ul").find('li.ui-select-item-selected');
			nowNode.removeClass('ui-select-item-selected');
			nowNode.attr("data-selected","false");
			if($(e.target).parents("ul").length != 0){
				var s = $(e.target);
				var m = e.target;
				s.attr("data-selected","true");
				s.addClass('ui-select-item-selected');
				document.getElementById("tm-2-selector").innerHTML = m.innerHTML;
			}
		});


		$("#address-bd").children("tr").children("td.d-last").children("p").children("a.d-l-d").bind("click",function(e){
			var trElement = $(e.target).parents("tr");
			var nowId = trElement.eq(0).attr("id");
			var doc1 = document.getElementById("s"+nowId);
			var doc2 = document.getElementById("r"+nowId);
			var doc3 = document.getElementById("p"+nowId);
			var doc4 = trElement.children("td");

			var img_h = "/web/resources/images/icons-firms/";
			var img_t = ".png";
		
			document.getElementById("log-pic-h").src = img_h + doc3.value + img_t;

			$("#log-code").text(doc4.eq(1).text());
			$("#log-name-d").text(doc4.eq(3).text());
			$("#log-man").text(doc4.eq(2).children("p").eq(0).text());
			var tmpDoc2 = doc4.eq(0).children("p");
			$("#log-time").text(tmpDoc2.eq(0).text() + " " + tmpDoc2.eq(1).text());
			$("#sman").text(doc1.getAttribute("sman"));
			$("#stel").text(doc1.getAttribute("stel"));
			$("#sp").text(doc1.getAttribute("sp"));
			$("#sc").text(doc1.getAttribute("sc"));
			$("#scc").text(doc1.getAttribute("scc"));
			$("#sa").text(doc1.getAttribute("sa"));

			$("#rman").text(doc2.getAttribute("rman"));
			$("#rtel").text(doc2.getAttribute("rtel"));
			$("#rp").text(doc2.getAttribute("rp"));
			$("#rc").text(doc2.getAttribute("rc"));
			$("#rcc").text(doc2.getAttribute("rcc"));
			$("#ra").text(doc2.getAttribute("ra"));


			$("#log-detail").slideDown();
			$("#log-M-search-form-t").slideUp();
			$("#log-M-search-form").slideUp();
			$("#address-table-tab").slideUp();
			$("table.address-table").slideUp();
			$("#btn-n").css('display','none');
			$("#btn-sq").css('display','block');
		});
		$("#btn-sq").bind('click',function(e){
			$("#log-detail").slideUp();
			$("#log-M-search-form-t").slideDown();
			$("#log-M-search-form").slideDown();
			$("#address-table-tab").slideDown();
			$("table.address-table").slideDown();
			$("#btn-n").css('display','block');
			$("#btn-sq").css('display','none');
		});

		/*查状态*/
		$("#address-bd").children("tr").children("td.d-last").children("p").children("a.d-l-s").bind("click",function(e){
			var trElement = $(e.target).parents("tr");
			var nowId = trElement.eq(0).attr("id");
			var company = document.getElementById("p"+nowId).value;
			var mailNo = trElement.children("td").eq(1).text();
			var username = document.getElementById("openid").value;

			var formHead = "<form id=\"tempForm\" action=\"/web/service/searchForm\" method=\"post\" modelAttribute=\"searchRequestVo\" >";
			var formDoc1 = "<input type=\"hidden\" id=\"logisticsProviderCode\" name=\"logisticsProviderCode\" value=\"";
			var formDoc2 = "\"><input type=\"hidden\" id=\"orderId\" name=\"orderId\" value=\"";
			var formDoc3 = "\"><input type=\"hidden\" id=\"username\" name=\"username\" value=\"";
			var button = "\"><button type=\"submit\" style=\"display:none;\" ></button></form>";
			
			var formDoc = formHead + formDoc1 + company + formDoc2 + mailNo + formDoc3 + username + button;
			$("body").append(formDoc);
			$("#tempForm").children("button").eq(0).click();
			$("#tempForm").remove();
		});

		function newLogistics(){
			window.location.href="/web/service/send";
		}
		</script>
	</body>
</html>