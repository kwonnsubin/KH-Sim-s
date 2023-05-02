<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자의 사용자 관리 상세</title>
</head>
<body>
<jsp:include page="../include/header.jsp" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

/*수정 취소(뒤로가기)*/
function goBack(){
	window.history.back();
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
		                                            <input type="text" class="form-control"  name="planName" readonly value="${cnt.myPlanCnt}개" onclick="window.open('<%=request.getContextPath()%>/admin/bizPlanApplyList?searchOption=userId&searchBox=${userDetail.userId}','요금제 리스트','width = 500, height = 500')">
		                                        </div>
		                                    </div>
		                                    <%-- <div class="form-group row">
		                                        <label for="planName" class="col-sm-1 col-form-label text-center">리뷰 </label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="planName" readonly value="${cnt.myPlanCnt}개" onclick="location.href='<%=request.getContextPath()%>/admin/bizPlanApplyList/${userDetail.userId}'">
		                                        </div>
		                                    </div> --%>
	                            		</div>
	                            		
									</div>
								</div>
							</form>
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