<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 관리</title>
</head>
<body>
	<div class="container-sm">
		<button type="button" class="btn writing btn-outline-secondary btn-sm">작성</button>
		<table class="table table-hover table-group-divider mt-3 mb-3">
			<thead class="table-light text-center">
			<tr>
				<th class="text-center">리뷰번호</th>
				<th>내용</th>
				<!-- <th class="text-center">통신사</th> -->
				<th class="text-center">작성자</th>
				<th class="text-center">작성일</th>
			</tr>
			</thead>
 			<c:forEach items="${reviewlist}" var="list">
				<tbody>
					<tr>
						<td class="text-center">${list.reviewNo}
						<div>
							  <%-- REVIEW_STAR 값에 따라서 별모양 이모지를 표시 --%>
								<c:if test="${list.reviewStar >= 1}">
								    &#9733;
								</c:if>
								<c:if test="${list.reviewStar >= 2}">
								    &#9733;
								</c:if>
								<c:if test="${list.reviewStar >= 3}">
								    &#9733;
								</c:if>
								<c:if test="${list.reviewStar >= 4}">
								    &#9733;
								</c:if>
								<c:if test="${list.reviewStar >= 5}">
								    &#9733;
								</c:if>
						</div>
						
						</td>
						<td class="text-center"><a href="<%=request.getContextPath()%>/admin/reviewdetail/${list.reviewNo}">${list.reviewContent}</a></td>
						<%-- <td class="text-center">${list.bizId}</td> --%>
						<td class="text-center">${list.userId}</td>
						<td class="text-center">${list.reviewDate}</td>
					</tr>
				</tbody>
 			</c:forEach>
		</table>
	</div>
</body>
</html>