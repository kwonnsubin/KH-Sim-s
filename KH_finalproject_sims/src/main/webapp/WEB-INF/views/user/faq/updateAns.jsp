<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 수정</title>
</head>
<body>
	<div>
		<form action="${cpath }/faq/ansupdate/${myans.aaNo }" method="post">
			<div>
				<input type="text" name="aaContent" value="${myans.aaContent }" size="60">
			</div>
			<div class="row">
				<button type="button" onClick="history.back();">취소</button>
				<button type="submit">수정</button>
			</div>
		</form>
	</div>
</body>
</html>