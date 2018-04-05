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
		<title>快递服务-收件人选择</title>
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
		.icon-jt{
			width:2rem;
			height:2rem;
			display: inline-block; 
			position:absolute;
			margin-top:-1rem;
			top:50%;
			left:0.8rem;
			background-size:100% auto; 
			background-image: url(<c:url value="/resources/images/icons-png/wxz.png" />);
		}
		.icon-njt{
			width:2rem;
			height:2rem;
			display: inline-block; 
			position:absolute;
			margin-top:-1rem;
			top:50%;
			left:0.8rem;
			background-size:100% auto; 
			background-color: #fff;
		}
		.icon-delete{
			width:2rem;
			height:2rem;
			display: inline-block; 
			position:absolute;
			margin-top:-1rem;
			top:50%;
			right:0.8rem;
			background-size:100% auto; 
			background-image: url(<c:url value="/resources/images/icons-png/delete.png" />);
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
			margin-left: 2.5rem;
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
		body{font-family: "微软雅黑";background:#e5e5e5}
		</style>
	</head>
	<body>
		<div class="container-fluid">
			<div class="sub-row">
				<p class="sub-title">收件人地址</p>
				${show}
			</div>
			<div class="sub-row">
				<p class="next-button">
					<button onclick="add()" class="next-button-d">添加</button>
				</p>
			</div>
			<form:form id="toReceiverforChoose" action="/wechat/service/chooseReceiver" method="post" >
				<input type="hidden" id="selectedId" name="selectedId" value='${rid}' />
				<input type="hidden" id="openid" name="openid" value='${openid}' />
				<button type="submit" id="sbutton" name="sbutton" style="display:none"></button>
			</form:form>
			<form:form  id="toReceiverforSave" action="/wechat/service/receiverChooseTosave" method="post">
				<input type="hidden" id="openid" name="openid" value='${openid}' />
				<button id="abutton" name="abutton" type="submit" style="display:none"></button>
			</form:form>
		</div>

		<!-- model -->
		<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        				<h4 class="modal-title" id="myModalLabel">删除</h4>
					</div>
					<div class="modal-body">
						<p>您确认要删除当前收件人信息?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="delete-Submit-btn" name="delete-Submit-btn">确定</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Button trigger modal -->
		<input id="deletedOne" name="deletedOne" value="" type="hidden" />
		<button id="deletedBtn" name="deletedBtn" type="button" style="display:none" data-toggle="modal" data-target="#deleteModal"></button>
		<script type="text/javascript">
			function selectThis(id){
				//alert(event.target.tagName);
				if(event.target.tagName == "DIV"){
					var nowId = document.getElementById("selectedId").value;
					if(nowId != null &&nowId != ""){
						document.getElementById("dd"+nowId).className = "icon-njt";
						document.getElementById("selectedId").value = id;
						document.getElementById("dd"+id).className = "icon-jt";
						document.getElementById("sbutton").click();
					}else{
						document.getElementById("selectedId").value = id;
						document.getElementById("dd"+id).className = "icon-jt";
						document.getElementById("sbutton").click();
					}
				}
			}
			function add(){
				document.getElementById("abutton").click();
			}
			function deleteOne(id){
				if(event.target.tagName == "SPAN"){
					document.getElementById("deletedOne").value = id;
					document.getElementById("deletedBtn").click();
				//stopBubble(event);
				}
			}
			function deleteThis(id){
				var deletedId = id;
				
				var xmlHttp;
				if(window.XMLHttpRequest){
					xmlHttp = new XMLHttpRequest();
				}else{
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
				xmlHttp.onreadystatechange=function(){
					if (xmlHttp.readyState==4 && xmlHttp.status==200){
						var child = document.getElementById("d"+deletedId);
						child.parentNode.removeChild(child);
						var nowId = document.getElementById("selectedId").value;
						if(nowId == deletedId){
							document.getElementById("selectedId").value = "";
						}
						document.getElementById("deletedOne").value="";	
					}
				}
				xmlHttp.open("POST","../service/receiverDelete",true);
				xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				xmlHttp.send("deletedId="+deletedId);
			}
			$('#delete-Submit-btn').click(function(){
				$('#deleteModal').modal('hide');
				var id = document.getElementById("deletedOne").value;
				deleteThis(id);
			});
		</script>
	</body>
</html>
