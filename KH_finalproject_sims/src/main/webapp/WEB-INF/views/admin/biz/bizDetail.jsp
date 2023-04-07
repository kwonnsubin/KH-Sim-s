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
							<form action="<%=request.getContextPath()%>/admin/saveBizModify" method="post">
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
										<input class="btn btn-primary right m-l-10" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/applyList'" value="목록">
											<c:choose>
												<c:when test="${cmd eq 'read' }">
													<input class="btn btn-primary right" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/selectBizModify/${applyDetail.bizId}'" value="수정">
												</c:when>
												<c:otherwise>
													<input class="btn btn-primary right" type="submit" value="저장">
												</c:otherwise>
											</c:choose>
										<input type="hidden" value="${applyDetail.bizId }" name="bizId">
									</div>
								</div>
							    <div class="col-sm-12">
	                				<div class="card">
	                    				<div class="card-header">
	                        				<h5>통신사 정보</h5>
	                    				</div>
	                    				<div class="card-body">
	                    					<!-- 로고있어야하넹 로고자리입니다-->
		                                    <div class="form-group row">
		                                        <label for="bizName" class="col-sm-1 col-form-label text-center">법인명</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="bizName" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizName}">
		                                        </div>
		                                        <label for="bizSsn" class="col-sm-1 col-form-label text-center">법인 등록번호</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="bizSsn" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizSsn}">
		                                        </div>
		                                    </div>
		                           			 <div class="form-group row">
		                                        <label for="bizCrn" class="col-sm-1 col-form-label text-center">사업자번호</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="bizCrn" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizCrn}">
		                                        </div>
		                                         <label for="bizId" class="col-sm-1 col-form-label text-center">아이디</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="bizId" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizId}">
		                                        </div>
		                                        
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="bizEmail" class="col-sm-1 col-form-label text-center">이메일</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="bizEmail" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizEmail}">
		                                        </div>
		                                        <label for="bizPhone" class="col-sm-1 col-form-label text-center">연락처</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="bizPhone" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizPhone}">
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="bizOwnerName" class="col-sm-1 col-form-label text-center">대표자명</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="bizOwnerName" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizOwnerName}">
		                                        </div>
		                                        <label for="bizHp" class="col-sm-1 col-form-label text-center">홈페이지</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="bizHp" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizHp}">
		                                        </div>
		                                    </div>
		                           			 <div class="form-group row">
		                                        <label for="phoneOpTime" class="col-sm-1 col-form-label text-center">개통 소요시간</label>
		                                        <div class="col-sm-5" >
		                                            <input type="text" class="form-control"  name="phoneOpTime" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.phoneOpTime}">
		                                        </div>
		                                         <label for="bizTime" class="col-sm-1 col-form-label text-center">영업시간</label>
		                                        <div class="col-sm-5">
		                                            <input type="hidden" class="form-control"  name="bizBeginTime" value="${applyDetail.bizBeginTime}">
		                                            <input type="hidden" class="form-control"  name="bizEndTime" value="${applyDetail.bizEndTime}">
		                                            <input type="text" class="form-control"  name="bizTime" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizBeginTime} ~ ${applyDetail.bizEndTime}">
		                                        </div>
		                                        
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="bizClosedDay" class="col-sm-1 col-form-label text-center">휴무일</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="bizClosedDay" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizClosedDay}">
		                                        </div>
		                                        <label for="bizClosedDay" class="col-sm-1 col-form-label text-center">고객센터번호</label>
		                                        <c:set var="netService" value=""/>
		                                        <c:if test="${not empty applyDetail.ktNetService }">
		                                        	<c:set var="netService" value="KT : ${applyDetail.ktNetService} / "/>
		                                        </c:if>
		                                        <c:if test="${not empty applyDetail.sktNetService }">
		                                        	<c:set var="netService" value="${netService} SKT : ${applyDetail.sktNetService} / "/>
		                                        </c:if>
		                                        <c:if test="${not empty applyDetail.lgNetService }">
		                                        	<c:set var="netService" value="${netService} LG : ${applyDetail.lgNetService}"/>
		                                        </c:if>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="bizClosedDay" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${netService}">
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="bizFax" class="col-sm-1 col-form-label text-center">팩스</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="bizFax" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizFax}">
		                                        </div>
		                                        <label for="network" class="col-sm-1 col-form-label text-center">지원통신망</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="network" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.network}">
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="bizLocation" class="col-sm-1 col-form-label text-center">주소</label>
		                                        <div class="col-sm-11">
		                                            <input type="text" class="form-control"  name="bizLocation" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizLocation}">
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="card">
											<div class="card-body table-border-style">
												<div class="table-responsive">
													<table class="table table-hover">
														<thead>
															<tr>
																<th>번호</th>
																<th>요금제명</th>
																
															</tr>
														</thead>
														<tbody>
															<c:forEach var="list" items="${bizPlanList}" varStatus="status">
																<tr>
																	<td>${status.count}</td>
																	<td>${list.planName}</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
												<nav aria-label="Page navigation example">
													<ul class="pagination justify-content-center">
														<li class="page-item"><a class="page-link" href="" aria-label="Previous"><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
														<li class="page-item"><a class="page-link" href="" aria-label="Previous">1</a></li>
														<li class="page-item"><a class="page-link" href="" aria-label="Previous">2</a></li>
														<li class="page-item"><a class="page-link" href="" aria-label="Previous">3</a></li>
														<li class="page-item"><a class="page-link" href="" aria-label="Previous"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
													</ul>
												</nav>
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
	</div>
</div>
		
<jsp:include page="../include/footer.jsp" />

</body>
</html>