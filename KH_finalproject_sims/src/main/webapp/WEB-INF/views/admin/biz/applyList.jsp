<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통신사 가입 신청 리스트</title>
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
													<li class="breadcrumb-item"><a href=""><i class="<%=request.getContextPath()%>/admin/applyList"></i>통신사 관리</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="card">
										<div class="card-body">
											<form id="searchForm" name="searchForm" action="<%=request.getContextPath()%>/admin/applyList" method="post">
												<div class="row">
													<div class="col-sm-12">
														<div class="input-group">
															<label class="floating-label"></label>
															<select class="" name="searchOption">
																<option value="">선택</option>
																<option value="bizName" <c:if test="${searchOption eq 'bizName' }">selected</c:if>>업체명</option>
																<option value="bizOwnerName" <c:if test="${searchOption eq 'bizOwnerName' }">selected</c:if>>대표자</option>
															</select>
															<input class="form-control" type="text" name="searchBox" value="${searchBox}">
															<div class="col-sm-5 p-t-10">
																<div class="custom-control custom-radio custom-control-inline">
								                                    <input type="radio" id="customRadioInline1" name="searchRadioVal" class="custom-control-input" value="total" <c:if test="${searchRadioVal ne 'enable' }">checked</c:if>>
								                                    <label class="custom-control-label" for="customRadioInline1">전체</label>
								                                </div>
								                                <div class="custom-control custom-radio custom-control-inline">
								                                    <input type="radio" id="customRadioInline2" name="searchRadioVal" class="custom-control-input" value="enable" <c:if test="${searchRadioVal eq 'enable' }">checked</c:if>>
								                                    <label class="custom-control-label" for="customRadioInline2">승인</label>
								                                </div>
								                                <div class="custom-control custom-radio custom-control-inline">
								                                    <input type="radio" id="customRadioInline4" name="searchRadioVal" class="custom-control-input" value="enable" <c:if test="${searchRadioVal eq 'enable' }">checked</c:if>>
								                                    <label class="custom-control-label" for="customRadioInline4">반려</label>
								                                </div>
								                                <div class="custom-control custom-radio custom-control-inline">
								                                    <input type="radio" id="customRadioInline5" name="searchRadioVal" class="custom-control-input" value="enable" <c:if test="${searchRadioVal eq 'enable' }">checked</c:if>>
								                                    <label class="custom-control-label" for="customRadioInline5">신청 중</label>
								                                </div>
								                                <div class="custom-control custom-radio custom-control-inline">
								                                    <input type="radio" id="customRadioInline6" name="searchRadioVal" class="custom-control-input" value="enable" <c:if test="${searchRadioVal eq 'enable' }">checked</c:if>>
								                                    <label class="custom-control-label" for="customRadioInline6">탈퇴 회원</label>
								                                </div>
															</div>
															<div class="input-group-append"> 
																<button class="btn  btn-primary" type="submit">검색</button>
															</div>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
									<div class="card">
										<div class="card-body table-border-style">
											<div class="table-responsive">
												<table class="table table-hover">
													<thead>
														<tr>
															<th>번호</th>
															<th>업체명</th>
															<th>대표자</th>
															<!-- <th>신청상태</th> -->
															<th>신청일</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="list" items="${applyList}" varStatus="status">
															<tr>
																<td>${status.count}</td>
																	<c:set var="divCheck" value="apply"/>
																	<c:if test="${list.enable eq '1' }">
																		<c:set var="divCheck" value="detail"/>
																	</c:if>
																<td><a href="<%=request.getContextPath()%>/admin/applyDetail/${list.bizId}?divCheck=${divCheck}">${list.bizName}</a></td>
																<td><a href="<%=request.getContextPath()%>/admin/applyDetail/${list.bizId}?divCheck=${divCheck}">${list.bizOwnerName}</a></td>
																<%-- <td>
																	<c:choose>
																		<c:when test="${list.enable eq '0'}"> 인증 전 </c:when>
																		<c:when test="${list.enable eq '1'}"> 인증 완료 </c:when>
																		<c:when test="${list.enable eq '3'}"> 반려</c:when>
																		<c:otherwise>탈퇴</c:otherwise>
																	</c:choose>
																</td> --%>
																<td><fmt:formatDate value="${list.writeDate}" pattern="yyyy.MM.dd"/> </td>
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
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/admin/include/footer.jsp" />

</body>
</html>