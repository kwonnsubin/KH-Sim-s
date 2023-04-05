<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 관리 리스트</title>
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
													<h5 class="m-b-10">사용자 관리</h5>
												</div>
												<ul class="breadcrumb">
													<li class="breadcrumb-item"><a href=""><i class="feather icon-home"></i></a></li>
													<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>사용자 관리</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="card">
										<div class="card-body">
											<form id="searchForm" name="searchForm" action="<%=request.getContextPath()%>/admin/userList" method="post">
												<div class="row">
													<div class="col-sm-12">
														<div class="input-group">
															<label class="col-sm-1 col-form-label">아이디</label>
															<div class="col-sm-2">
																<input class="form-control" type="text" name="searchUserId" value="${searchUserId}">
															</div>
															<label class="col-sm-1 col-form-label">이름</label>
															<div class="col-sm-2">
																<input class="form-control" type="text" name="searchUserName" value="${searchUserName}">
															</div>
															<div class="col-sm-5 p-t-10">
																<div class="custom-control custom-radio custom-control-inline">
								                                    <input type="radio" id="customRadioInline1" name="searchRadioVal" class="custom-control-input" value="total" <c:if test="${searchRadioVal ne 'enbale' }">checked</c:if>>
								                                    <label class="custom-control-label" for="customRadioInline1">전체</label>
								                                </div>
								                                <div class="custom-control custom-radio custom-control-inline">
								                                    <input type="radio" id="customRadioInline2" name="searchRadioVal" class="custom-control-input" value="enable" <c:if test="${searchRadioVal eq 'enable' }">checked</c:if>>
								                                    <label class="custom-control-label" for="customRadioInline2">탈퇴 회원</label>
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
															<th>아이디</th>
															<th>이름</th>
															<th>메일</th>
															<th>전화번호</th>
															<th>가입일</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="list" items="${userList}" varStatus="status">
															<tr>
																<td>${status.count}</td>
																<td><a href="<%=request.getContextPath()%>/admin/userDetail/${list.userId}">${list.userId}</a></td>
																<td>${list.userName}</td>
																<td>${list.userEmail}</td>
																<td>${list.userPhone}</td>
																<td><fmt:formatDate value="${list.userWrdate}" pattern="yyyy.MM.dd"/> </td>
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