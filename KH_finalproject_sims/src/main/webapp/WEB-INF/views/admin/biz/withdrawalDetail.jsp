<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    	
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
							<form action="<%=request.getContextPath()%>/admin/updateBizStatus" method="post">
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
										<input class="btn btn-primary right m-l-10" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/applyList'" value="목록">
										<input class="btn btn-primary right" type="submit" value="저장">
									</div>
								</div>
							
								<div class="row">
									 <div class="col-sm-8">
		                				<div class="card">
		                    				<div class="card-header">
		                        				<h5>통신사 정보</h5>
		                    				</div>
		                    				<div class="card-body">
			                                    <div class="form-group row">
			                                        <label for="bizName" class="col-sm-2 col-form-label text-center">법인명</label>
			                                        <div class="col-sm-10">
			                                            <input type="text" class="form-control"  name="bizName" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizName}">
			                                        </div>
			                                    </div>
			                           			 <div class="form-group row">
			                                        <label for="bizSsn" class="col-sm-2 col-form-label text-center">법인 등록번호</label>
			                                        <div class="col-sm-10">
			                                            <input type="text" class="form-control"  name="bizSsn" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizSsn}">
			                                        </div>
			                                    </div>
			                           			 <div class="form-group row">
			                                        <label for="bizCrn" class="col-sm-2 col-form-label text-center">사업자등록번호</label>
			                                        <div class="col-sm-10">
			                                            <input type="text" class="form-control"  name="bizCrn" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizCrn}">
			                                        </div>
			                                    </div>
			                           			 <div class="form-group row">
			                                         <label for="bizId" class="col-sm-2 col-form-label text-center">아이디</label>
			                                        <div class="col-sm-10">
			                                            <input type="text" class="form-control"  name="bizId" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizId}">
			                                        </div>
			                                        
			                                    </div>
			                                    <div class="form-group row">
			                                        <label for="bizEmail" class="col-sm-2 col-form-label text-center">이메일</label>
			                                        <div class="col-sm-10">
			                                            <input type="text" class="form-control"  name="bizEmail" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizEmail}">
			                                        </div>
			                                    </div>
			                           			 <div class="form-group row">
			                                        <label for="bizPhone" class="col-sm-2 col-form-label text-center">연락처</label>
			                                        <div class="col-sm-10">
			                                            <input type="text" class="form-control"  name="bizPhone" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizPhone}">
			                                        </div>
			                                    </div>
			                           			 <div class="form-group row">
			                                        <label for="bizLocation" class="col-sm-2 col-form-label text-center">주소</label>
			                                        <div class="col-sm-10">
			                                            <input type="text" class="form-control"  name="bizLocation" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizLocation}">
			                                        </div>
			                                    </div>
		                            		</div>	
										</div>
									</div>
									 <div class="col-sm-4">
		                				<div class="card">
		                    				<div class="card-header">
		                        				<h5>탈퇴 사유</h5>
		                    				</div>
			                    			<div class="card-body">
			                    				<div class="row">
			                    					<div class="col-md-12">
			                    						<textarea class="form-control" aria-label="with textarea" name="opinion" style= height:277px;resize:none;>${applyDetail.opinion }</textarea>
			                    						<%-- <textarea class="col-md-12 bg-light p-4 mb-2" style="height:277px; resize:none; border:2px solid rgba(0, 0, 0, 0.15);" name="rvwOpinion">${applyDetail.opinion }</textarea> --%>
			                    					</div>
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
		</div>
	</div>s
</div>
		
<jsp:include page="../include/footer.jsp" />

</body>
</html>