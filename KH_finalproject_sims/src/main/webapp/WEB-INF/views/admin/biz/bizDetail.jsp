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
												<li class="breadcrumb-item"><a href=""><i class="feather icon-home"></i></a></li>
												<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/adminBiz/applyList/"><i class="breadcrumb-item"></i>통신사 관리</a></li>
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
							<form action="<%=request.getContextPath()%>/adminUser/saveUserModify" method="post">
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
										<input class="btn btn-primary right m-l-10" type="button" onclick="location.href='<%=request.getContextPath()%>/adminBiz/applyList'" value="목록">
											<c:choose>
												<c:when test="${cmd eq 'read' }">
													<input class="btn btn-primary right" type="button" onclick="location.href='<%=request.getContextPath()%>/adminUser/selectUserModify/${userDetail.userId}'" value="수정">
												</c:when>
												<c:otherwise>
													<input class="btn btn-primary right" type="submit" value="저장">
												</c:otherwise>
											</c:choose>
										<input type="hidden" value="${userDetail.userId }" name="userId">
									</div>
								</div>
								</form>
							 <div class="col-sm-12">
                				<div class="card">
                    				<div class="card-header">
                        				<h5>통신사 정보</h5>
                    				</div>
                    				<form>
                    				<div class="card-body">
                    					<!-- 로고있어야하넹 로고자리입니다-->
	                                    <div class="form-group row">
	                                        <label for="bizName" class="col-sm-1 col-form-label text-center">법인명</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="bizName" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizDetail.bizName}">
	                                        </div>
	                                        <label for="bizSsn" class="col-sm-1 col-form-label text-center">법인 등록번호</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="bizSsn" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizDetail.bizSsn}">
	                                        </div>
	                                    </div>
	                           			 <div class="form-group row">
	                                        <label for="bizCrn" class="col-sm-1 col-form-label text-center">사업자번호</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="bizCrn" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizDetail.bizCrn}">
	                                        </div>
	                                         <label for="bizId" class="col-sm-1 col-form-label text-center">아이디</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="bizId" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizDetail.bizId}">
	                                        </div>
	                                        
	                                    </div>
	                                    <div class="form-group row">
	                                        <label for="bizEmail" class="col-sm-1 col-form-label text-center">이메일</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="bizEmail" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizDetail.bizEmail}">
	                                        </div>
	                                        <label for="bizPhone" class="col-sm-1 col-form-label text-center">연락처</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="bizPhone" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizDetail.bizPhone}">
	                                        </div>
	                                    </div>
	                                    <div class="form-group row">
	                                        <label for="bizOwnerName" class="col-sm-1 col-form-label text-center">대표자명</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="bizOwnerName" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizDetail.bizOwnerName}">
	                                        </div>
	                                        <label for="bizHp" class="col-sm-1 col-form-label text-center">홈페이지</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="bizHp" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizDetail.bizHp}">
	                                        </div>
	                                    </div>
	                           			 <div class="form-group row">
	                                        <label for="phoneOpTime" class="col-sm-1 col-form-label text-center">개통 소요시간</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="phoneOpTime" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizDetail.phoneOpTime}">
	                                        </div>
	                                         <label for="bizBeginTime" class="col-sm-1 col-form-label text-center">영업시간</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="bizBeginTime" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizDetail.bizBeginTime}">
	                                        </div>
	                                        
	                                    </div>
	                                    <div class="form-group row">
	                                        <label for="bizClosedDay" class="col-sm-1 col-form-label text-center">휴무일</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="bizClosedDay" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizDetail.bizClosedDay}">
	                                        </div>
	                                        <label for="bizClosedDay" class="col-sm-1 col-form-label text-center">고객센터번호</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="bizClosedDay" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizDetail.bizClosedDay}">
	                                        </div>
	                                    </div>
	                                    <div class="form-group row">
	                                        <label for="bizFax" class="col-sm-1 col-form-label text-center">팩스</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="bizFax" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizDetail.bizFax}">
	                                        </div>
	                                        <label for="network" class="col-sm-1 col-form-label text-center">지원통신망</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="network" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizDetail.network}">
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
														<c:forEach var="list" items="${bizList}" varStatus="status">
															<tr>
																<td>${status.count}</td>
																<td>${list.planName}</a></td>
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
                            		</form>
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