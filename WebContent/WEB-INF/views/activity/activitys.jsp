<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" href="resources/bootstrap/js/bootstrap.js"></script>
<title>活动页面</title>
</head>
<body>
<div class="container">
	<ul class="nav nav-pills">
	  <li class="active">
	    <a href="">首页</a>
	  </li>
	  <li class="active"><a href="activity/start">发起活动</a></li>
	  <li class="active"><a href="login/cancel">注销</a></li>
	</ul>
</div>
	
	<div class="content container" style="margin: 20px 0 0 40px;">
		<c:forEach items="${activitys}" var="activity">
			<div class="activity-box">
				<h3>${activity.name}</h3>
				<p>发起人：${activity.userId}</p>
				<p><span>发起时间：${activity.startTime}</span><span>结束时间：${activity.endTime}</span></p>
				<p>活动地点:${activity.place}</p>
				<p>可参与人数：${activity.peopleCount}</p>
				<a href="activity/${activity.id}" class="btn btn-info">查看详情</a>
			</div>
		</c:forEach>
	</div>
</body>
</html>