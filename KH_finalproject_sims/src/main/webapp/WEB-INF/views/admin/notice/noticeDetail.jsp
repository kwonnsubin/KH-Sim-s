<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세 페이지</title>
</head>
<body>
	<div class="id="container">
		<div class="contain-area">
			<div class="content">
				<h1>공지사항관리</h1>
				<input type="button" value="수정"> <input type="button"
					value="삭제">

			
				<table>
				
					<thead>
					
					
					<th><c:out value="${noticeList }"/><th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>공감수</th>
					</thead>
					<tbody>
						
					</tbody>
			



				</table>
</body>
</html>