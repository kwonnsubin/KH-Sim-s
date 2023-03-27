<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변하기</title>
</head>
<body>
	<div class="container">
		<form:form action="writeans" method="post">
			<p>답변을 남겨주세요</p>
			<input type="hidden" value="${username }" name="userId">
			<input type="hidden" value="${ans.aqNo }" name="aqNo">
			<textarea name="aaContent" placeholder="구체적으로 남길수록 도움이 돼요."></textarea>
			<button type="submit">답변하기</button>
		</form:form>
	</div>
</body>
</html>