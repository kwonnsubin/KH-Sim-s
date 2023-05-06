<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    	
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<jsp:include page="../include/header.jsp" />
<script>
function fn_submitCheck(){
	var testCheck = $('input[name=enable]:checked').val();
	var html = "";
	if(testCheck == '1'){
		html = "승인";
	} else if (testCheck == '3') {
		html = "반려";
	}
	
	if (confirm(html + " 하시겠습니까?")) {
        $("#frm").submit();
    } else {
        alert("취소하셨습니다.");
    }
}

/* alert("warning")
	var title = document.forms[0].title.value;
	var reason = document.forms[0].reason.value;
function formCheck(){
	if(title==null || title==""){
		alert('입력하세요');
		document.forms[0].title.focus();
		return false;
	}
	if(reason==null || title==""){
		alert('입력하세요');
		document.forms[0].reason.focus();
		return false;
	}
}	 */
	
</script>
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
														<c:when test="${cmd eq 'read' }">신청 관리</c:when>
														<c:otherwise> 수정</c:otherwise>
													</c:choose>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div><!--confirm('승인하시겠습니까?')  -->
							<%-- <form action="<%=request.getContextPath()%>/admin/updateBizStatus" method="post" onsubmit="return confirm('승인하시겠습니까?');"> --%>
							<form action="<%=request.getContextPath()%>/admin/updateBizStatus" method="post" id="frm">
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
										<input class="btn btn-primary right m-l-10" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/applyList'" value="목록">
										<input class="btn btn-primary right" type="button" onclick="fn_submitCheck()" value="저장">
									</div>
								</div>
							
								<div class="row">
									 <div class="col-sm-8">
		                				<div class="card">
		                    				<div class="card-header">
		                        				<h5>통신사 신청 정보</h5>
		                    				</div>
		                    				<div class="card-body">
			                                    <div class="form-group row">
			                                        <label for="bizName" class="col-sm-2 col-form-label text-center">법인명</label>
			                                        <div class="col-sm-10">
			                                            <input type="text" class="form-control"  name="bizName" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizName}">
			                                        </div>
			                                    </div>
			                           			 <div class="form-group row">
			                                        <label for="bizSsn" class="col-sm-2 col-form-label text-center">법인 등록번호</label>
			                                        <div class="col-sm-10">
			                                            <input type="text" class="form-control"  name="bizSsn" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizSsn}">
			                                        </div>
			                                    </div>
			                           			 <div class="form-group row">
			                                        <label for="bizCrn" class="col-sm-2 col-form-label text-center">사업자등록번호</label>
			                                        <div class="col-sm-10">
			                                            <input type="text" class="form-control"  name="bizCrn" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizCrn}">
			                                        </div>
			                                    </div>
			                           			 <div class="form-group row">
			                                         <label for="bizId" class="col-sm-2 col-form-label text-center">아이디</label>
			                                        <div class="col-sm-10">
			                                            <input type="text" class="form-control"  name="bizId" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizId}">
			                                        </div>
			                                        
			                                    </div>
			                                    <div class="form-group row">
			                                        <label for="bizEmail" class="col-sm-2 col-form-label text-center">이메일</label>
			                                        <div class="col-sm-10">
			                                            <input type="text" class="form-control"  name="bizEmail" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizEmail}">
			                                        </div>
			                                    </div>
			                           			 <div class="form-group row">
			                                        <label for="bizPhone" class="col-sm-2 col-form-label text-center">전화</label>
			                                        <div class="col-sm-10">
			                                            <input type="text" class="form-control"  name="bizPhone" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${applyDetail.bizPhone}">
			                                        </div>
			                                    </div>
			                           			 <div class="form-group row">
			                                        <label for="enableDetail" class="col-sm-2 col-form-label text-center">신청상태</label>
			                                        <div class="col-sm-10">
			                                            <input type="text" class="form-control"  name="enableDetail" <c:if test="${cmd eq 'read' }">readonly</c:if> 
			                                            	<c:choose>
																<c:when test="${applyDetail.enable eq '0'}">value="인증 전" </c:when>
																<c:when test="${applyDetail.enable eq '1'}">value="인증 완료" </c:when>
																<c:when test="${applyDetail.enable eq '3'}">value="반려" </c:when>
																<c:otherwise>value="탈퇴"</c:otherwise>
															</c:choose>
			                                            >
			                                        </div>
			                                    </div>
		                            		</div>	
										</div>
									</div>
									 <div class="col-sm-4">
		                				<div class="card">
		                    				<div class="card-header">
		                        				<h5>검토결과</h5>
		                    				</div>
			                    			<div class="card-body">
			                    				<div class="row">
			                    					<div class="col-md-12 pagination justify-content-center">
				                    					<div class="custom-control custom-radio custom-control-inline">
				                    						<input type="radio" class="custom-control-input" name="enable" id="enable1" value="1" <c:if test="${applyDetail.enable eq '1'}">checked</c:if>>
				                    						<label class="custom-control-label" for="enable1">승인</label>
				                    					</div>
				                    					<%-- <div class="custom-control custom-radio custom-control-inline">
				                    						<input type="radio" class="custom-control-input" name="enable" id="enable2" value="2" <c:if test="${applyDetail.enable eq '2'}">checked</c:if>>
				                    						<label class="custom-control-label" for="enable2">탈퇴</label>
				                    					</div> --%>
				                    					<div class="custom-control custom-radio custom-control-inline">
				                    						<input type="radio" class="custom-control-input" name="enable" id="enable3" value="3" <c:if test="${applyDetail.enable eq '3'}">checked</c:if>>
				                    						<label class="custom-control-label" for="enable3">반려</label>
				                    					</div>
			                    					</div>
			                    				</div>
			                    				<div class="row">
			                    					<div class="col-md-12">
			                    						<h5>검토의견</h5><hr><span></span>
			                    						<textarea class="form-control" aria-label="with textarea" name="opinion"  required style= height:360px;resize:none;>${applyDetail.opinion }</textarea>
			                    						<%-- <textarea class="col-md-12 bg-light p-4 mb-2" style="height:277px; resize:none; border:2px solid rgba(0, 0, 0, 0.15);" name="rvwOpinion">${applyDetail.opinion }</textarea> --%>
			                    					</div>
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
	</div>s
</div>
		
<jsp:include page="../include/footer.jsp" />

</body>
</html>