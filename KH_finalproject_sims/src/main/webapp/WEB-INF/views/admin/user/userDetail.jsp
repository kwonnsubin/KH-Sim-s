<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자의 사용자 관리 상세</title>
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
												<h5 class="m-b-10">사용자 관리
													<c:choose>
														<c:when test="${cmd eq 'read' }"> 상세</c:when>
														<c:otherwise> 수정</c:otherwise>
													</c:choose>
												</h5>
											</div>
											<ul class="breadcrumb">
												<li class="breadcrumb-item"><a href=""><i class="feather icon-home"></i></a></li>
												<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/adminUser/userList/"><i class="breadcrumb-item"></i>사용자 관리</a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>사용자 관리 
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
										<input class="btn btn-primary right m-l-10" type="button" onclick="location.href='<%=request.getContextPath()%>/adminUser/userList'" value="목록">
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
                        				<h5>사용자 상세정보</h5>
                    				</div>
                    				<form>
                    				<div class="card-body">
	                                    <div class="form-group row">
	                                        <label for="userId" class="col-sm-1 col-form-label text-center">아이디</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="userId" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${userDetail.userId}">
	                                        </div>
	                                        <label for="userName" class="col-sm-1 col-form-label text-center">이름</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="userName" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${userDetail.userName}">
	                                        </div>
	                                    </div>
	                           			 <div class="form-group row">
	                                        <label for="userEmail" class="col-sm-1 col-form-label text-center">메일</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="userEmail" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${userDetail.userEmail}">
	                                        </div>
	                                         <label for="userGender" class="col-sm-1 col-form-label text-center">성별</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="userGender" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${userDetail.userGender}">
	                                        </div>
	                                        
	                                    </div>
	                                    <div class="form-group row">
	                                        <label for="userSsn" class="col-sm-1 col-form-label text-center">생년월일</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="userSsn" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${userDetail.userSsn}">
	                                        </div>
	                                        <label for="userPhone" class="col-sm-1 col-form-label text-center">전화번호</label>
	                                        <div class="col-sm-5">
	                                            <input type="text" class="form-control"  name="userPhone" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${userDetail.userPhone}">
	                                        </div>
	                                    </div>
	                                    <div class="form-group">
                                			<label for="userAddress" class="col-sm-1 col-form-label text-center">주소</label>
                                			<input type="text" class="form-control"  name="userAddress" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${userDetail.userAddress}">
                            			</div>
                            			<div class="form-group">
                                			<label for="userAddress2" class="col-sm-1 col-form-label text-center">상세 주소</label>
                                			<input type="text" class="form-control"  name="userAddress2" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${userDetail.userAddress}">
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