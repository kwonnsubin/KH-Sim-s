<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 리스트</title>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="container">
		<div class="contain-area">
			<div class="content">
				<h1>공지사항관리</h1>
				<input class="sims_btn" type="button" onclick="location.href='<%=request.getContextPath()%>/adminNotice/noticeWrite'" value="작성">
				<div class="contents">
					<div class="searchBox">
						<label for="searchbox">검색</label>
						<select class="search">
							<option>제목</option>
							<option>작성자</option>
							<option>내용</option>
						</select> 
						<input class="search" type="text" id="searchbox"> <input class="sims_btn" type="button" value="검색">
					</div>
					<div>
						<table border="1">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${noticeList}">
									<tr>
										<td>${list.ntcNo}&nbsp;&nbsp;</td>
										<td><a href="<%=request.getContextPath()%>/adminNotice/noticeDetail/${list.ntcNo}">${list.ntcTitle}</a>&nbsp;&nbsp;</td>
										
										<td>${list.adminId}&nbsp;&nbsp;&nbsp;</td>
										<td><fmt:formatDate value="${list.ntcDate}" pattern="yyyy.MM.dd"/> </td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--${noticeList}-->
</body>
</html>