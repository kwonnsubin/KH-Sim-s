<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>내 질문/답변</title>
</head>
<body>
	<section>
		<div class="container">
			<!-- ***** 내 질문 목록 start  ***** -->
			<div class="row">
				<h4>내 질문</h4>
				<table>
					<c:forEach items="${myqnalist}" var="myqnas">
						<tbody>
							<tr>
								<td>
								<a href="<%=request.getContextPath()%>/faq/qna/${myqnas.aqNo}">${myqnas.aqTitle}(${myqnas.aqAnswers })</a>
								</td>
								<td>${myqnas.aqDate}</td>
								<td><button onclick="location.href='<%=request.getContextPath()%>/faq/qnaupdate/${myqnas.aqNo}'">수정</button></td>
								<td><button onclick="location.href='<%=request.getContextPath()%>/faq/qnadelete/${myqnas.aqNo}'">삭제</button></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
			<!-- ***** 내 질문 목록 end  ***** -->
			<!-- ***** 내 답변 목록 start  ***** -->
			<div class="row">
				<h4>내 답변</h4>
				<table>
					<c:forEach items="${myanslist}" var="myanss">
						<tbody>
							<tr>
								<td>
								<a href="<%=request.getContextPath()%>/faq/qna/${myanss.aqNo}">${myanss.aaContent}</a>
								</td>
								<td>${myanss.aaDate}</td>
								<td><button>수정</button></td>
								<td><button onclick="location.href='<%=request.getContextPath()%>/faq/ansdelete/${myanss.aqNo}/${myanss.aaNo}'">삭제</button></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
			<!-- ***** 내 답변 목록 end  ***** -->
		</div>
	</section>
</body>
</html>