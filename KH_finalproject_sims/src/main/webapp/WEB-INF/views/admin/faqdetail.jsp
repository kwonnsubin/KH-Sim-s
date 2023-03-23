<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
	<div class="container mb-5 mt-6 w-75">
			<a href="<%=request.getContextPath()%>/admin/faqupdate/${faqlist.faqNo}">수정</a>
			<!-- 게시판 상세글 -->
			<div>
				<h3>${faqlist.faqTitle }</h3>
			</div>
			<div class="mb-44">
				<div class="row  w-auto " style="width:1000px; height:300px;">
					<p class="col">${faqlist.faqContent }</p>
				</div>
			</div>
	</div>
</body>
</html>