<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>질문하기</title>
</head>
<body>
	<div class="container">
		<form action="${cpath }/faq/qna/write" method="post">
			<p>질문의 제목을 구체적으로 적어주세요</p>
			<div>
				<input type="hidden" value="${username }" name="userId"> 
				<input type="text" name="aqTitle" size="60"
					placeholder="예시) 기존 통신사는 직접 해지해야 되나요?">
			</div>
			<div>
				<textarea rows="10" cols="100" name="aqContent"
				placeholder="현재 사용하시는 통신사 혹은 질문과 관련된 자세한 내용을 함께 적어주시면 더 정확한 답변이 가능해요."></textarea>
			</div>
			<div class="row">
				<button type="button" onClick="history.back();">취소</button>
				<button type="submit">작성</button>
			</div>
		</form>
	</div>
</body>
</html>