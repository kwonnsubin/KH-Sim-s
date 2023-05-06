<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통신사 요금제 가입 신청 리스트</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/include/header.jsp" />
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
													<h5 class="m-b-10">통신사 관리</h5>
												</div>
												<ul class="breadcrumb">
													<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/admin/dashboard"><i class="feather icon-home"></i></a></li>
													<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/admin/applyList"><i></i>통신사 관리</a></li>
													<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/admin/bizPlanApplyList"><i></i>통신사 요금제 가입 정보</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<form id="searchForm" name="searchForm" action="<%=request.getContextPath()%>/admin/bizPlanApplyList" method="post">
									<%-- <input type="hidden" name="currentPage" value="${currentPage}"/> --%>
									<div class="col-md-12">
										<div class="card">
											<div class="card-body">
												<div class="row">
													<div class="col-sm-12">
														<div class="input-group">
															<label class="floating-label"></label>
															<select class="" name="searchOption">
																<option value="">선택</option>
																<option value="planName" <c:if test="${searchOption eq 'planName' }">selected</c:if>>요금제명</option>
																<option value="userId" <c:if test="${searchOption eq 'userId' }">selected</c:if>>신청자</option>
																<option value="bizName" <c:if test="${searchOption eq 'bizName' }">selected</c:if>>통신사명</option>
															</select>
															<input class="form-control" type="text" name="searchBox" value="${searchBox}">
															<div class="col-sm-5 p-t-10">
																<div class="custom-control custom-radio custom-control-inline">
								                                    <input type="radio" id="customRadioInline1" name="searchRadioVal" class="custom-control-input" value="total" <c:if test="${searchRadioVal eq 'total' }">checked</c:if>>
								                                    <label class="custom-control-label" for="customRadioInline1">전체</label>
								                                </div>
								                                <div class="custom-control custom-radio custom-control-inline">
								                                    <input type="radio" id="customRadioInline2" name="searchRadioVal" class="custom-control-input" value="1" <c:if test="${searchRadioVal eq '1' }">checked</c:if>>
								                                    <label class="custom-control-label" for="customRadioInline2">신청 완료</label>
								                                </div>
								                                <div class="custom-control custom-radio custom-control-inline">
								                                    <input type="radio" id="customRadioInline4" name="searchRadioVal" class="custom-control-input" value="2" <c:if test="${searchRadioVal eq '2' }">checked</c:if>>
								                                    <label class="custom-control-label" for="customRadioInline4">승인 완료</label>
								                                </div>
								                                <div class="custom-control custom-radio custom-control-inline">
								                                    <input type="radio" id="customRadioInline5" name="searchRadioVal" class="custom-control-input" value="3" <c:if test="${searchRadioVal eq '3' }">checked</c:if>>
								                                    <label class="custom-control-label" for="customRadioInline5">승인 보류</label>
								                                </div>
															</div>
															<div class="input-group-append"> 
																<button class="btn  btn-primary" type="submit">검색</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="card">
											<div class="card-body table-border-style">
												<div class="table-responsive">
													<table class="table table-hover text-center">
														<thead>
															<tr>
																<th>번호</th>
																<th>신청자</th>
																<th>통신사명</th>
																<th>요금제명</th>
																<th>신청상태</th>
																<th>신청일</th>
															</tr>
														</thead>
														<tbody>
															<c:if test="${empty requestScope.paging.page}">
											            		<tr>
											            			<td colspan="6" class="text-center">검색 결과가 없습니다.</td>
											            		</tr>
											            	</c:if>
											            	<c:if test="${not empty requestScope.paging.page}">
																<c:forEach var="list" items="${requestScope.paging.page}" varStatus="status">
																	<tr>
																		<td>${paging.totalRowCount - (paging.currentPage-1) * paging.pageLimit - status.index}</td>
																		<%-- <td><a href="<%=request.getContextPath()%>/admin/bizPlanApplyDetail/${list.orderNo}?divCheck=${divCheck}">${list.orderNo}</a></td> --%>
																		<td><a href="<%=request.getContextPath()%>/admin/bizPlanApplyDetail/${list.orderNo}">${list.userId}</a></td>
																		<td>${list.bizName}</td>
																		<td>${list.planName}</td>
																		<td>
																			<c:choose>
																				<c:when test="${list.orderStatus eq '1'.charAt(0)}"> 신청 완료 </c:when>
																				<c:when test="${list.orderStatus eq '2'.charAt(0)}"> 승인 완료 </c:when>
																				<c:otherwise>승인 보류</c:otherwise>
																			</c:choose>
																		</td>
																		<td><fmt:formatDate value="${list.orderDate}" pattern="yyyy.MM.dd"/> </td>
																	</tr>
																</c:forEach>
															</c:if>
														</tbody>
													</table>
												</div>
												<nav aria-label="Page navigation example">
													<c:if test="${not empty requestScope.paging.page}">
														<ul class="pagination justify-content-center">
															<c:set var="pageNumber" value="${empty param.p ? 1 : param.p }" />
															<c:choose>
																<c:when test="${requestScope.paging.prevPage eq -1 }">
																	<li class="page-item disabled"><a class="page-link">prev</a></li>
																</c:when>
																<c:otherwise>
																	<li class="page-item"><a class="page-link"
																	 href="${path}/admin/bizPlanApplyList?p=${requestScope.paging.prevPage }&searchOption=${searchOption }&searchRadioVal=${searchRadioVal }&searchBox=${searchBox}">prev</a></li>
																</c:otherwise>
															</c:choose>
															<c:forEach var="pNum" items="${requestScope.paging.pageList }">
																<li class="page-item ${pNum eq pageNumber ? 'active' : '' }"><a class="page-link" 
																href="${path}/admin/bizPlanApplyList?p=${pNum }&searchOption=${searchOption }&searchRadioVal=${searchRadioVal }&searchBox=${searchBox}">${pNum }</a></li>
															</c:forEach>
															<c:choose>
																<c:when test="${requestScope.paging.nextPage eq -1 }">
																	<li class="page-item disabled"><a class="page-link">next</a></li>
																</c:when>
																<c:otherwise>
																	<li class="page-item"><a class="page-link"
																	 href="${path}/admin/bizPlanApplyList?p=${requestScope.paging.nextPage }&searchOption=${searchOption }&searchRadioVal=${searchRadioVal }&searchBox=${searchBox}">next</a></li>
																</c:otherwise>
															</c:choose>
														</ul>
													</c:if>
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
<jsp:include page="/WEB-INF/views/admin/include/footer.jsp" />

</body>
</html>