<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문의게시판 상세보기</title>
	<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
	<!-- 문의 게시판 질문상세 -->
	<h4>질문</h4>
		질문번호: ${qnaquestion.aqNo } <br>
		질문작성자: ${qnaquestion.userId } <br>
		질문제목: ${qnaquestion.aqTitle } <br>
		질문내용: ${qnaquestion.aqContent } <br>
		질문작성일: ${qnaquestion.aqDate } <br>
		질문수정일: ${qnaquestion.aqRedate } <br>
		조회수: ${qnaquestion.aqViews } <br>
	
	<!-- 답변 -->
	<h4>답변</h4>
	<c:forEach items="${qnaanswer }" var="ans">
		답변번호: ${ans.aaNo} <br>
		질문번호: ${ans.aqNo } <br>
		관리자답변자: ${ans.adminId } <br>
		사용자답변자: ${ans.userId } <br>
		답변내용: ${ans.aaContent } <br>
		답변작성일: ${ans.aaDate } <br>
		답변수정일: ${ans.aaRedate } <hr>
	</c:forEach>
</body>
</html>