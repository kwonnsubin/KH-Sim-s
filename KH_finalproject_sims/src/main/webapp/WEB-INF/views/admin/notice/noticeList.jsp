<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 리스트</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<div class="id="container">
		<div class="contain-area">
			<div class="content">
				<h1>공지사항관리</h1>
				<input type="button" value="작성">
				<div class="searchBox">
					<label for="search">검색</label>
					<select>
						<option>제목</option>
						<option>작성자</option>
						<option>내용</option>
					</select>
					<input type="text" >
					<input type="button" value="검색">
				</div>
				<div>
					<table>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
						<tr>
							<td>1</td>
							<td>공지사항 제목</td>
							<td>관리자</td>
							<td>2023.03.13</td>
						</tr>
						<tr>
							<td>1</td>
							<td>공지사항 제목</td>
							<td>관리자</td>
							<td>2023.03.13</td>
						</tr>
						<tr>
							<td>1</td>
							<td>공지사항 제목</td>
							<td>관리자</td>
							<td>2023.03.13</td>
						</tr>
						<tr>
							<td>1</td>
							<td>공지사항 제목</td>
							<td>관리자</td>
							<td>2023.03.13</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	${noticeList}
</body>
</html>