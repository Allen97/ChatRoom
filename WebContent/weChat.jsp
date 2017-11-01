<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-9">
				<div class="panel panel-primary" style="height: 80%">
					<div class="panel-heading">聊天内容</div>
					<div class="panel-body">
						<c:forEach items="${applicationScope.msgList}" var="msg">
						<c:if test="${v eq sessionScope.uname }">
								<a class="btn btn-warning btn-block">${v}</a>
							</c:if>
							<c:if test="${v ne sessionScope.uname }">
								<a class="btn btn-default btn-block">${v}</a>
							</c:if>
							<label class="alert alert-info ">${msg }</label><br>
						</c:forEach>

					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="panel panel-primary" style="height: 80%">
					<div class="panel-heading">用户列表</div>
					<div class="panel-body">
						<c:forEach items="${applicationScope.userList}" var="v">
							<c:if test="${v eq sessionScope.uname }">
								<a class="btn btn-warning btn-block">${v}</a>
							</c:if>
							<c:if test="${v ne sessionScope.uname }">
								<a class="btn btn-default btn-block">${v}</a>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<form action="addMsgServlet">
						<input type="text" name="msg" class="form-control" /> <a
							href="javascript:f1.submit()" class="btn btn-success">发送</a>
					</form>
				</div>

			</div>
		</div>
	</div>
</body>
</html>