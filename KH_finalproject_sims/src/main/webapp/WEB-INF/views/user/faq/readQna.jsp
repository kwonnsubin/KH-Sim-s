<%@page import="kh.finalproject.sims.user.model.vo.UserAnsVo"%>
<%@page import="kh.finalproject.sims.user.model.vo.UserRplVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
			질문번호: ${question.aqNo } <br>
			질문작성자: ${question.userId } <br>
			질문제목: ${question.aqTitle } <br>
			질문내용: ${question.aqContent } <br>
			질문작성일: ${question.aqDate } <br>
			질문수정일: ${question.aqRedate } <br>
			조회수: ${question.aqViews } <br>
	</div>
	<div>
		<sec:authorize access="hasRole('ROLE_USER')">
			<sec:authentication property="principal.username" var="username"/>
			<c:if test="${username eq question.userId}">
				<button onclick="location.href='<%=request.getContextPath()%>/faq/qnaupdate/${question.aqNo}'">수정</button>
			</c:if>	
		</sec:authorize>
	</div>
	<!-- 답변 -->
	<div>
		<h4>답변</h4>
		<!-- 답변달기 -->
		<sec:authorize access="hasRole('ROLE_USER')">
			<sec:authentication property="principal.username" var="username"/>
			<form action="${cpath }/faq/qna/${question.aqNo}/answer" method="post">
				<input type="hidden" value="${username }" name="userId">
				<input type="hidden" value="${question.aqNo }" name="aqNo">
				<input type="text" name="aaContent" size="60" placeholder="답변을 작성해주세요">
				<input type="submit" value="답변하기">
			</form>
		</sec:authorize>
		
		<!-- 답변목록 -->
		<c:if test="${not empty answers }">
			<c:forEach items="${answers }" var="ans">
				<hr> 답변번호: ${ans.aaNo}
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
				
				<div class="row">
					<sec:authorize access="hasRole('ROLE_USER')">
						<c:if test="${username eq ans.userId}">
							<button onclick="location.href='<%=request.getContextPath()%>/faq/ansupdate/${ans.aaNo}'">수정</button>
							<button onclick="location.href='<%=request.getContextPath()%>/faq/ansdelete/${ans.aqNo}/${ans.aaNo}'">삭제</button>
						</c:if>	
					</sec:authorize>
				</div>

				<!-- 댓글 작성 -->
				<sec:authorize access="hasRole('ROLE_USER')">
					<form action="${cpath }/faq/ans/${ans.aaNo}/reply" method="post">
						<input type="text" value="${username }" name="userId">
						<input type="text" value="${ans.aaNo }" name="aaNo">
						<input type="text" name="rplContent" placeholder="댓글을 작성해주세요">
						<input type="submit" value="완료">
					</form>
				</sec:authorize>
				
				<!-- 댓글목록 -->
				<c:forEach items="${ans.aaRpls}" var="rpl">
					<br>
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
					
					<div class="row">
						<sec:authorize access="hasRole('ROLE_USER')">
							<c:if test="${username eq rpl.userId}">
								<button onclick="location.href='<%=request.getContextPath()%>/faq/rpldelete/${ans.aqNo}/${rpl.aaNo}/${rpl.rplNo}'">삭제</button>
								<button onclick="location.href='<%=request.getContextPath()%>/faq/rplupdate/${rpl.rplNo}'">수정</button>
							</c:if>	
						</sec:authorize>
					</div>
				</c:forEach>
				
			</c:forEach>
		</c:if>
	</div>
</body>
</html>