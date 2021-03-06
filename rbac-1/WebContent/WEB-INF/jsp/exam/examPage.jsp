<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="${PATH}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${PATH}/css/font-awesome.min.css">
<link rel="stylesheet" href="${PATH}/css/main.css">
<style>
.tree li {
	list-style-type: none;
	cursor: pointer;
}

table tbody tr:nth-child(odd) {
	background: #F4F4F4;
}

table tbody td:nth-child(even) {
	color: #C00;
}
/* 底部固定 考试时间倒计时*/
.timerTip {
	position: fixed;
	left: 16%;
	/* 	top:10px; */
	bottom: 0px;
	width: 100%;
	height: 50px;
	background-color: #eee;
	z-index: 9999;
}
</style>
</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<div>
					<a class="navbar-brand" style="font-size: 32px;" href="#">考试管理系统
					</a>
				</div>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li style="padding-top: 8px;">
						<div class="btn-group">
							<button type="button"
								class="btn btn-default btn-success dropdown-toggle"
								data-toggle="dropdown">
								<i class="glyphicon glyphicon-user"></i> ${user.userName }<span
									class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#"><i class="glyphicon glyphicon-cog"></i>
										个人设置</a></li>
								<li><a href="#"><i class="glyphicon glyphicon-comment"></i>
										消息</a></li>
								<li class="divider"></li>
								<li><a href="index.html"><i
										class="glyphicon glyphicon-off"></i> 退出系统</a></li>
							</ul>
						</div>
					</li>
					<li style="margin-left: 10px; padding-top: 8px;">
						<button type="button" class="btn btn-default btn-danger">
							<span class="glyphicon glyphicon-question-sign"></span> 帮助
						</button>
					</li>
				</ul>
				<!-- 				<form class="navbar-form navbar-right"> -->
				<!-- 					<input type="text" class="form-control" placeholder="Search..."> -->
				<!-- 				</form> -->
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<div class="tree">
					<%@include file="/WEB-INF/jsp/common/menu.jsp"%>
				</div>
			</div>
			
			
			<!-- 			用户列表 -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<ol class="breadcrumb">
					<li><a href="#">考试中心</a></li>
					<li><a href="#">考试</a></li>
					<li class="active">考试界面</li>
				</ol>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="glyphicon glyphicon-th"></i> 考题列表
						</h3>
					</div>
					<div class="panel-body">
<!-- 						<form class="form-inline" role="form" style="float: left;"> -->
<!-- 							<div class="form-group has-feedback"> -->
<!-- 								<div class="input-group"> -->
<!-- 									<div class="input-group-addon">试题类型名称</div> -->
<!-- 									<input class="form-control has-success" type="text" -->
<!-- 										placeholder="请输入试题类型名称" name="quesTypeName" id="quesTypeName"> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="form-group has-feedback"> -->
<!-- 								<div class="input-group"> -->
<!-- 									<div class="input-group-addon">试题类型描述</div> -->
<!-- 									<input class="form-control has-success" type="text" -->
<!-- 										placeholder="请输入试题类型描述" name="quesTypeContent" -->
<!-- 										id="quesTypeContent"> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<button type="button" class="btn btn-warning" -->
<!-- 								onclick="toAddQuesType();"> -->
<!-- 								<i class="glyphicon glyphicon-plus"></i> 新增试题类型 -->
<!-- 							</button> -->
<!-- 						</form> -->
						<br> <label>试卷类别：<span style="color: blue;">${quesType.quesTypeName}</span></label>
						<%-- 						<br><label>${s.count }、&nbsp;&nbsp;${question.quesContent}</label> --%>
						<br> <label>温馨提示：<span style="color: red;">试题均为单选题，共10题，每题10分，总分100分。合格线为60分</span></label>
						<hr style="clear: both;">
						<div>

							<label id="quesTypeName" style="display: none;">${quesType.quesTypeName }</label> 
							<label id="examTime" style="display: none;">${quesType.examTime }</label>
							<label id="answers" style="display: none;">${answers }</label> 
							<label
								id="quesIds" style="display: none;">${quesIds }</label>

							<%-- 		quesType				quesIds	<form method="post" action="${PATH}/exam/checkSubmitedAnswerTest"> --%>

							<c:forEach items="${questions}" var="question" varStatus="s">
								<label>${s.count }、&nbsp;&nbsp;${question.quesContent}</label>

								<p style="padding: 1px 0; margin-left: 25px;">
									<input type="radio" name="${question.quesId}" value="A">&nbsp;A.&nbsp;${question.optionA}
								</p>
								<p style="padding: 1px 0; margin-left: 25px;">
									<input type="radio" name="${question.quesId}" value="B">&nbsp;B.&nbsp;${question.optionB}
								</p>
								<p style="padding: 1px 0; margin-left: 25px;">
									<input type="radio" name="${question.quesId}" value="C">&nbsp;C.&nbsp;${question.optionC}
								</p>
								<p style="padding: 1px 0; margin-left: 25px;">
									<input type="radio" name="${question.quesId}" value="D">&nbsp;D.&nbsp;${question.optionD}
								</p>

								<hr>
							</c:forEach>

							<!-- 								<button type="submit" >提交试卷</button> -->

							<!-- 							</form> -->
						</div>
						<!-- 						<div class="foot"> -->
						<!-- 							<form  style="float: left;"> -->
						<!-- 								<div id="timer" style="color: red"></div> -->
						<!-- 								<button type="button" class="btn btn-default btn-success" -->
						<!-- 									onclick="submitSelectedAnswer();" style=""> -->
						<!-- 									<span class="glyphicon glyphicon-submit-sign"></span> 提交试卷 -->
						<!-- 								</button> -->
						<!-- 							</form> -->
						<!-- 						</div> -->
						<div class="timerTip">
							<div id="timer" style="color: red"></div>
							<button id="" type="button" class="btn btn-default btn-success"
								onclick="submitSelectedAnswer();" style="">
								<span class="glyphicon glyphicon-submit-sign"></span> 提交试卷
							</button>
						</div>
					</div>

				</div>


			</div>
		</div>
	</div>

	<script src="${PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${PATH}/script/docs.min.js"></script>
	<!--     <script src="jquery/jquery-2.1.1.min.js"></script> -->
	<!--     <script src="bootstrap/js/bootstrap.min.js"></script> -->
	<!--     <script type="text/javascript" src="layer/layer.js"></script> -->
	<script>
		$(function() {
			$(".list-group-item").click(function() {
				if ($(this).find("ul")) {
					$(this).toggleClass("tree-closed");
					if ($(this).hasClass("tree-closed")) {
						$("ul", this).hide("fast");
					} else {
						$("ul", this).show("fast");
					}
				}
			});
		});


		function submitSelectedAnswer() {
			var quesIds = $("#quesIds").html().trim();
			// 			alert("quesIds=" + quesIds)
			// 			 var quesIdsArr = [2,4]
			// 			 var number2 = 2;
			// 			 var number4 = 4;
			var quesIds1 = quesIds.substr(1);
			var quesIds2 = quesIds1.substr(0, quesIds1.length - 1);
			var quesIdsArr = quesIds2.split(", ");
			var submitedAnswer = "";
			for (var i = 0; i < quesIdsArr.length; i++) {
				var answer = $("input[name='" + quesIdsArr[i] + "']:checked")
						.val();
				if (typeof (answer) == "undefined") {
					submitedAnswer += 'X';
				} else {
					submitedAnswer += answer;
				}
			}

			var answers = $("#answers").html().trim();
			var quesTypeName = $("#quesTypeName").html().trim();
// 			alert("用户的答案=" + submitedAnswer + "\n" + "正确答案=" + answers)quesTypeId
// 			alert("quesTypeName="+quesTypeName)
			location.href = "${PATH}/exam/checkSubmitedAnswer?submitedAnswer="
					+ submitedAnswer + "&answers=" + answers + "&quesIds="
					+ quesIds + "&quesTypeName=" + quesTypeName;
// 			 + "&quesTypeId=" + quesTypeId
		}



		var examTime = $("#examTime").html().trim();
		alert("本场考试时长： = " + examTime + "分钟")
		var maxtime = 60 * examTime; //一个小时，按秒计算，自己调整!
		function CountDown() {
// 			var maxtime = 60 * 1; //一个小时，按秒计算，自己调整!
// 			var maxtime = 60 * time; //一个小时，按秒计算，自己调整!
			if (maxtime >= 0) {
				minutes = Math.floor(maxtime / 60);
				seconds = Math.floor(maxtime % 60);
				msg = "距离结束还有" + minutes + "分" + seconds + "秒";
				document.all["timer"].innerHTML = msg;
				if (maxtime == 5 * 60)
					alert("还剩5分钟");
				--maxtime;
			} else {
				clearInterval(timer);
				alert("时间到，考试结束!请点击确定按钮提交试卷");
				submitSelectedAnswer();
			}
		}
		timer = setInterval("CountDown()", 1000);
	</script>
</body>
</html>