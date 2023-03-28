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
					<c:forEach items="${myqnalist}" var="qna">
						<tbody>
							<tr>
								<td>
								<a href="<%=request.getContextPath()%>/faq/qnaread/${qna.aqNo}">${qna.aqTitle}(${qna.aqAnswers })</a>
								</td>
								<td>${qna.aqDate}</td>
								<td><button>수정</button></td>
								<td><button>삭제</button></td>
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
					<c:forEach items="${myanslist}" var="ans">
						<tbody>
							<tr>
								<td>
								<a href="<%=request.getContextPath()%>/faq/qnaread/${ans.aqNo}">${ans.aaContent}</a>
								</td>
								<td>${ans.aaDate}</td>
								<td><button>수정</button></td>
								<td><button>삭제</button></td>
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