<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>已发布活动页面</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/bootstrap/css/bootstrap.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-2.2.4.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/bootstrap/js/bootstrap.js'/>"></script>
</head>
<body>
	<div class="container">
		<h2>已发布活动</h2>
		<a class="btn btn-primary" href="<c:url value='/activity' />">返回首页</a>
		<a class="btn btn-info" href="<c:url value='/userinfo' />">返回个人主页</a>
		<div class="content container" style="margin: 20px 0 0 40px;">
			<c:forEach items="${activitys}" var="activity">
				<div class="activity-box">
					<h3>${activity.name}</h3>
					<p>发起人：${activity.getuList().get(0).getShowname()}</p>
					<p>发起时间：${activity.getDateStartTime()}</p>
					<p>结束时间：${activity.getDateEndTime()}</p>
					<p>活动地点:${activity.place}</p>
					<p>可参与人数：${activity.peopleCount}</p>
					<button id="public-btn" data="${activity.id}" class="btn btn-danger">取消活动</button>
				</div>
			</c:forEach>
		</div>

		<script type="text/javascript">
		(function(){
			console.log($('#public-btn').attr('data'));
			$('#public-btn').click(function(event) {
				$this = $(this);
				$.ajax({
					url: '<c:url value="/userinfo/public" />?activityId=' + $(this).attr('data'),
					type: 'post',
					dataType: 'json',
					success:function(data){
						console.log(data);
						if(data.id === '1'){
							$this.parent('.activity-box').remove();
							alert("成功取消活动");
						}else{
							alert("无法取消活动");
						}
					}
				})
			});
		})();

	</script>
	</div>
</body>
</html>