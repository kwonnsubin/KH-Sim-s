<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문 상세보기</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container mb-5 mt-6 w-75">
		<!-- 게시판 상세글 -->
		<c:forEach var="faqlist" items="${faqcontents }">
			<div>
				<h3>${faqlist.faqTitle }</h3>
			</div>
			<div class="mb-44">
				<div class="row  w-auto " style="width: 1000px; height: 300px;">
					<p class="col">${faqlist.faqContent }</p>
				</div>
			</div>
		</c:forEach>
	</div>

</body>
</html>