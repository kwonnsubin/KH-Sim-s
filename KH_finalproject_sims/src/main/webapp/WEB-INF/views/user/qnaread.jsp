<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판 상세보기</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container mb-5 mt-6 w-75">
		<!-- 게시판 상세글 -->
		<c:forEach var="qnalist" items="${qnacontents }">
			${qnalist.aqNo } <br>
			${qnalist.aqWriter } <br>
			${qnalist.aqTitle } <br>
			${qnalist.aqContent } <br>
			${qnalist.aqDate } <br>
			${qnalist.aqRedate } <br>
			${qnalist.aqViews } <br>
		</c:forEach>
	</div>
</body>
</html>