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
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	
	<title>문의게시판 상세보기</title>
	
	<!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/qna.css">
</head>
<body>

	<jsp:include page="../../header.jsp"/>
	
	<section>
		<div class="container-sm">
		
		
			<!-- 질문제목 -->
			<div class="row">
				<div class="col-sm-10 p-2 float-sm-none mt-5">
					<h4>${question.aqTitle }</h4>
				</div>
				<div class="col-sm-auto p-2 small mb-3">
					<span class="pe-3">${question.userId }</span>
					<span class="pe-3">${question.aqDate }</span>
					<span class="pe-3">${question.aqRedate }</span>
					<span>
					<sec:authorize access="hasRole('ROLE_USER')">
						<sec:authentication property="principal.username" var="username"/>
						<c:if test="${username eq question.userId}">
							<button onclick="location.href='<%=request.getContextPath()%>/faq/qnaupdate/${question.aqNo}'">수정</button>
						</c:if>	
					</sec:authorize>
					</span>
				</div>
			</div>
			<hr>
			<!-- /질문제목 -->
			
			<!-- 질문내용 -->
			<div class="row my-3">
				<div class="col-sm-12 p-2">
				${question.aqContent }
				</div>
				<div class="col-sm-auto p-2 pt-5 small">
				조회 ${question.aqViews }
				</div>
			</div>
			<hr>
			<!-- /질문내용 -->
			
			<!-- 답변 -->
			<div class="row my-3">
				<div class="col-sm-12">
					<div class="p-2">
						<span style="color: blue">${question.aqAnswers }개</span>
						<span>의 답변이 있어요</span>
					</div>
				</div>
			</div>
			
			<div>
				<!-- 답변목록 -->
				<c:if test="${not empty answers }">
					<c:forEach items="${answers }" var="ans">
						<hr> 
						<div class="row my-4">
						
							<div class="col small py-2">
								<c:if test="${not empty ans.adminId }">
									${ans.adminId }
								</c:if>
								<c:if test="${not empty ans.userId }">
									${ans.userId } 
								</c:if>
							</div>
							<div class="col-2 small py-2">
								<!-- 답변 수정,삭제 -->
								<sec:authorize access="hasRole('ROLE_USER')">
									<c:if test="${username eq ans.userId}">
										<button onclick="location.href='<%=request.getContextPath()%>/faq/ansupdate/${ans.aaNo}'">수정</button>
										<button onclick="location.href='<%=request.getContextPath()%>/faq/ansdelete/${ans.aqNo}/${ans.aaNo}'">삭제</button>
									</c:if>	
								</sec:authorize>
								<!-- /답변 수정,삭제 -->
							</div>
							<div class="col-2 small py-2">
								<c:if test="${empty ans.aaRedate }">
									${ans.aaDate }
								</c:if> 
								<c:if test="${not empty ans.aaRedate }">
									${ans.aaRedate }
								</c:if>
							</div>
							
							<div class="py-2">
								${ans.aaContent } 
							</div>
								
							<!-- 댓글 작성 -->
							<div class="p-2">
								<sec:authorize access="hasRole('ROLE_USER')">
									<form action="${cpath }/faq/ans/${ans.aaNo}/reply" method="post">
										<input type="hidden" value="${username }" name="userId">
										<input type="hidden" value="${ans.aaNo }" name="aaNo">
										<input type="text" name="rplContent" placeholder="댓글을 작성해주세요">
										<input type="submit" value="완료">
									</form>
								</sec:authorize>
							</div>
							<!-- /댓글 작성 -->
								
								<!-- 댓글목록 -->
								<c:forEach items="${ans.aaRpls}" var="rpl">
								<div class="py-2">
									${rpl.rplContent }
									<div>
										<c:if test="${not empty rpl.adminId }">
											${rpl.adminId }
										</c:if>
										<c:if test="${not empty rpl.userId }">
											${rpl.userId } 
										</c:if>
									</div>
									<div>
										<c:if test="${empty rpl.rplRedate }">
											${rpl.rplDate }
										</c:if>
										<c:if test="${not empty rpl.rplRedate }">
											${rpl.rplRedate }
										</c:if>
									</div>
									
									<!-- 댓글 수정,삭제 -->
									<div>
										<sec:authorize access="hasRole('ROLE_USER')">
											<c:if test="${username eq rpl.userId}">
												<button onclick="location.href='<%=request.getContextPath()%>/faq/rplupdate/${rpl.rplNo}'">수정</button>
												<button onclick="location.href='<%=request.getContextPath()%>/faq/rpldelete/${ans.aqNo}/${rpl.aaNo}/${rpl.rplNo}'">삭제</button>
											</c:if>	
										</sec:authorize>
									</div>
									<!-- /댓글 수정,삭제 -->
								</div>
								</c:forEach>
								<!-- /댓글목록 -->
								
							</div>
					</c:forEach>
				</c:if>
				<!-- 답변달기 -->
				<sec:authorize access="hasRole('ROLE_USER')">
					<hr>
					<form action="${cpath }/faq/qna/${question.aqNo}/answer" method="post">
						<input type="hidden" value="${username }" name="userId">
						<input type="hidden" value="${question.aqNo }" name="aqNo">
						<input type="text" name="aaContent" size="60" placeholder="답변을 작성해주세요">
						<input type="submit" value="답변하기">
					</form>
				</sec:authorize>
				<!-- /답변달기 -->
				<!-- /답변목록 -->
			</div>
			
			
		</div>
	</section>
	
	<jsp:include page="../../footer.jsp"/>
	
	<!-- Scripts -->
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/jquery/jquery.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/owl-carousel.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/animation.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/imagesloaded.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/popup.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/custom.js"></script>
	
</body>
</html>