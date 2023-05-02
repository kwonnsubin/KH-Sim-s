<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내역 리스트</title>
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
													<h5 class="m-b-10">문의내역관리</h5>
												</div>
												<ul class="breadcrumb">
													<li class="breadcrumb-item"><a href=""><i class="feather icon-home"></i></a></li>
													<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>문의내역 관리</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="card">
										<div class="card-body">
											<form action="<%=request.getContextPath()%>/admin/qna/list" method="post">
												<div class="row">
													<div class="col-sm-12">
														<div class="input-group">
															<label class="floating-label"></label>
															<select class="" name="searchType">
																<option value="">선택</option>
																<option value="title" <c:if test="${searchType eq 'title' }">selected</c:if>>제목</option>
																<option value="writer" <c:if test="${searchType eq 'writer' }">selected</c:if>>작성자</option>
																<option value="content" <c:if test="${searchType eq 'content' }">selected</c:if>>내용</option>
															</select>
															<input class="form-control" type="text" name="keyword" value="${keyword}">
															<div class="input-group-append">
																<button class="btn  btn-primary" type="submit" id="search-btn">검색</button>
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
														<tr class="text-center">
															<th>번호</th>
															<th>제목</th>
															<th>작성자</th>
															<th>작성일</th>
															<th>조회수</th>
															<th>답변</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="qna" items="${requestScope.paging.page}" varStatus="status">
															<tr>
																<td class="text-center">${paging.totalRowCount - ((paging.currentPage-1) * 10 + status.index)}&nbsp;&nbsp;</td>
																<td>
																	<a href="<%=request.getContextPath()%>/admin/qna/detail/${qna.aqNo}" style="font-weight: bold;">${qna.aqTitle}</a>
																	<jsp:useBean id="now" class="java.util.Date" />
																	<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowTime" scope="request"/>
																	<fmt:parseNumber value="${qna.aqDate.time / (1000*60*60*24)}" integerOnly="true" var="aqDateTime" scope="request"/>
																	<c:if test="${nowTime - aqDateTime <= 3}">
																		<img src="<%=request.getContextPath()%>/resources/img/admin/new.png" width="12px" alt="new" />
																	</c:if>
																</td>
																<td class="text-center">${qna.userId}</td>
																<td class="text-center"><fmt:formatDate value="${qna.aqDate}" pattern="yyyy.MM.dd"/></td>
																<td class="text-center">${qna.aqViews}</td>
																<td class="text-center">${qna.aqAnswers}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
											<!-- 페이지 번호 {s} -->
											<nav aria-label="Page navigation example">
												<ul class="pagination justify-content-center">
													<c:set var="pageNumber" value="${empty param.p ? 1 : param.p }" />
													<c:choose>
														<c:when test="${requestScope.paging.prevPage eq -1 }">
															<li class="page-item disabled"><a class="page-link">prev</a></li>
														</c:when>
														<c:otherwise>
															<li class="page-item"><a class="page-link"
															 href="${path}/admin/qna/list?p=${requestScope.paging.prevPage }">prev</a></li>
														</c:otherwise>
													</c:choose>
													<c:forEach var="pNum" items="${requestScope.paging.pageList }">
														<li class="page-item ${pNum eq pageNumber ? 'active' : '' }"><a class="page-link" 
														href="${path}/admin/qna/list?p=${pNum }">${pNum }</a></li>
													</c:forEach>
													<c:choose>
														<c:when test="${requestScope.paging.nextPage eq -1 }">
															<li class="page-item disabled"><a class="page-link">next</a></li>
														</c:when>
														<c:otherwise>
															<li class="page-item"><a class="page-link"
															 href="${path}/admin/qna/list?p=${requestScope.paging.nextPage }">next</a></li>
														</c:otherwise>
													</c:choose>
												</ul>
											</nav>
											<!-- 페이지 번호 {e} -->
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