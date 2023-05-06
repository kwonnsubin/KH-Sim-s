<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자의 사용자 관리 상세</title>
</head>
<body>
<jsp:include page="../include/header.jsp" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script>

/*수정 취소(뒤로가기)*/
function goBack(){
	window.history.back();
}

/* 가입한 요금제 리스트 호출 ajax */
function fn_applyPlanAjax(userId){
	var html = "";
	<%-- <a href="<%=request.getContextPath()%>/admin/bizPlanApplyDetail/${list.orderNo}">${list.userId}</a> --%>
	$("#planSubList").empty();
	// planSubList
	$.ajax({
		url: "${pageContext.request.contextPath}/admin/selectUserApplyPlanAjax",
		type: "post",
		data: {userId : userId},
		dataType: "json",
		success: function(json){
			for(var i=0; i<json.length; i++){
				html += '<tr>';
				html += '<td><a href="${path}/admin/bizPlanApplyDetail/'+json[i].orderNo+'">'+json[i].orderNo+'</a></td>';
				html += '<td>'+json[i].bizName+'</td>';
				html += '<td>'+json[i].planName+'</td>';
				if(json[i].orderStatus=='1'){
					html += '<td>신청완료</td>';
				}else if(json[i].orderStatus=='2'){
					html += '<td>승인완료</td>';
				}else if(json[i].orderStatus=='3'){
					html += '<td>승인보류</td>';
				}
				html += '<td>'+json[i].orderDate+'</td>';
				html += '</tr>';
			}
			$("#planSubList").append(html);
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log(jqXHR);  //응답 메시지
			console.log(textStatus); //"error"로 고정인듯함
			console.log(errorThrown);
		}
	});
}

/* 리뷰 ajax */
	function fn_reviewAjax(userId){
	var review = "";
	$("#reviewList").empty();
	$.ajax({
		url: "${pageContext.request.contextPath}/admin/selectUserReviewAjax",
		type: "post",
		data: {userId : userId},
		dataType: "json",
		success: function(json){
			for(var i=0; i<json.length; i++){
				review += '<tr>';
				review += '<td><a href="${path}/admin/review/detail/'+json[i].reviewNo+'">'+json[i].reviewNo+'</a></td>';
				review += '<td>'+json[i].reviewContent+'</td>';
				review += '<td>'+json[i].reviewDate+'</td>';
				review += '<td>'+json[i].bizName+'</td>';
				if(json[i].reportReason != null){
					review += '<td>O</td>'
				}else{
					review += '<td>X</td>';
				}
				 if(json[i].reportStatus==1){
					review += '<td>미확인</td>';
				}else if(json[i].reportStatus==2){
					review += '<td>삭제</td>';
				}else if(json[i].reportStatus==3){
					review += '<td>반려</td>';
				}else if(json[i].reportStatus==0){
					review += '<td>해당없음</td>';
				}
			}
				$("#reviewList").append(review);
			},
			error: function(jqXHR, textStatus, errorThrown){
				console.log(jqXHR);  //응답 메시지
				console.log(textStatus); //"error"로 고정인듯함
				console.log(errorThrown);
			}
		});
}
 

</script>
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
												<h5 class="m-b-10">사용자 관리
													<c:choose>
														<c:when test="${cmd eq 'read' }"> 상세</c:when>
														<c:otherwise> 수정</c:otherwise>
													</c:choose>
												</h5>
											</div>
											<ul class="breadcrumb">
												<li class="breadcrumb-item"><a href=""><i class="feather icon-home"></i></a></li>
												<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/admin/userList/"><i class="breadcrumb-item"></i>사용자 관리</a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>사용자 관리 
													<c:choose>
														<c:when test="${cmd eq 'read' }"> 상세</c:when>
														<c:otherwise> 수정</c:otherwise>
													</c:choose>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<form action="<%=request.getContextPath()%>/admin/saveUserModify" method="post">
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
										<c:choose>
											<c:when test="${cmd eq 'read'}">
												<input class="btn btn-primary right m-l-10" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/userList'" value="목록">
											</c:when>
											<c:otherwise>
												<input class="btn btn-primary right m-l-10" type="button" onclick="goBack()" value="취소">
											</c:otherwise>
										</c:choose>
											<c:choose>
												<c:when test="${cmd eq 'read' }">
													<input class="btn btn-primary right" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/selectUserModify/${userDetail.userId}'" value="수정">
												</c:when>
												<c:otherwise>
													<input class="btn btn-primary right" type="submit" value="저장">
												</c:otherwise>
											</c:choose>
										<%-- <input type="hidden" value="${userDetail.userId }" name="userId"> --%>
									</div>
								</div>
								 <div class="col-sm-12">
	                				<div class="card">
	                    				<div class="card-header">
	                        				<h5>사용자 상세정보</h5>
	                    				</div>
	                    				<div class="card-body">
		                                    <div class="form-group row">
		                                        <label for="userId" class="col-sm-1 col-form-label text-center">아이디</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="userId" readonly value="${userDetail.userId}">
		                                        </div>
		                                        <label for="userName" class="col-sm-1 col-form-label text-center">이름</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="userName" readonly <c:if test="${cmd eq 'read' }">readonly</c:if> value="${userDetail.userName}">
		                                        </div>
		                                    </div>
		                           			 <div class="form-group row">
		                                        <label for="userEmail" class="col-sm-1 col-form-label text-center">메일</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="userEmail" readonly <c:if test="${cmd eq 'read' }">readonly</c:if> value="${userDetail.userEmail}">
		                                        </div>
		                                         <label for="userGender" class="col-sm-1 col-form-label text-center">성별</label>
		                                         <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="userGender" readonly <c:if test="${cmd eq 'read' }">readonly</c:if> value="${userDetail.userGender}">
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="userSsn" class="col-sm-1 col-form-label text-center">생년월일</label>
		                                        <div class="col-sm-5">
		                                            <%-- <input type="text" class="form-control"  name="userSsn" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${userDetail.userSsn}"> --%>
		                                            <input type="text" class="form-control"  name="birth"  readonly <c:if test="${cmd eq 'read' }">readonly</c:if> value="${userDetail.birth}">
		                                        </div>
		                                        <label for="userPhone" class="col-sm-1 col-form-label text-center">전화번호</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="userPhone" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${userDetail.userPhone}">
		                                        </div>
		                                    </div>
		                                    
	                            		</div>
	                            			
									</div>
									<div class="card">
	                    				<div class="card-header">
	                        				<%-- <h5>${userDetail.userId}님의 요금제 정보</h5> --%>
	                    				</div>
	                    				<div class="card-body">
		                                    <div class="form-group row">
		                                        <label for="planName" class="col-sm-1 col-form-label text-center">신청한 요금제 </label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="planName" readonly value="${cnt.myPlanCnt}개" onclick="fn_applyPlanAjax('${userDetail.userId}');" data-toggle="modal" data-target=".bd-example-modal-lg">
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="reviewPlanName" class="col-sm-1 col-form-label text-center">리뷰 </label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="reviewPlanName" readonly value="${cnt.reviewCnt}개" onclick="fn_reviewAjax('${userDetail.userId}');" data-toggle="modal" data-target=".bd-example-modal-lgReview">
		                                        </div>
		                                    </div>
	                            		</div>
	                            		
									</div>
								</div>
							</form>
				    	</div>
					</div>
				</div>
			</div>
			<div class="col-md-8 col-sm-12">
				<!-- <div class="card">
					<div class="card-header">
						<h5>Optional Sizes</h5>
					</div> -->
					<div class="card-body">
						<!-- <button type="button" class="btn  btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">Large modal</button> -->
						<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="bd-example-modal-lg" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header col-md-12">
										<h5 class="modal-title h4" id="myLargeModalLabel">${userDetail.userId}님의 신청요금제</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									</div>
									<div class="modal-body">
										<div class="col-md-12">
						                    <div class="card-body table-border-style">
						                        <div class="table-responsive">
						                            <table class="table table-hover">
						                                <thead class="text-center">
						                                    <tr>
						                                        <th>번호</th>
																<th>통신사명</th>
																<th>요금제명</th>
																<th>신청상태</th>
																<th>신청일</th>
						                                    </tr>
						                                </thead>
						                                <tbody id="planSubList" class="text-center">
						                                </tbody>
						                            </table>
						                       </div>
						                  </div>
						            </div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			<div class="col-md-8 col-sm-12">
				<!-- <div class="card">
					<div class="card-header">
						<h5>Optional Sizes</h5>
					</div> -->
					<div class="card-body">
						<!-- <button type="button" class="btn  btn-primary" data-toggle="modal" data-target=".bd-example-modal-lgReview">Large modal</button> -->
						<div class="modal fade bd-example-modal-lgReview" tabindex="-1" role="dialog" aria-labelledby="bd-example-modal-lgReview" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header col-md-12">
										<h5 class="modal-title h4" id="myLargeModalLabel">${userDetail.userId}님의 리뷰</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									</div>
									<div class="modal-body">
										<div class="col-md-12">
						                    <div class="card-body table-border-style">
						                        <div class="table-responsive">
						                            <table class="table table-hover">
						                                <thead class="text-center">
						                                    <tr>
						                                        <th>번호</th>
																<th>내용</th>
																<th>작성일</th>
																<th>통신사</th>
																<th>신고 여부</th>
																<th>처리 상태</th>
						                                    </tr>
						                                </thead>
						                                <tbody id="reviewList" class="text-center">
						                                </tbody>
						                            </table>
						                       </div>
						                  </div>
						            </div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			
		</div>
	</div>
</div>	
<jsp:include page="../include/footer.jsp" />

</body>
</html>