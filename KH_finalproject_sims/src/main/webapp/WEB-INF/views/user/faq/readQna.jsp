<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문의게시판 상세보기</title>
	<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
	<!-- 문의 게시판 질문상세 -->
	<div>
		<h4>질문</h4>
			질문번호: ${questions.aqNo } <br>
			질문작성자: ${questions.userId } <br>
			질문제목: ${questions.aqTitle } <br>
			질문내용: ${questions.aqContent } <br>
			질문작성일: ${questions.aqDate } <br>
			질문수정일: ${questions.aqRedate } <br>
			조회수: ${questions.aqViews } <br>
	</div>
	
	<!-- 답변 -->
	<div>
		<h4>답변</h4>
		<c:if test="${not empty answers }">
			<c:forEach items="${answers }" var="ans">
				<br> 답변번호: ${ans.aaNo}
				<c:if test="${not empty ans.adminId }">
					<br> 관리자답변자: ${ans.adminId }
				</c:if>
				<c:if test="${not empty ans.userId }">
					<br> 사용자답변자: ${ans.userId } 
				</c:if>
				<br> 답변내용: ${ans.aaContent } 
				<br> 답변작성일: ${ans.aaDate } 
				<c:if test="${not empty ans.aaRedate }">
				<br> 답변수정일: ${ans.aaRedate }
				</c:if>
				
				<!-- 댓글 -->
				<p>댓글</p>
				<c:forEach items="${replies}" var="rpl">
					<br> 댓글번호: ${rpl.rplNo }
					<br> 댓글내용: ${rpl.rplContent }
					<c:if test="${not empty rpl.adminId }">
						<br> 관리자작성자: ${rpl.adminId }
					</c:if>
					<c:if test="${not empty rpl.userId }">
						<br> 사용자작성자: ${rpl.userId } 
					</c:if>
					<br> 작성일: ${rpl.rplDate }
					<c:if test="${not empty rpl.rplRedate }">
						<br> 댓글수정일: ${rpl.rplRedate }
					</c:if>
					<hr>	
				</c:forEach>
				<!-- 댓글 작성 -->
				<form action="${cpath }/faq/ans/${ans.aaNo}/reply" method="post">
					<input type="text" value="${username }" name="userId">
					<input type="text" value="${ans.aaNo }" name="aaNo">
					<input type="text" name="rplContent" placeholder="댓글을 작성해주세요">
					<input type="submit" value="완료">
				</form>
				<hr>
			</c:forEach>
		</c:if>
		
		<!-- 답변달기 -->
		<form action="${cpath }/faq/qna/${questions.aqNo}/answer" method="post">
			<input type="hidden" value="${username }" name="userId">
			<input type="hidden" value="${questions.aqNo }" name="aqNo">
			<input type="text" name="aaContent" placeholder="답변을 작성해주세요">
			<input type="submit" value="답변하기">
		</form>
	</div>
</body>
</html>