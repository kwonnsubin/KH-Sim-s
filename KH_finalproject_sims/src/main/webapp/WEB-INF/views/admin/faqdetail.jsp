<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container mb-5 mt-6 w-75">
		<!-- 게시판 상세글 -->
		<c:forEach var="boardList" items="${boardList }">
				<div>
					<h3>${boardList.title }</h3>
				</div>
				<div class="mb-44">
					<div class="row  bg-light  " style="height:50px;">
						<div class="d-inline col-3  ">
							<div class="d-inline">분류</div>
							<div class="d-inline">${boardList.category }</div>
						</div>
						<div class="d-inline col-3  ">
							<div class="d-inline">작성자</div>
							<div class="d-inline">${boardList.writer }</div>
						</div>
						<div class="d-inline col ">
							<div class="d-inline">작성일</div>
							<div class="d-inline">${boardList.regdate }</div>
						</div>
					</div>
					<div class="row  w-auto " style="width:1000px; height:300px;">
						<p class="col">${boardList.content }</p>
					</div>
				</div>
		</c:forEach>
	</div>
</body>
</html>