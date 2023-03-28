<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 붙여야 <form method="post"> 작동함 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내역 상세페이지</title>
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
												<h5 class="m-b-10">문의내역 상세</h5>
											</div>
											<ul class="breadcrumb">
												<li class="breadcrumb-item"><a href=""><i class="feather icon-home"></i></a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>문의내역 관리</a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>문의내역 상세</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
										<input class="btn btn-primary right m-l-10" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/qnadelete/${qnaDetail.aqNo}'" value="삭제">
										<input class="btn btn-primary right " type="button" onclick="location.href='<%=request.getContextPath()%>/admin/qna/list'" value="목록">
									</div>
								</div>
								<div class="card text-center">
									<div class="card-body">
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group">
	                                       			<input type="text" class="form-control" name="ntcTitle" value="${qnaDetail.aqTitle }" readonly>
	                                   			</div>
											</div>
											<!-- <div class="row"> -->
												<div class="col-sm-12">
					                                    <div class="form-group row">
					                                        <label for="adminId" class="col-sm-2 col-form-label left">작성자</label>
					                                        <div class="col-sm-2">
					                                            <input type="text" readonly class="form-control-plaintext" name="userId" value="${qnaDetail.userId }">
					                                        </div>
					                                        <label for="staticEmail" class="col-sm-2 col-form-label">작성일</label>
					                                        <div class="col-sm-2">
					                                            <input type="text" readonly class="form-control-plaintext" value="<fmt:formatDate value="${qnaDetail.aqDate}" pattern="yyyy.MM.dd"/>">
					                                        </div>
				                                       		<label for="adminId" class="col-sm-2 col-form-label left">조회수</label>
					                                        <div class="col-sm-2">
					                                            <input type="text" readonly class="form-control-plaintext" name="aqViews" value="${qnaDetail.aqViews }">
					                                        </div>
					                                    </div>
				                                </div>
			                                <!-- </div> -->
											<div class="col-sm-12">
												<div class="form-group">
			                                        <textarea class="form-control" name="ntcContent" rows="20" readonly>${qnaDetail.aqContent }</textarea>
			                                    </div>
											</div>
										</div>
									</div>
								</div>
								<!-- 답변 시작 -->
								<div class="card table-card review-card">
				                    <div class="card-header borderless">
				                        <div class="review-block">
					                        <h5>답글달기</h5>
					                    	<div class="form-group">
			                                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
			                                </div>
					                    </div>
										<div class="card-body pb-0">
					                        <div class="review-block">
					                        	<c:forEach var="ansList" items="${qnaAnsList }" >
						                            <div class="row"   style="padding-bottom: 0px;">
						                                <div class="col">
							                                <c:if test="${not empty ansList.adminId}">
							                                    <h6 class="m-b-15">${ansList.adminId }<span class="float-right f-13 text-muted">${ansList.aaDate }</span></h6>
							                               		 <p class="m-t-15 m-b-15 text-muted">${ansList.aaContent}</p>
																<a href="#!" class="badge badge-primary m-t-5 m-b-20" data-toggle="collapse" data-target="#collapseExample" aria-expanded="true" aria-controls="collapseExample">댓글</a>
																<div class="collapse show alert alert-secondary" id="collapseExample" style="">
																	<div class="card-body m-b-15 m-t-20">
																		<div class="form-group">
								                                       		 <textarea class="form-control m-b-20" id="exampleFormControlTextarea1" rows="3" placeholder="댓글을 입력해보세요."></textarea>
								                                       		 <a href="#!" class="m-r-30 text-muted text-muted">댓글 등록</a>
								                               			</div>
								                               			<div class="m-t-40">
								                               			<c:forEach var="replyList" items="${qnaReplyList }" >
										                                    <h6 class="m-b-15">${replyList.adminId }<span class="float-right f-13 text-muted">${replyList.rplDate }</span></h6>
										                               		 <p class="m-t-15 m-b-15 text-muted">${replyList.rplContent }</p>								                               			
								                               			</c:forEach>
								                               			</div>
																	</div>
																</div>
							                                </c:if>
							                                <c:if test="${not empty ansList.userId}">
						                                    	<h6 class="m-b-15">${ansList.userId }<span class="float-right f-13 text-muted">${ansList.aaDate }</span></h6>
						                                    	<p class="m-t-15 m-b-15 text-muted">${ansList.aaContent}</p>
						                                    </c:if>	
						                                </div>
						                            </div>
					                            </c:forEach>
					                        </div>
					                    </div>
				                    </div>
				                </div>
				              <!-- 답변 끝 -->
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