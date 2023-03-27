<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<section>
		<div class="container">
			<!-- ***** 내 질문 목록 start  ***** -->
			<div class="row">
				<h4>내 질문</h4>
				<table>
					<thead>
						<tr>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>
					<c:forEach items="${myqnalist}" var="qna">
						<tbody>
							<tr>
								<td class="text-center">
								<a href="<%=request.getContextPath()%>/faq/qnaread/${qna.aqNo}">${qna.aqTitle}</a>
								</td>
								<td class="text-center">${qna.aqDate}</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
			<!-- ***** 내 질문 목록 end  ***** -->
			<!-- ***** 내 답변 목록 start  ***** -->
			
		</div>
	</section>
</body>
</html>