<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 붙여야 <form method="post"> 작동함 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내역 상세페이지</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<jsp:include page="../include/header.jsp" />
<div class="pcoded-main-container">
	<div class="pcoded-wrapper container">
		<div class="pcoded-content">
			<div class="pcoded-inner-content">
				<div class="pcoded-inner-content">
					<div class="main-body">
						<div class="page-wrapper">
							<div class="page-header">
								<div class="page-block">
									<div class="row align-items-center">
										<div class="col-md-12">
											<div class="page-header-title">
												<h5 class="m-b-10">문의내역 상세</h5>
											</div>
											<ul class="breadcrumb">
												<li class="breadcrumb-item"><a href=""><i class="feather icon-home"></i></a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>문의내역 관리</a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>문의내역 상세</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
										<input class="btn btn-primary right m-l-10" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/qnadelete/${qnaDetail.aqNo}'" value="삭제">
										<input class="btn btn-primary right " type="button" onclick="location.href='<%=request.getContextPath()%>/admin/qna/list'" value="목록">
									</div>
								</div>
								<div class="card text-center">
									<div class="card-body">
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group">
	                                       			<input type="text" class="form-control" name="ntcTitle" value="${qnaDetail.aqTitle }" readonly>
	                                   			</div>
											</div>
												<div class="col-sm-12">
					                                    <div class="form-group row">
					                                        <label for="adminId" class="col-sm-2 col-form-label left">작성자</label>
					                                        <div class="col-sm-2">
					                                            <input type="text" readonly class="form-control-plaintext" name="userId" value="${qnaDetail.userId }">
					                                        </div>
					                                        <label for="staticEmail" class="col-sm-2 col-form-label">작성일</label>
					                                        <div class="col-sm-2">
					                                            <input type="text" readonly class="form-control-plaintext" value="<fmt:formatDate value="${qnaDetail.aqDate}" pattern="yyyy.MM.dd"/>">
					                                        </div>
				                                       		<label for="adminId" class="col-sm-2 col-form-label left">조회수</label>
					                                        <div class="col-sm-2">
					                                            <input type="text" readonly class="form-control-plaintext" name="aqViews" value="${qnaDetail.aqViews }">
					                                        </div>
					                                    </div>
				                                </div>
											<div class="col-sm-12">
												<div class="form-group">
			                                        <textarea class="form-control" name="ntcContent" rows="20" readonly>${qnaDetail.aqContent }</textarea>
			                                    </div>
											</div>
										</div>
									</div>
								</div>
							<!-- 답변  -->
								<div class="card table-card review-card">
				                    <div class="card-header borderless">
				                        <div class="review-block">
					                        <h5>답글달기</h5>
					                    	<div class="form-group">
					                    <!-- 답변 작성  -->
									            <textarea class="form-control m-b-20" id="aaContent" rows="3" placeholder="댓글을 입력해보세요."></textarea>
									            <button type="submit" id="ans-btn">댓글 등록</button>
			                                </div>
					                    </div>
 
										<div class="card-body pb-0">
					                        <div class="review-block">
						                            <div class="row"   style="padding-bottom: 0px;">
						                                <div class="col">	
							                                <!-- 답글 들어가는 부분 -->
							                                <c:forEach var="ans" items="${qnaAnsList }" > 
							                                	<div class="qnaAns">
																		<h6 class="m-b-15">
 																			<c:choose>
																				<c:when test="${not empty ans.adminId}">${ans.adminId}</c:when>
																				<c:when test="${not empty ans.userId}">${ans.userId}</c:when>
																			</c:choose>
																			<span class="float-right f-13 text-muted">${ans.aaDate }</span>
																		</h6>					                                						                                    				                                
									                               		<p class="m-t-15 m-b-15 text-muted">${ans.aaContent}</p> 
																	<a href="#!" class="badge badge-primary m-t-5 m-b-20" data-toggle="collapse" data-target="#collapseExample" aria-expanded="true" aria-controls="collapseExample">댓글</a>
																	<div class="collapse show alert alert-secondary" id="collapseExample">
																		<div class="card-body m-b-15 m-t-20">
																		<!-- 대댓글 -->
																		<form:form action="../insertReply" method="post">
																			<div class="form-group">
																				 <input type="hidden" name="aaNo" value="${ans.aaNo}">
																				 <input type="hidden" name="adminId" value="${username }" >
									                                       		 <textarea class="form-control m-b-20" id="exampleFormControlTextarea1" rows="3" placeholder="댓글을 입력해보세요." name="rplContent"></textarea>
									                                       		 <button type="submit">댓글 등록</button>
									                               			</div>
																		</form:form>
									                               			<div class="m-t-40">
										                               			<c:forEach var="reply" items="${ans.replyList }" >
										                               				<h6 class="m-b-15">
													                               		<c:choose>
																							<c:when test="${not empty reply.adminId}">${ans.adminId}</c:when>
																							<c:when test="${not empty reply.userId}">${ans.userId}</c:when>
																						</c:choose>
																						<span class="float-right f-13 text-muted">${reply.rplDate }</span>
																					</h6>
													                               		 <p class="m-t-15 m-b-15 text-muted">${reply.rplContent }</p>								                               			
										                               			</c:forEach>
									                               			</div>
																		</div>
																	</div>
																 </div>
						                                	</c:forEach>
						                                </div>
						                            </div>
					                        </div>
					                    </div>
				                    </div> 
				                </div>
				              <!-- 답변 끝 -->
						</div>
				    </div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../include/footer.jsp" />
</body>
<script>

// 문의내역 등록하기 ajax
$('#ans-btn').on("click", function() {
			var adminId = "${username}"
			var aqNo = "${aqNo}"
			var aaContent = $("#aaContent").val();
			$.ajax({
				url: '<%=request.getContextPath()%>/admin/qna/insertAns',
				data : {adminId: adminId, aqNo: aqNo, aaContent: aaContent},
				type : "post",
				success : function(result) {
					if (result == "success") {
					$('#aaContent').val('') // 댓글 등록시 댓글 등록창 초기화
					getAnsList(); // 등록후 댓글 목록 불러오기 함수 실행
					}
				},
				error : function() {
					alert("등록 실패")
				}
			})
		})
		
		
// 문의내역 불러오기 ajax
function getAnsList(){
	var aqNo = "${aqNo}"
    $.ajax({
        type:'GET',
        url : '<%=request.getContextPath()%>/admin/qna/ansList',
        data: {aqNo: aqNo},
		success : function(result) {
				alert("조회 성공")
				var qnaAns = $(".qnaAns");
				$(".qnaAns").html(''); // 초기화 시켜야 댓글 목록의 중첩을 막을수 있음 아니면 등록할떄마다 append로 이어짐
				//$("#rCount").text("댓글 (" + rList.length + ")"); //댓글 갯수 조회하는 코드
				if (result != null) {
					console.log(result); // 결과출력	
					displayAns(result);
				}
			},
		error : function() {
			alert("서버 요청 실패!")
		}
        
    });
}	

function displayAns(result){
	var html = ''; // 변수초기화
	//$.each(result, function(){ });
	for ( var i in result) {
html += '<div class="qnaAns">';
html += '	<h6 class="m-b-15">';
if(result[i].adminId) {
	html += result[i].adminId;
}else if(result[i].userId) {
	html += result[i].userId;
}
html += '		<span class="float-right f-13 text-muted">'+result[i].aaDate+'</span>';
html += '	</h6>';	                                    				                                
html += '	<p class="m-t-15 m-b-15 text-muted">'+result[i].aaContent+'</p> ';
html += '	<a href="#!" class="badge badge-primary m-t-5 m-b-20" data-toggle="collapse" data-target="#collapseExample" aria-expanded="true" aria-controls="collapseExample">댓글</a>';
html += '	<div class="collapse show alert alert-secondary" id="collapseExample">';
html += '		<div class="card-body m-b-15 m-t-20">';
		//<!-- 대댓글 -->
html += '		<form:form action="../insertReply" method="post">';
html += '			<div class="form-group">';
html += '				 <input type="hidden" name="aaNo" value="'+result[i].aaNo+'">';
html += '				 <input type="hidden" name="adminId" value="'+result[i].username+'">';
html += '	       		 <textarea class="form-control m-b-20" id="exampleFormControlTextarea1" rows="3" placeholder="댓글을 입력해보세요." name="rplContent"></textarea>';
html += '	       		 <button type="submit">댓글 등록</button>';
html += '				</div>';
html += '		</form:form>';
html += '				<div class="m-t-40">';
for(var j in result[i].replyList){
html += 		'<h6 class="m-b-15">';
if(result[i].replyList[j].adminId) {
	html += result[i].replyList[j].adminId;
}else if(result[i].replyList[j].userId){
	html += result[i].replyList[j].userId;
}
html += '					 <span class="float-right f-13 text-muted">'+result[i].replyList[j].rplDate+'</span>';
html += '	           		 <p class="m-t-15 m-b-15 text-muted">'+result[i].replyList[j].rplContent+'</p>';
}
html += '				</div>';
html += '		</div>';
html += '	</div>';
html += '</div>';
	}	
	$(".qnaAns").append(html);
}
</script>
</html>