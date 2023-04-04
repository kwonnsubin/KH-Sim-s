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
													<h5 class="m-b-10">통신사 관리</h5>
												</div>
												<ul class="breadcrumb">
													<li class="breadcrumb-item"><a href=""><i class="feather icon-home"></i></a></li>
													<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/admin/applyList"><i class="breadcrumb-item"></i>통신사 관리</a></li>
													<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/admin/bizPlanApplyList"><i class="breadcrumb-item"></i>통신사 요금제 가입신청</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
									</div>
									<div class="card">
										<div class="card-body">
											<form id="searchForm" name="searchForm" action="<%=request.getContextPath()%>/admin/noticeList" method="post">
												<div class="row">
													<div class="col-sm-12">
														<div class="input-group">
															<label class="floating-label"></label>
															<select class="" name="searchOption">
																<option value="">선택</option>
																<option value="title" <c:if test="${searchOption eq 'name' }">selected</c:if>>요금제명</option>
																<option value="writer" <c:if test="${searchOption eq 'enabled' }">selected</c:if>>신청상태</option>
																<option value="content" <c:if test="${searchOption eq 'writer' }">selected</c:if>>신청자</option>
															</select>
															<input class="form-control" type="text" name="searchBox" value="${searchBox}">
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
															<th>요금제명</th>
															<th>신청상태</th>
															<th>신청자</th>
															<th>신청일</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="list" items="${bizPlanApplyList}" varStatus="status">
															<tr>
																<td><a href="<%=request.getContextPath()%>/admin/bizPlanApplyDetail/${list.orderNo}">${list.orderNo}</a></td>
																<td>${list.planName}</a></td>
																<td><c:choose>
																		<c:when test="${list.enable eq 0}"> 신청 중 </c:when>
																		<c:when test="${list.enable eq 1}"> 승인 </c:when>
																		<c:when test="${list.enable eq 2}"> 탈퇴 </c:when>
																	</c:choose>
																</td>
																<td>${list.userId}</a></td>
																<td><fmt:formatDate value="${list.orderDate}" pattern="yyyy.MM.dd"/> </td>
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
<jsp:include page="../include/footer.jsp" />

</body>
</html>