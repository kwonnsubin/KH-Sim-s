<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 리스트</title>
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
													<h5 class="m-b-10">공지사항관리</h5>
												</div>
												<ul class="breadcrumb">
													<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/admin/dashboard"><i class="feather icon-home"></i></a></li>
													<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/admin/noticeList/"><i class="breadcrumb-item"></i>공지사항 관리</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
										<input class="btn btn-primary right" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/noticeWrite'" value="작성">
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
																<option value="title" <c:if test="${searchOption eq 'title' }">selected</c:if>>제목</option>
																<option value="writer" <c:if test="${searchOption eq 'writer' }">selected</c:if>>작성자</option>
																<option value="content" <c:if test="${searchOption eq 'content' }">selected</c:if>>내용</option>
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
												<table class="table table-hover text-center">
													<thead>
														<tr>
															<th width="10%">번호</th>
															<th width="50%">제목</th>
															<th width="20%">작성자</th>
															<th width="20%">작성일</th>
														</tr>
													</thead>
													<tbody>
														<c:if test="${empty requestScope.paging.page}">
	            											<tr>
	            												<td colspan="6" class="text-center">검색 결과가 없습니다.</td>
	            											</tr>
	            										</c:if>
														<c:forEach var="list" items="${requestScope.paging.page}" varStatus="status">
															<tr>
																<td>${paging.totalRowCount - (paging.currentPage-1) * paging.pageLimit - status.index}</td>
																<td><a href="<%=request.getContextPath()%>/admin/noticeDetail/${list.ntcNo}">${list.ntcTitle}</a></td>
																
																<td>${list.adminId}</td>
																<td><fmt:formatDate value="${list.ntcDate}" pattern="yyyy.MM.dd"/> </td>
															</tr>
														</c:forEach>
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
																 href="${path}/admin/noticeList?p=${requestScope.paging.prevPage }&searchOption=${searchOption }&searchBox=${searchBox }">prev</a></li>
															</c:otherwise>
														</c:choose>
														<c:forEach var="pNum" items="${requestScope.paging.pageList }">
															<li class="page-item ${pNum eq pageNumber ? 'active' : '' }"><a class="page-link" 
															href="${path}/admin/noticeList?p=${pNum }&searchOption=${searchOption }&searchBox=${searchBox }">${pNum }</a></li>
														</c:forEach>
														<c:choose>
															<c:when test="${requestScope.paging.nextPage eq -1 }">
																<li class="page-item disabled"><a class="page-link">next</a></li>
															</c:when>
															<c:otherwise>
																<li class="page-item"><a class="page-link"
																 href="${path}/admin/noticeList?p=${requestScope.paging.nextPage }&searchOption=${searchOption }&searchBox=${searchBox }">next</a></li>
															</c:otherwise>
														</c:choose>
													</ul>
												</c:if>
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