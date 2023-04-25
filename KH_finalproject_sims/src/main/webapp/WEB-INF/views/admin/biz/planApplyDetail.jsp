<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    	
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통신사 가입신청서 내역</title>
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
												<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/admin/dashboard"><i class="feather icon-home"></i></a></li>
												<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/admin/applyList"><i class="breadcrumb-item"></i>통신사 관리</a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>통신사 
													<c:choose>
														<c:when test="${cmd eq 'read' }"> 개통신청 상세 정보</c:when>
														<c:otherwise> 수정</c:otherwise>
													</c:choose>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<form action="<%=request.getContextPath()%>/admin/updateUserStatus" method="post">
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
										<input class="btn btn-primary right m-l-10" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/bizPlanApplyList'" value="목록">
									</div>
								</div>
							 <div class="col-sm-12">
	                		 	<div class="card">
	                    			<div class="card-header">
	                        	 		<h5>개통 신청 상세정보</h5>
	                    			</div>
	                    				<div class="card-body">
		                                	<div class="form-group row">
		                                    	<label for="orderNo" class="col-sm-1 col-form-label text-center">신청번호</label>
		                                        <div class="col-sm-1">
		                                            <input type="text" class="form-control"  name="orderNo" readonly value="${bizPlanApplyDetail.orderNo}">
		                                        </div>
		                                        <label for="planName" class="col-sm-1 col-form-label text-center">요금제명</label>
		                                        <div class="col-sm-3">
		                                            <input type="text" class="form-control"  name="planName" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.planName}">
		                                        </div>
		                                        <label for="userId" class="col-sm-1 col-form-label text-center">회원아이디</label>
		                                        <div class="col-sm-2">
		                                            <input type="text" class="form-control"  name="userId" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.userId}">
		                                        </div>
		                                        <label for="userName" class="col-sm-1 col-form-label text-center">이름</label>
		                                        <div class="col-sm-2">
		                                            <input type="text" class="form-control"  name="userName" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.userName}">
		                                        </div>
		                                    </div>
		                           			<div class="form-group row">
		                                        <label for="orderDate" class="col-sm-1 col-form-label text-center">신청일자</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="orderDate" <c:if test="${cmd eq 'read' }">readonly</c:if> value="<fmt:formatDate value="${bizPlanApplyDetail.orderDate}" pattern="yyyy.MM.dd"/>">
		                                        </div>
		                                         <label for="userSsn" class="col-sm-1 col-form-label text-center">주민등록번호</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="userSsn" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.userSsn}">
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="userPhone" class="col-sm-1 col-form-label text-center">휴대폰 번호</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="userPhone" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.userPhone}">
		                                        </div>
		                                        <label for="userPhone" class="col-sm-1 col-form-label text-center">주소</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="userPhone" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.userPhone}">
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="userEmail" class="col-sm-1 col-form-label text-center">이메일</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="userEmail" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.userEmail}">
		                                        </div>
		                                        <label for="joinCategory" class="col-sm-1 col-form-label text-center">가입 유형</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="joinCategory" <c:if test="${cmd eq 'read' }">readonly</c:if>                                          
		                                             <c:choose>
															<c:when test="${bizPlanApplyDetail.joinCategory eq '1'.charAt(0)}">value="번호 이동" </c:when>
															<c:otherwise>value="신규 가입"</c:otherwise>
													 </c:choose>
		    										 <%-- value="${bizPlanApplyDetail.joinCategory}" --%>
		    										 >
				                                </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="simYn" class="col-sm-1 col-form-label text-center">유심 신청 여부</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="simYn" <c:if test="${cmd eq 'read' }">readonly</c:if>
		                                       		<c:choose>
															<c:when test="${bizPlanApplyDetail.simYn eq '1'.charAt(0)}">value="없어요" </c:when>
															<c:otherwise>value="가지고 있어요"</c:otherwise>
													 </c:choose>
													 >
		                                        </div>
		                                        <label for="simType" class="col-sm-1 col-form-label text-center">심 종류</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="simType" <c:if test="${cmd eq 'read' }">readonly</c:if>
		                                       		<c:choose>
															<c:when test="${bizPlanApplyDetail.simType eq '1'.charAt(0)}">value="일반유심" </c:when>
															<c:otherwise>value="NFC유심"</c:otherwise>
													 </c:choose>
													 >
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="currentTelecom" class="col-sm-1 col-form-label text-center">현재 사용 통신사</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="currentTelecom" <c:if test="${cmd eq 'read' }">readonly</c:if>
		                                            <c:choose>
															<c:when test="${bizPlanApplyDetail.currentTelecom eq '1'.charAt(0)}">value="SKT" </c:when>
															<c:when test="${bizPlanApplyDetail.currentTelecom eq '2'.charAt(0)}">value="KT" </c:when>
															<c:when test="${bizPlanApplyDetail.currentTelecom eq '3'.charAt(0)}">value="LGU+" </c:when>
															<c:when test="${bizPlanApplyDetail.currentTelecom eq '4'.charAt(0)}">value="SKT알뜰폰" </c:when>
															<c:when test="${bizPlanApplyDetail.currentTelecom eq '5'.charAt(0)}">value="KT알뜰폰" </c:when>
															<c:otherwise>value="LGU+알뜰폰"</c:otherwise>
													 </c:choose>
													 >
		                                        </div>
		                                        <label for="planBill" class="col-sm-1 col-form-label text-center">청구서 유형</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="planBill" <c:if test="${cmd eq 'read' }">readonly</c:if>
		                                            <c:choose>
															<c:when test="${bizPlanApplyDetail.simType eq '1'.charAt(0)}">value="문자" </c:when>
															<c:otherwise>value="이메일"</c:otherwise>
													 </c:choose>
													 >
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="planPay" class="col-sm-1 col-form-label text-center">요금 납부 방법</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="planPay" <c:if test="${cmd eq 'read' }">readonly</c:if>
		                                            <c:choose>
															<c:when test="${bizPlanApplyDetail.simType eq '1'.charAt(0)}">value="카드" </c:when>
															<c:otherwise>value="계좌이체"</c:otherwise>
													 </c:choose>
													 > 
		                                        </div>
		                                        <label for="cardNumber" class="col-sm-1 col-form-label text-center">카드 번호</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="cardNumber" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.cardNumber}">
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="planPay" class="col-sm-1 col-form-label text-center">예금주명</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="planPay" <c:if test="${cmd eq 'read' }">readonly</c:if>
		                                            <c:choose>
															<c:when test="${bizPlanApplyDetail.simType eq '1'.charAt(0)}">value="카드" </c:when>
															<c:otherwise>value="계좌이체"</c:otherwise>
													 </c:choose>
													 > 
		                                        </div>
		                                        <label for="cardNumber" class="col-sm-1 col-form-label text-center">예금주 주민등록번호</label>
		                                        <div class="col-sm-5">
		                                            <input type="text" class="form-control"  name="cardNumber" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.cardNumber}">
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="cardExpiration" class="col-sm-1 col-form-label text-center">유효기간</label>
		                                        <div class="col-sm-3">
		                                            <input type="text" class="form-control"  name="cardExpiration" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.cardExpiration}">
		                                        </div>
		                                        <label for="bank" class="col-sm-1 col-form-label text-center">은행</label>
		                                        <div class="col-sm-3">
		                                            <input type="text" class="form-control"  name="bank" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.bank}">
		                                        </div>
		                                        <label for="bankNumber" class="col-sm-1 col-form-label text-center">계좌번호</label>
		                                        <div class="col-sm-3">
		                                            <input type="text" class="form-control"  name="bankNumber" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.bankNumber}">
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="netName" class="col-sm-1 col-form-label text-center">통신망</label>
		                                        <div class="col-sm-3">
		                                            <input type="text" class="form-control"  name="netName" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.netName}">
		                                        </div>
		                                        <label for="genName" class="col-sm-1 col-form-label text-center">이동통신세대</label>
		                                        <div class="col-sm-3">
		                                            <input type="text" class="form-control"  name="genName" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.genName}">
		                                        </div>
		                                        <label for="orderPrice" class="col-sm-1 col-form-label text-center">가입 기본료</label>
		                                        <div class="col-sm-3">
		                                            <input type="text" class="form-control"  name="orderPrice" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.orderPrice}">
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="orderData" class="col-sm-1 col-form-label text-center">가입 데이터</label>
		                                        <div class="col-sm-3">
		                                            <input type="text" class="form-control"  name="orderData" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.orderData}">
		                                        </div>
		                                        <label for="orderVoice" class="col-sm-1 col-form-label text-center">가입 음성</label>
		                                        <div class="col-sm-3">
		                                            <input type="text" class="form-control"  name="orderVoice" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.orderVoice}">
		                                        </div>
		                                        <label for="orderMessage" class="col-sm-1 col-form-label text-center">가입 문자</label>
		                                        <div class="col-sm-3">
		                                            <input type="text" class="form-control"  name="orderMessage" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${bizPlanApplyDetail.orderMessage}">
		                                        </div>
		                                    </div>
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
		
<jsp:include page="../include/footer.jsp" />

</body>
</html>