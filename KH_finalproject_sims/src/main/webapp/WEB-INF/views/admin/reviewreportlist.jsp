<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 리뷰 목록</title>
</head>
<body>
	<div class="container-sm">
		<button type="button" class="btn writing btn-outline-secondary btn-sm">작성</button>
		<table class="table table-hover table-group-divider mt-3 mb-3">
			<thead class="table-light text-center">
			<tr>
				<th class="text-center">리뷰번호</th>
				<th>리뷰내용</th>
				<th class="text-center">작성자</th>
				<th class="text-center">신고일자</th>
			</tr>
			</thead>
 			<c:forEach items="${reviewReportList}" var="reviewlist">
				<tbody>
					<tr>
						<td class="text-center">${reviewlist.reviewNo}</td>
						<td class="text-center"><a href="<%=request.getContextPath()%>/admin/faqdetail/${faq.faqNo}">${reviewlist.reviewContent}</a></td>
						<td class="text-center">${reviewlist.userId}</td>
						<td class="text-center">${reviewlist.reportDate}</td>
					</tr>
				</tbody>
 			</c:forEach>
		</table>
	</div>
</body>
</html>