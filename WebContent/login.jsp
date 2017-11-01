<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<jsp:include page="include.jsp"></jsp:include>
<script type="text/javascript">
	function mysubmit() {
		//var exep=;
		var uname = document.getElementById("uname").value;
		if (!(/^1[3|5][0-9]\d{4,8}$/.test(uname))) {
			alert("请输入手机号");
			return false;
		}

		return true;
	}
</script>
</head>
<%-- <fmt:bundle basename="base"></fmt:bundle> --%>
<fmt:setBundle basename="base" />
<body>
	<div class="center-block" style="width: 50%">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3>
					<fmt:message key="title"></fmt:message>
				</h3>
			</div>
			<div class="panel-body text-center">
				<form name="f1" action="addUserServlet" onsubmit="return mysubmit()">
					<div class="form-inline text-center">
						<input type="text" id="uname" name="uname" class="form-control"
							placeholder='<fmt:message key="uname_tip"></fmt:message>'>
						<a href="javascript:f1.submit()" class="btn btn-success"><fmt:message
								key="btn_value"></fmt:message></a>
					</div>
				</form>
				<br>
				<c:if test="${param.errormsg eq 'exists'}">
					<span class="text-success"><fmt:message key="errormsg"></fmt:message></span>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>