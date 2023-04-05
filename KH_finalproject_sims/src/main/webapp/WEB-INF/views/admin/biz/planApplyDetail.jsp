<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    	
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통신사 요금제 개통 신청 상세</title>
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
												<h5 class="m-b-10">통신사 관리
													<c:choose>
														<c:when test="${cmd eq 'read' }"> 상세</c:when>
														<c:otherwise> 수정</c:otherwise>
													</c:choose>
												</h5>
											</div>
											<ul class="breadcrumb">
												<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/admin/dashboard"><i class="feather icon-home"></i></a></li>
												<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/admin/applyList"><i class="breadcrumb-item"></i>통신사 관리</a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>통신사 관리 
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
							<form action="<%=request.getContextPath()%>/adminUser/saveBizModify" method="post">
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
										<input class="btn btn-primary right m-l-10" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/applyList'" value="목록">
											<c:choose>
												<c:when test="${cmd eq 'read' }">
													<input class="btn btn-primary right" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/selectBizModify/${userDetail.bizId}'" value="수정">
												</c:when>
												<c:otherwise>
													<input class="btn btn-primary right" type="submit" value="저장">
												</c:otherwise>
											</c:choose>
										<input type="hidden" value="${applyDetail.bizId }" name="bizId">
									</div>
								</div>
								</form>
							 <div class="col-sm-12">
                				<div class="card">
                    				<div class="card-header">
                        				<h5>통신사 요금제 가입 신청서</h5>
                    				</div>
                    				
                    				<div class="card-body">
                    					
	                                    <div class="form-group row">
	                                        <label for="planName" class="col-sm-1 col-form-label text-center">요금제명</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="planName" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.planName}">
	                                        </div>
	                                        <label for="planData" class="col-sm-1 col-form-label text-center">총 데이터</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="planData" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.planData}">
	                                        </div>
	                                    </div>
	                           			 <div class="form-group row">
	                                        <label for="planData" class="col-sm-1 col-form-label text-center">기본 데이터</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="planData" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.planData}">
	                                        </div>
	                                         <label for="planDataOver" class="col-sm-1 col-form-label text-center">초과 데이터</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="planDataOver" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.planDataOver}">
	                                        </div>
	                                        
	                                    </div>
	                                    <div class="form-group row">
	                                        <label for="planVoice" class="col-sm-1 col-form-label text-center">통화</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="planVoice" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.planVoice}"/>">
	                                        </div>
	                                        <label for="planMessage" class="col-sm-1 col-form-label text-center">문자</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="planMessage" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.planMessage}">
	                                        </div>
	                                    </div>
	                                    <div class="form-group row">
	                                        <label for="netName" class="col-sm-1 col-form-label text-center">통신망</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="netName" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.netName}">
	                                        </div>
	                                        <label for="genName" class="col-sm-1 col-form-label text-center">통신세대</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="genName" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.genName}">
	                                        </div>
	                                    <div class="form-group row">
	                                        <label for="planPrice" class="col-sm-1 col-form-label text-center">월 금액</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="planPrice" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.planPrice}">
	                                        </div>
	                                        <label for="planPrice" class="col-sm-1 col-form-label text-center">1개월 이후 금액</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="planPrice" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizDetail.planPrice}">
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
		</div>
	</div>
</div>
		
<jsp:include page="../include/footer.jsp" />

</body>
</html>