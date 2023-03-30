<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 수정</title>
</head>
<body>
	<div class="container">
		<form:form action="${cpath }/faq/qnaupdate/${myqna.aqNo}" method="post">
			<div>
				<input type="text" name="aqTitle" value="${myqna.aqTitle }" size="60">
			</div>
			<div>
				<textarea rows="10" cols="100" name="aqContent">${myqna.aqContent }</textarea>
			</div>
			<div class="row">
				<button type="button" onClick="history.back();">취소</button>
				<button type="submit">수정</button>
			</div>
		</form:form>
	</div>
</body>
</html>