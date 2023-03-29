<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문의게시판 상세보기</title>
	<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
	<!-- 문의 게시판 질문상세 -->
	<div>
		<h4>질문</h4>
			질문번호: ${qnaquestion.aqNo } <br>
			질문작성자: ${qnaquestion.userId } <br>
			질문제목: ${qnaquestion.aqTitle } <br>
			질문내용: ${qnaquestion.aqContent } <br>
			질문작성일: ${qnaquestion.aqDate } <br>
			질문수정일: ${qnaquestion.aqRedate } <br>
			조회수: ${qnaquestion.aqViews } <br>
	</div>
	
	<!-- 답변 -->
	<div>
		<h4>답변</h4>
		<c:if test="${not empty qnaanswer }">
			<c:forEach items="${qnaanswer }" var="ans">
				답변번호: ${ans.aaNo} <br>
				<c:if test="${not empty ans.adminId }">
				관리자답변자: ${ans.adminId } <br>
				</c:if>
				<c:if test="${not empty ans.userId }">
				사용자답변자: ${ans.userId } <br>
				</c:if>
				답변내용: ${ans.aaContent } <br>
				답변작성일: ${ans.aaDate } 
				<c:if test="${not empty ans.aaRedate }">
				<br> 답변수정일: ${ans.aaRedate }
				</c:if>
				<hr>
			</c:forEach>
		</c:if>
		
		<!-- 답변달기 -->
		<form action="${cpath }/faq/qna/${qnaquestion.aqNo}/answer" method="post">
			<input type="hidden" value="${username }" name="userId">
			<input type="hidden" value="${qnaquestion.aqNo }" name="aqNo">
			<input type="text" name="aaContent" placeholder="답변을 작성해주세요">
			<input type="submit" value="답변하기">
		</form>
	</div>
</body>
</html>