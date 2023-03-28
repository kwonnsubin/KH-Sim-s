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
								<!-- 답변  -->
								<!-- 댓글달기 -->
								<div class="form-group">
                                        <label for="exampleFormControlTextarea1">Example textarea</label>
                                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                </div>
								<div class="card table-card review-card">
				                    <div class="card-header borderless ">
				                        <h5>Customer Reviews</h5>
				                        <div class="card-header-right">
				                            <div class="btn-group card-option">
				                                <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				                                    <i class="feather icon-more-horizontal"></i>
				                                </button>
				                                <ul class="list-unstyled card-option dropdown-menu dropdown-menu-right">
				                                    <li class="dropdown-item full-card"><a href="#!"><span><i class="feather icon-maximize"></i> maximize</span><span style="display:none"><i class="feather icon-minimize"></i> Restore</span></a></li>
				                                    <li class="dropdown-item minimize-card"><a href="#!"><span><i class="feather icon-minus"></i> collapse</span><span style="display:none"><i class="feather icon-plus"></i> expand</span></a></li>
				                                    <li class="dropdown-item reload-card"><a href="#!"><i class="feather icon-refresh-cw"></i> reload</a></li>
				                                    <li class="dropdown-item close-card"><a href="#!"><i class="feather icon-trash"></i> remove</a></li>
				                                </ul>
				                            </div>
				                        </div>
				                    </div>
				                    <div class="card-body pb-0">
				                        <div class="review-block">
				                            <div class="row">
				                                <div class="col-sm-auto p-r-0">
				                                    <img src="assets/images/user/avatar-2.jpg" alt="user image" class="img-radius profile-img cust-img m-b-15">
				                                </div>
				                                <div class="col">
				                                    <h6 class="m-b-15">John Deo <span class="float-right f-13 text-muted"> a week ago</span></h6>
				                                    <a href="#!"><i class="feather icon-star-on f-18 text-c-yellow"></i></a>
				                                    <a href="#!"><i class="feather icon-star-on f-18 text-c-yellow"></i></a>
				                                    <a href="#!"><i class="feather icon-star-on f-18 text-c-yellow"></i></a>
				                                    <a href="#!"><i class="feather icon-star f-18 text-muted"></i></a>
				                                    <a href="#!"><i class="feather icon-star f-18 text-muted"></i></a>
				                                    <p class="m-t-15 m-b-15 text-muted">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
				                                    <a href="#!" class="m-r-30 text-muted"><i class="feather icon-thumbs-up m-r-15"></i>Helpful?</a>
				                                    <a href="#!"><i class="feather icon-heart-on text-c-red m-r-15"></i></a>
				                                    <a href="#!"><i class="feather icon-edit text-muted"></i></a>
				                                </div>
				                            </div>
				                            <div class="row">
				                                <div class="col-sm-auto p-r-0">
				                                    <img src="assets/images/user/avatar-4.jpg" alt="user image" class="img-radius profile-img cust-img m-b-15">
				                                </div>
				                                <div class="col">
				                                    <h6 class="m-b-15">Allina D’croze <span class="float-right f-13 text-muted"> a week ago</span></h6>
				                                    <a href="#!"><i class="feather icon-star-on f-18 text-c-yellow"></i></a>
				                                    <a href="#!"><i class="feather icon-star f-18 text-muted"></i></a>
				                                    <a href="#!"><i class="feather icon-star f-18 text-muted"></i></a>
				                                    <a href="#!"><i class="feather icon-star f-18 text-muted"></i></a>
				                                    <a href="#!"><i class="feather icon-star f-18 text-muted"></i></a>
				                                    <p class="m-t-15 m-b-15 text-muted">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
				                                    <a href="#!" class="m-r-30 text-muted"><i class="feather icon-thumbs-up m-r-15"></i>Helpful?</a>
				                                    <a href="#!"><i class="feather icon-heart-on text-c-red m-r-15"></i></a>
				                                    <a href="#!"><i class="feather icon-edit text-muted"></i></a>
				                                    <blockquote class="blockquote m-t-15 m-b-0">
				                                        <h6>Allina D’croze</h6>
				                                        <p class="m-b-0 text-muted">Lorem Ipsum is simply dummy text of the industry.</p>
				                                    </blockquote>
				                                </div>
				                            </div>
				                        </div>
				                    </div>
				                </div>
								<!--  댓글 리스트  -->
								<c:forEach var="ansList" items="qnaAnsList" >
												<div class="col-sm-12">
					                                    <div class="form-group row">
					                                        <label for="adminId" class="col-sm-2 col-form-label left">작성자</label>
					                                        <div class="col-sm-2">
					                                            <input type="text"  class="form-control-plaintext" name="userId">
					                                        </div>
					                                    </div>
				                              	</div>
				               </c:forEach>
				               <input type="text"  class="form-control-plaintext" name="userId">
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