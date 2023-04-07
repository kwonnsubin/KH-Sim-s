<%@page import="kh.finalproject.sims.user.model.vo.UserAnsVo"%>
<%@page import="kh.finalproject.sims.user.model.vo.UserRplVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	
</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<section>
		<div class="container-sm div-m">
			
			<!-- 질문제목 -->
			<div class="row">
				<div class="col-sm-12 p-3 float-sm-none mt-5">
					<h4>${question.aqTitle }</h4>
				</div>
				<div class="col-sm-auto p-3 small mb-3">
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
				<hr>
			</div>
			<!-- /질문제목 -->
			
			<!-- 질문내용 -->
			<div class="row">
				<div class="my-4">
					<div class="col-sm-12 py-3 lh-xl">
						${question.aqContent }
					</div>
					<div class="col-sm-auto pt-5 small">
						조회 ${question.aqViews }
					</div>
				</div>
				<hr>
			</div>
			<!-- /질문내용 -->
			
			<!-- n개의 답변이 있어요 -->
			<div class="row">
				<div class="col-sm-12 p-3 my-2">
					<span style="color: blue">${question.aqAnswers }개</span>
					<span>의 답변이 있어요</span>
				</div>
				<hr>
			</div>
			
			<!-- 답변목록 -->
			<div class="row">
				<c:if test="${not empty answers }">
					<c:forEach items="${answers }" var="answer">
						<div class="answer-item">
							<div class="row my-4">
								<div class="answer-writer col-6 small py-2">
									${answer.adminId == null ? answer.userId : answer.adminId}
								</div>
								
								<div class="answer-date col-6 small py-2 text-end">
									<fmt:formatDate value="${answer.aaRedate == null ? answer.aaDate : answer.aaRedate}" pattern="yyyy.MM.dd HH:mm"/>
								</div>
								
								<div class="answer-content col-12 py-4">
									${answer.aaContent } 
								</div>
									
								<!-- 댓글목록 -->
								<div class="m-2">
									<c:forEach items="${answer.aaRpls}" var="rpl">
										<div class="reply-item row">
											<div class="reply-writer col-6 small py-1">
												${rpl.adminId == null ? rpl.userId : rpl.adminId}
											</div>
											<div class="reply-date col-6 small py-1 text-end">
												<fmt:formatDate value="${rpl.rplRedate == null ? rpl.rplDate : rpl.rplRedate}" pattern="yyyy.MM.dd HH:mm"/>
											</div>
											<div class="reply-content col-10 py-2">
												${rpl.rplContent }
											</div>
											
											<!-- 작성자=사용자이면 댓글 수정,삭제 버튼 표시 -->
											<div class="btn-rpl-mod col-2 small py-1 text-end">
												<sec:authorize access="hasRole('ROLE_USER')">
													<c:if test="${username eq rpl.userId}">
														<div class="btn-group btn-group-sm" role="group">
														  	<button type="button" class="btn btn-gray" 
														  	onclick="location.href='<%=request.getContextPath()%>/faq/rplupdate/${rpl.rplNo}'">수정</button>
														  	<button type="button" class="btn btn-gray" 
														  	onclick="location.href='<%=request.getContextPath()%>/faq/rpldelete/${answer.aqNo}/${rpl.aaNo}/${rpl.rplNo}'">삭제</button>
														</div>
													</c:if>	
												</sec:authorize>
											</div>
											<!-- /댓글 수정,삭제 -->
										</div>
									</c:forEach>
								</div>
								<!-- /댓글목록 -->
																	
								<!-- 댓글 작성 -->
								<sec:authorize access="hasRole('ROLE_USER')">
									<div class="p-3 pb-1">
										<form action="${cpath }/faq/ans/${answer.aaNo}/reply" method="post">
											<input type="hidden" value="${username }" name="userId" id="userId">
											<input type="hidden" value="${answer.aaNo }" name="aaNo" id="aaNo">
											<div class="input-group">
											  	<input type="text" name="rplContent" id="rplContent" class="form-control" placeholder="댓글을 작성해주세요">
											  	<button class="btn" type="submit" id="btn-writeRpl">완료</button>
											</div>
										</form>
									</div>
								</sec:authorize>
								<!-- /댓글 작성 -->
							</div>
						</div>
						<hr>
					</c:forEach>
				</c:if>
			</div>
				<!-- /답변목록 -->
			
			<!-- 답변달기 -->
			<sec:authorize access="hasRole('ROLE_USER')">
				<div class="input-group p-4" id="input-answer">
			 		<textarea id="aaContent" name="aaContent" class="form-control" rows="1" cols="80" placeholder="답변은 구체적으로 남길수록 도움이 돼요"></textarea>
			  		<button class="btn" type="button" id="btn-writeAns">등록</button>
				</div>
			</sec:authorize>
			<!-- /답변달기 -->
			
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
</body>
<script>

	// 답변달기 ajax
	$('#btn-writeAns').on("click", function() {
		var aaContent = $("#aaContent").val();
		var aqNo = "${aqNo}";
		var userId = "${username}";
		$.ajax({
			url: "<%=request.getContextPath()%>/faq/qna/${aqNo}/answer",
			data: {
				"aaContent" : aaContent,
				"aqNo" : aqNo,
				"userId" : userId
			},
			type: "post",
			success: function(result) {
				alert("답변 등록 성공");
				$('#aaContent').val('');
				getAnsList();
			},
			error: function(error) {
				alert("답변 등록 실패");
			}
		})
	})
	
	// 답변 불러오기 ajax
	function getAnsList() {
		var aqNo = "${aqNo}"
		$.ajax({
			url: '<%=request.getContextPath()%>/faq/qna/ansList',
			data: {aqNo: aqNo},
			type: 'get',
			success: function(result) {
				$(".answer-item").empty();
				displayAns(result);
				alert("답변 조회 성공");
			},
			error: function() {
				alert("답변 조회 실패");
			}
		})
	}
	
	function displayAns(result) {
		var html = '';
		for(var i in result) {
			html += '<div class="answer-item">';
			html += '<div class="row my-4">'
			html += '<div class="answer-writer col-6 small py-2">';
			if(result[i].userId) {
				html += result[i].userId;
			} else if(result[i].adminId) {
				html += result[i].adminId;
			}
			html += '</div>';
			html += '<div class="answer-date col-6 small py-2 text-end">';
			/* html += '<fmt:formatDate value="${answer.aaRedate == null ? answer.aaDate : answer.aaRedate}" pattern="yyyy.MM.dd HH:mm"/>'; */
			html += '</div>';
			html += '<div class="answer-content col-12 py-4">';
			html += result[i].aaContent;
			html += '</div>';
			html += '<div class="m-2">';
			for(var j in result[i].aaRpls) {
				html += '<div class="reply-item row">';
				html += '<div class="reply-writer col-6 small py-1">';
				if(result[i].aaRpls[j].userId) {
					html += result[i].aaRpls[j].userId;
				} else {
					html += result[i].aaRpls[j].adminId;
				}
				html += '</div>';
				html += '<div class="reply-date col-6 small py-1 text-end">';
				/* html += '<fmt:formatDate value="${rpl.rplRedate == null ? rpl.rplDate : rpl.rplRedate}" pattern="yyyy.MM.dd HH:mm"/>'; */
				html += '</div>';
				html += '<div class="reply-content col-10 py-2">';
				html += result[i].aaRpls[j].rplContent;
				html += '</div>';
				html += '</div>';
			}
			html += '</div>';
/* 			<!-- 댓글 작성 -->
			<sec:authorize access="hasRole('ROLE_USER')">
				<div class="p-3 pb-1">
					<form action="${cpath }/faq/ans/${answer.aaNo}/reply" method="post">
						<input type="hidden" value="${username }" name="userId" id="userId">
						<input type="hidden" value="${answer.aaNo }" name="aaNo" id="aaNo">
						<div class="input-group">
						  	<input type="text" name="rplContent" id="rplContent" class="form-control" placeholder="댓글을 작성해주세요">
						  	<button class="btn" type="submit" id="btn-writeRpl">완료</button>
						</div>
					</form>
				</div>
			</sec:authorize>
			<!-- /댓글 작성 --> */
			html += '</div>';
			html += '</div>';
			html += '<hr>';			
		}
		$(".answer-item").append(html);
	}
</script>
</html>