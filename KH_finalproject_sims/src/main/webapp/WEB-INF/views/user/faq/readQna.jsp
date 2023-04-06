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
    	
    <!-- Scripts -->
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/jquery/jquery.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/owl-carousel.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/animation.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/imagesloaded.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/popup.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/custom.js"></script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<section>
		<div class="container-sm div-m">
		
			<!-- 질문제목 -->
			<div class="row">
				<div class="col-sm-12 p-2 float-sm-none mt-5">
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
				<div class="col-sm-12 p-2 lh-xl">
					${question.aqContent }
				</div>
				<div class="col-sm-auto p-2 pt-5 small">
					조회 ${question.aqViews }
				</div>
			</div>
			<hr>
			<!-- /질문내용 -->
			
			<!-- n개의 답변이 있어요 -->
			<div class="row my-3">
				<div class="col-sm-12">
					<div class="p-2">
						<span style="color: blue">${question.aqAnswers }개</span>
						<span>의 답변이 있어요</span>
					</div>
				</div>
			</div>
			
			<!-- 답변목록 -->
			<div class="faq-answer">
				<div class="answer-list">
					<c:if test="${not empty answers }">
						<c:forEach items="${answers }" var="answer">
							<hr> 
							<div class="answer-item row my-4">
							
								<div class="answer-writer col-10 small py-2">
									${answer.adminId == null ? answer.userId : answer.adminId}
								</div>
								
								<div class="answer-date col-2 small py-2 text-end">
									${answer.aaRedate == null ? answer.aaDate : answer.aaRedate}
								</div>
								
								<div class="answer-content col-10 py-4">
									${answer.aaContent } 
								</div>
								
								<!-- 사용자 접속인 경우 답변 수정,삭제 버튼 표시 -->
								<div class="btn-ans-mod col-2 small py-1 text-end">
									<sec:authorize access="hasRole('ROLE_USER')">
										<c:if test="${username eq answer.userId}">
											<button onclick="location.href='<%=request.getContextPath()%>/faq/ansupdate/${answer.aaNo}'">수정</button>
											<button onclick="location.href='<%=request.getContextPath()%>/faq/ansdelete/${answer.aqNo}/${answer.aaNo}'">삭제</button>
										</c:if>	
									</sec:authorize>
								</div>
								<!-- /답변 수정,삭제 -->
									
								<!-- 댓글목록 -->
								<div id="reply-list" class="reply-list">
									<c:forEach items="${answer.aaRpls}" var="rpl">
									<div class="reply-item row py-2">
										<div class="reply-content">
											${rpl.rplContent }
										</div>
										<div class="reply-writer col-2">
											${rpl.adminId == null ? rpl.userId : rpl.adminId}
										</div>
										<div class="reply-date col-10 text-end">
											${rpl.rplRedate == null ? rpl.rplDate : rpl.rplRedate}
										</div>
										
										
										<!-- 댓글 수정,삭제 -->
										<div class="btn-rpl-mod col-2 small py-1">
											<sec:authorize access="hasRole('ROLE_USER')">
												<c:if test="${username eq rpl.userId}">
													<button onclick="location.href='<%=request.getContextPath()%>/faq/rplupdate/${rpl.rplNo}'">수정</button>
													<button onclick="location.href='<%=request.getContextPath()%>/faq/rpldelete/${answer.aqNo}/${rpl.aaNo}/${rpl.rplNo}'">삭제</button>
												</c:if>	
											</sec:authorize>
										</div>
										<!-- /댓글 수정,삭제 -->
									</div>
									</c:forEach>
								</div>
								<!-- /댓글목록 -->
																	
								<sec:authorize access="hasRole('ROLE_USER')">
								<!-- 댓글 작성 -->
									<div class="p-2">
										<form action="${cpath }/faq/ans/${answer.aaNo}/reply" method="post">
											<input type="hidden" value="${username }" name="userId" id="userId">
											<input type="hidden" value="${answer.aaNo }" name="aaNo" id="aaNo">
											<input type="text" name="rplContent" id="rplContent" placeholder="댓글을 작성해주세요">
											<button type="submit" id="btn-writeRpl">완료</button>
										</form>
									</div>
									
								<!-- /댓글 작성 -->
								</sec:authorize>
									
							</div>
						</c:forEach>
					</c:if>
				</div>
				<!-- /답변목록 -->
			</div>
			<sec:authorize access="hasRole('ROLE_USER')">
			<!-- 답변달기 모달 -->
				<div class="modal fade" id="answerModal" tabindex="-1" role="dialog" aria-labelledby="answerModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="answerModalLabel">답변 작성하기</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form id="answerForm" method="post" action="${cpath }/faq/qna/${question.aqNo}/answer">
								<div class="modal-body">
									<input type="hidden" name="aqNo" value="${question.aqNo}">
									<div class="form-group">
										<label for="content">내용</label>
										<textarea class="form-control" id="content" name="aaContent" rows="5" required></textarea>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
									<button type="submit" class="btn btn-primary">등록</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			<!-- /답변달기 모달 -->
			</sec:authorize>
			
			
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
</body>
</html>