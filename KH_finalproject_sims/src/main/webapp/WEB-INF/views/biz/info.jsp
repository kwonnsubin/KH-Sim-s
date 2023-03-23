<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/bizInfo.css"/>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	
	<img src="${path}${imagePath}"/>
	
	<nav>
		<p> 마이페이지
		<ul>
		 
		</ul>
	</nav>
	
	
	
	
	<table>
		<tbody>
			<tr>
				<th scope="row">
					<span>법인명</span>
				</th>
				<td>kctv</td>
				<th scope="row">
					<span>대표자명</span>
				</th>
				<td>kctv</td>
			</tr>
			<tr>
				<th scope="row">
					<span>사업자등록번호</span>
				</th>
				<td>kctv</td>
				<th scope="row">
					<span>법인등록번호</span>
				</th>
				<td>kctv</td>
			</tr>
			<tr>
				<th scope="row">
					<span>회사우편번호</span>
				</th>
				<td colspan="2">kctv</td>
			</tr>
			<tr>
				<th scope="row">
					<span>회사주소</span>
				</th>
				<td colspan="2">kctv</td>
			</tr>
			<tr>
				<th scope="row">
					<span>전화</span>
				</th>
				<td>kctv</td>
				<th scope="row">
					<span>팩스</span>
				</th>
				<td>kctv</td>
			</tr>
			<tr>
				<th scope="row">
					<span>이메일</span>
				</th>
				<td>kctv</td>
				<th scope="row">
					<span>홈페이지</span>
				</th>
				<td>kctv</td>
			</tr>
		</tbody>
	</table>
	
	
	
	
	
</body>
</html>