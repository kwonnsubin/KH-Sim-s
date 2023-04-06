<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/biz/info.css"/>
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

	<div>
		<span>기본정보</span>
	</div>

	<table>
		<tbody>
			<tr>
				<th scope="row">
					<span>법인명</span>
				</th>
				<td>${bizinfo.bizName }</td>
				<th scope="row">
					<span>대표자명</span>
				</th>
				<td>${bizinfo.bizOwnerName }</td>
			</tr>
			<tr>
				<th scope="row">
					<span>사업자등록번호</span>
				</th>
				<td>${bizinfo.bizCrn }</td>
				<th scope="row">
					<span>법인등록번호</span>
				</th>
				<td>${bizinfo.bizSsn }</td>
			</tr>
			<tr>
				<th scope="row">
					<span>회사우편번호</span>
				</th>
				<td colspan="2">${bizinfo.bizZipCode }</td>
			</tr>
			<tr>
				<th scope="row">
					<span>회사주소</span>
				</th>
				<td colspan="2">${bizinfo.bizLocation }</td>
			</tr>
			<tr>
				<th scope="row">
					<span>전화</span>
				</th>
				<td>${bizinfo.bizPhone }</td>
				<th scope="row">
					<span>팩스</span>
				</th>
				<td>${bizinfo.bizFax }</td>
			</tr>
			<tr>
				<th scope="row">
					<span>이메일</span>
				</th>
				<td>${bizinfo.bizEmail }</td>
				<th scope="row">
					<span>홈페이지</span>
				</th>
				<td>${bizinfo.bizHp }</td>
			</tr>
		</tbody>
	</table>
	
	<div>
		<span>상세정보</span>
	</div>
	
	<table>
		<tr>
			<th scope="row">
				<span>개통 소요시간</span>
			</th>
			<td colspan="2">${bizinfo.phoneOpTime }</td>
		</tr>
		<tr>
			<th scope="row">
				<span>개통 소요시간 (유심보유시)</span>
			</th>
			<td colspan="2">${bizinfo.phoneOpTimeUsim }</td>
		</tr>
		<tr>
			<th scope="row">
				<span>지원통신망</span>
			</th>
			<td colspan="2">${bizinfo.network }</td>
		</tr>
		<tr>
			<th scope="row">
				<span>영업시간</span>
			</th>
			<td colspan="2">${bizinfo.bizBeginTime } ~ ${bizinfo.bizEndTime }</td>
		</tr>
		<tr>
			<th scope="row">
				<span>휴무일</span>
			</th>
			<td colspan="2">${bizinfo.bizClosedDay }</td>
		</tr>
		
		<c:forEach var="service" items="${serviceList }">
			<tr>
				<th scope="row">
					<span>고객센터번호</span>
				</th>
				<td colspan="2">
				<c:choose>
					<c:when test="${service.netNo eq 1}">
				      SKT
				    </c:when>
				    <c:when test="${service.netNo eq 2}">
				      KT
				    </c:when>
				    <c:when test="${service.netNo eq 3}">
				      LGU+
				    </c:when>
				</c:choose>
				</td>
				<td>${service.bizNetService}</td>
			</tr>
		</c:forEach>
		
		
		
	</table>
	
	<button type="button" onclick="location.href='<%=request.getContextPath()%>/biz/modifyInfo'">수정하기</button>
	
	
	
</body>
</html>