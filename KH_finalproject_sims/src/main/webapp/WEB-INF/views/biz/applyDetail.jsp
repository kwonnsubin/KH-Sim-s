<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/biz/applyDetail.css"/>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/myinfo.css"/>
    
    <!-- google icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/biz/nav.jsp"/>


    <div class="titleMent">
    	<span class="material-symbols-outlined" style="float: left;">
		more_vert
		</span>
		<span>요금제 신청서 상세정보</span>
    </div>
    
    
    <div class="container-fluid">
    <table class="table" id="applyDetail" style="width: 61%; margin-top: 120px;">
		<tbody style="height: 485px;">
			<tr>
				<th scope="row" class="col-md-1">
					<span>신청번호</span>
				</th>
				<td class="col-md-2">${applyDetailPlan.orderNo }</td>
				<th scope="row" class="col-md-1">
					<span>요금제명</span>
				</th>
				<td class="col-md-2" colspan="2" >${applyDetailPlan.planName }</td>
                
                <th scope="row" class="col-md-1">
                    <span>신청일자</span>
                </th>
                <td class="col-md-2" colspan="2">${applyDetailPlan.orderDate }</td>
			</tr>
			
			<tr>
	            <th scope="row" >
	                <span>아이디</span>
	            </th>
	            <td colspan="2">${applyDetail.userId }</td>
	            <th scope="row">
	                <span>이름</span>
	            </th>
	            <td colspan="4">${applyDetail.userName }</td>
			
			
			</tr>
			
			<tr>
				<th scope="row" >
					<span>주민등록번호</span>
				</th>
				<td colspan="2">${applyDetail.userSsn }</td>
				<th scope="row" >
					<span>휴대폰번호</span>
				</th>
				<td colspan="4">${applyDetail.userPhone }</td>
			</tr>
			<tr>
				<th scope="row">
					<span>주소</span>
				</th>
				<td colspan="2">${applyDetail.userAddress }</td>
                <th scope="row">
                    <span>이메일</span>
                </th>
                <td colspan="4">${applyDetail.userEmail }</td>
			</tr>
			<!-- 분리 -->
			<tr>
				<th scope="row">
					<span>가입유형</span>
				</th>
				<td colspan="2">
				<c:choose>
					<c:when test= "${applyDetailPlan.joinCategory eq 1}">
						번호이동
					</c:when>
					<c:otherwise>
						신규가입
					</c:otherwise>
				</c:choose>
				</td>
				<th scope="row">
					<span>심종류</span>
				</th>
				<td colspan="4">
				<c:choose>
					<c:when test ="${applyDetailPlan.simType eq 1 }">
						일반유심
					</c:when>
					<c:otherwise>
						NFC 유심
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
            <tr>
				<th scope="row">
					<span>유심신청여부</span>
				</th>
				<td  colspan="2">
				<c:choose>
					<c:when test ="${applyDetailPlan.simYn eq 1}">
						N
					</c:when>
					<c:otherwise>
						Y
					</c:otherwise>
				</c:choose>
				</td>
				<th scope="row" style="width: 510px;">
					<span>현재사용통신사</span>
				</th>
				<td  colspan="4">
				<c:choose>
					<c:when test="${applyDetailPlan.currentTelecom eq 1}">
						SKT
					</c:when>
					<c:when test="${applyDetailPlan.currentTelecom eq 2}">
						KT
					</c:when>
					<c:when test="${applyDetailPlan.currentTelecom eq 3}">
						LGU+
					</c:when>
					<c:when test="${applyDetailPlan.currentTelecom eq 4}">
						SKT 알뜰폰
					</c:when>
					<c:when test="${applyDetailPlan.currentTelecom eq 5}">
						KT 알뜰폰	
					</c:when>
					<c:otherwise>
						LGU+ 알뜰폰
					</c:otherwise>				
				</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">
					<span>청구서유형</span>
				</th>
				<td  colspan="2">
				<c:choose>
					<c:when test="${applyDetailPlan.planBill eq 1}">
						문자
					</c:when>
					<c:otherwise>
						이메일
					</c:otherwise>
				</c:choose>	
				</td>
				<th scope="row">
					<span>납부방법</span>
				</th>
				<td  colspan="4">
				<c:choose>
					<c:when test="${applyDetailPlan.planPay eq 1}">
						카드
					</c:when>
					<c:otherwise>
						계좌이체
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
			<!-- 분리 -->
			<c:choose>
        <c:when test="${applyDetailPlan.planPay eq 1}">
            <tr>
                <th scope="row">
                    <span>카드번호</span>
                </th>
                <td  colspan="2">${applyDetailPlan.cardNumber }</td>
                <th scope="row">
                    <span>카드유효기간</span>
                </th>
                <td  colspan="4"> ${applyDetailPlan.cardExpiration }</td>
            </tr>
        </c:when>
        <c:otherwise>
            <tr>
                <th scope="row">
                    <span>은행</span>
                </th>
                <td colspan="2" >${applyDetailPlan.bank }</td>
                <th scope="row">
                    <span>계좌번호</span>
                </th>
                <td colspan="4">${applyDetailPlan.bankNumber }</td>
            </tr>
        </c:otherwise>
        </c:choose>

    	<tr>
	        <th scope="row">
	            <span>기본료(원)</span>
	        </th>
	        <td>${applyDetailPlan.planPrice }</td>
	        <th scope="row">
	            <span>기본데이터(MB)</span>
	        </th>
	        <td>${applyDetailPlan.planData }</td>
	        <th scope="row" style="width: 600px;">
	            <span>기본음성(분)</span>
	        </th>
	        <td>${applyDetailPlan.planVoice }</td>
	        <th scope="row" style="width: 7%;">
	            <span>기본문자(건)</span>
	        </th>
	        <td>${applyDetailPlan.planMessage }</td>
        </tr>
        <!-- 분리 -->
        <tr style="border-bottom: white;">
			<th scope="row">
				<span>가입 신청 상태</span>
			</th>
			<td>
			<c:choose>
				<c:when test="${applyDetailPlan.orderStatus eq 1}">
					신청완료
				</c:when>
				<c:when test="${applyDetailPlan.orderStatus eq 2}">
					승인완료
				</c:when>
				<c:otherwise>
					승인보류
				</c:otherwise>
			</c:choose>
			</td>
		</tr>
        
        </tbody>
	</table>
	
	<div class="statusBtnGroup">
		<button type="button" class="btn approve" style="margin-right : 10px;">승인</button>
		<button type="button" class="btn hold">보류</button>
	</div>

	<button type="button" class="btn goList" onclick="location.href='<%=request.getContextPath()%>/biz/applyList'">목록으로</button>


	</div>
 <%--    <table class="table">
        <tbody>
			<tr>
				<th scope="row">
					<span>가입유형</span>
				</th>
				<td>
				<c:choose>
					<c:when test= "${applyDetailPlan.joinCategory eq 1}">
						번호이동
					</c:when>
					<c:otherwise>
						신규가입
					</c:otherwise>
				</c:choose>
				</td>
				<th scope="row">
					<span>심종류</span>
				</th>
				<td>
				<c:choose>
					<c:when test ="${applyDetailPlan.simType eq 1 }">
						일반유심
					</c:when>
					<c:otherwise>
						NFC 유심
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
            <tr>
				<th scope="row">
					<span>유심신청여부</span>
				</th>
				<td>
				<c:choose>
					<c:when test ="${applyDetailPlan.simYn eq 1}">
						N
					</c:when>
					<c:otherwise>
						Y
					</c:otherwise>
				</c:choose>
				</td>
				<th scope="row">
					<span>현재사용통신사</span>
				</th>
				<td>
				<c:choose>
					<c:when test="${applyDetailPlan.currentTelecom eq 1}">
						SKT
					</c:when>
					<c:when test="${applyDetailPlan.currentTelecom eq 2}">
						KT
					</c:when>
					<c:when test="${applyDetailPlan.currentTelecom eq 3}">
						LGU+
					</c:when>
					<c:when test="${applyDetailPlan.currentTelecom eq 4}">
						SKT 알뜰폰
					</c:when>
					<c:when test="${applyDetailPlan.currentTelecom eq 5}">
						KT 알뜰폰	
					</c:when>
					<c:otherwise>
						LGU+ 알뜰폰
					</c:otherwise>				
				</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">
					<span>청구서유형</span>
				</th>
				<td>
				<c:choose>
					<c:when test="${applyDetailPlan.planBill eq 1}">
						문자
					</c:when>
					<c:otherwise>
						이메일
					</c:otherwise>
				</c:choose>	
				</td>
				<th scope="row">
					<span>납부방법</span>
				</th>
				<td>
				<c:choose>
					<c:when test="${applyDetailPlan.planPay eq 1}">
						카드
					</c:when>
					<c:otherwise>
						계좌이체
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
        </tbody>
    </table>	

    <!--납부방법에 따라 뜨는거 다르게 할 것. -->
    <table class="table">
    <c:choose>
        <c:when test="${applyDetailPlan.planPay eq 1}">
            <tr>
                <th scope="row">
                    <span>카드번호</span>
                </th>
                <td>${applyDetailPlan.cardNumber }</td>
                <th scope="row">
                    <span>카드유효기간</span>
                </th>
                <td>${applyDetailPlan.cardExpiration }</td>
            </tr>
        </c:when>
        <c:otherwise>
            <tr>
                <th scope="row">
                    <span>은행</span>
                </th>
                <td>${applyDetailPlan.bank }</td>
                <th scope="row">
                    <span>계좌번호</span>
                </th>
                <td>${applyDetailPlan.bankNumber }</td>
            </tr>
        </c:otherwise>
    </c:choose>
	</table>


    <table class="table">
    	<tr>
	        <th scope="row">
	            <span>기본료(원)</span>
	        </th>
	        <td>${applyDetailPlan.planPrice }</td>
	        <th scope="row">
	            <span>기본데이터(MB)</span>
	        </th>
	        <td>${applyDetailPlan.planData }</td>
	        <th scope="row">
	            <span>기본음성(분)</span>
	        </th>
	        <td>${applyDetailPlan.planVoice }</td>
	        <th scope="row">
	            <span>기본문자(건)</span>
	        </th>
	        <td>${applyDetailPlan.planMessage }</td>
        </tr>
    </table>

	<div class="applyStatus">
		<table class="table">
			<tr>
				<th scope="row">
					<span>가입 신청 상태</span>
				</th>
				<td>
				<c:choose>
					<c:when test="${applyDetailPlan.orderStatus eq 1}">
						신청완료
					</c:when>
					<c:when test="${applyDetailPlan.orderStatus eq 2}">
						승인완료
					</c:when>
					<c:otherwise>
						승인보류
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
		</table> --%>
		

<%-- 
<!-- Example Code -->
<div class="container">
    <div class="row">
      <div class="col-sm-4">
        <div class="mb-3">
          <label for="staticEmail" class="col-sm-2 col-form-label">신청번호</label>
          <div class="col-sm-10 infoContent">
            <input type="text" readonly class="form-control-plaintext" value=${applyDetailPlan.orderNo }>
          </div>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="mb-3">
          <label for="staticEmail" class="col-sm-2 col-form-label">요금제명</label>
          <div class="col-sm-10 infoContent">
            <input type="text" readonly class="form-control-plaintext" value=${applyDetailPlan.planName }>
          </div>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="mb-3">
          <label for="staticEmail" class="col-sm-2 col-form-label">신청일자</label>
          <div class="col-sm-10 infoContent">
            <input type="text" readonly class="form-control-plaintext" value=${applyDetailPlan.orderDate }>
          </div>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-sm-6">
        <div class="mb-3">
          <label for="staticEmail" class="col-sm-2 col-form-label">아이디</label>
          <div class="col-sm-10 infoContent">
            <input type="text" readonly class="form-control-plaintext" value=${applyDetail.userId }>
          </div>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="mb-3">
          <label for="staticEmail" class="col-sm-2 col-form-label">이름</label>
          <div class="col-sm-10 infoContent">
            <input type="text" readonly class="form-control-plaintext"  value=${applyDetail.userName }>
          </div>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-sm-6">
        <div class="mb-3">
          <label for="staticEmail" class="col-sm-2 col-form-label">주민등록번호</label>
          <div class="col-sm-10 infoContent" >
            <input
              type="text" readonly class="form-control-plaintext" value=${applyDetail.userSsn }>
          </div>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="mb-3">
          <label for="staticEmail" class="col-sm-2 col-form-label">휴대폰번호</label>
          <div class="col-sm-10 infoContent">
            <input type="text" readonly class="form-control-plaintext" value=${applyDetail.userPhone }>
          </div>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-sm-6">
        <div class="mb-3">
          <label for="staticEmail" class="col-sm-2 col-form-label">주소</label>
          <div class="col-sm-10 infoContent">
            <input type="text"readonly class="form-control-plaintext" value=${applyDetail.userAddress }>
          </div>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="mb-3">
          <label for="staticEmail" class="col-sm-2 col-form-label">이메일</label>
          <div class="col-sm-10 infoContent">
            <input type="text" readonly class="form-control-plaintext" id="staticEmail" value=${applyDetail.userEmail } >
          </div>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-sm-6">
        <div class="mb-3">
          <label for="staticEmail" class="col-sm-2 col-form-label">가입유형</label>
          <div class="col-sm-10 infoContent">
          	<c:choose>
			<c:when test= "${applyDetailPlan.joinCategory eq 1}">
            <input type="text" readonly class="form-control-plaintext" value="번호이동">
            </c:when>
			<c:otherwise>
			<input type="text" readonly class="form-control-plaintext" value="신규가입">
			</c:otherwise>
			</c:choose>
          </div>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="mb-3">
          <label for="staticEmail" class="col-sm-2 col-form-label">심종류</label>
          <div class="col-sm-10 infoContent">
	          <c:choose>
			  <c:when test ="${applyDetailPlan.simType eq 1 }">
	            <input type="text" readonly class="form-control-plaintext" value="일반유심">
	          </c:when>
			  <c:otherwise>
			  	<input type="text" readonly class="form-control-plaintext" value="NFC 유심">
			  </c:otherwise>
			  </c:choose>
          </div>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-sm-6">
        <div class="mb-3">
          <label for="staticEmail" class="col-sm-2 col-form-label">유심신청여부</label>
          <div class="col-sm-10 infoContent">
	          <c:choose>
			  <c:when test ="${applyDetailPlan.simYn eq 1}">
	            <input type="text" readonly class="form-control-plaintext" value="N">
	          </c:when>
			  <c:otherwise>  
	            <input type="text" readonly class="form-control-plaintext" value="Y">
	  		  </c:otherwise>
			  </c:choose>
          </div>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="mb-3">
          <label for="staticEmail" class="col-sm-2 col-form-label">현재사용통신사</label>
          <div class="col-sm-10 infoContent">
	          <c:choose>
				  <c:when test="${applyDetailPlan.currentTelecom eq 1}">
		            <input type="text" readonly class="form-control-plaintext" value="SKT">
		          </c:when>
		          <c:when test="${applyDetailPlan.currentTelecom eq 2}">
		            <input type="text" readonly class="form-control-plaintext" value="KT">
		          </c:when>
		          <c:when test="${applyDetailPlan.currentTelecom eq 3}">
		          	<input type="text" readonly class="form-control-plaintext" value="LGU+">
		          </c:when>
		          <c:when test="${applyDetailPlan.currentTelecom eq 4}">
		          	<input type="text" readonly class="form-control-plaintext" value="SKT 알뜰폰">
		          </c:when>
		          <c:when test="${applyDetailPlan.currentTelecom eq 5}">
		         	 <input type="text" readonly class="form-control-plaintext" value="KT 알뜰폰">
		          </c:when>
		          <c:otherwise>
		          	<input type="text" readonly class="form-control-plaintext" value="LGU+ 알뜰폰">
	         	 </c:otherwise>
	          </c:choose>
          </div>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-sm-6">
        <div class="mb-3">
          <label for="staticEmail" class="col-sm-2 col-form-label">청구서 유형 </label>
          <div class="col-sm-10 infoContent">
	          <c:choose>
				<c:when test="${applyDetailPlan.planBill eq 1}">
					<input type="text" readonly class="form-control-plaintext" value="문자">
				</c:when>
				<c:otherwise>
					<input type="text" readonly class="form-control-plaintext" value="이메일">
				</c:otherwise>
			  </c:choose>
          </div>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="mb-3">
          <label for="staticEmail" class="col-sm-2 col-form-label">납부방법</label>
          <div class="col-sm-10 infoContent">
          <c:choose>
			<c:when test="${applyDetailPlan.planPay eq 1}">
            	<input type="text" readonly class="form-control-plaintext" value="카드">
            </c:when>
            <c:otherwise>
            	<input type="text" readonly class="form-control-plaintext" value="계좌이체">
            </c:otherwise>
           </c:choose>
          </div>
        </div>
      </div>
    </div>


	<c:choose>
    <c:when test="${applyDetailPlan.planPay eq 1}">
    <div class="row">
      <div class="col-sm-6">
        <div class="mb-3">
          <label for="staticEmail" class="col-sm-2 col-form-label">카드번호 </label>
          <div class="col-sm-10 infoContent">
            <input type="text" readonly class="form-control-plaintext" value=${applyDetailPlan.cardNumber }>
          </div>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="mb-3">
          <label for="staticEmail" class="col-sm-2 col-form-label">카드유효기간</label>
          <div class="col-sm-10 infoContent">
            <input type="text" readonly class="form-control-plaintext" value=${applyDetailPlan.cardExpiration }>
          </div>
        </div>
      </div>
    </div>
    </c:when>
    <c:otherwise>
    <div class="row">
      <div class="col-sm-6">
        <div class="mb-3">
          <label for="staticEmail" class="col-sm-2 col-form-label">은행 </label>
          <div class="col-sm-10 infoContent">
         	 <input type="text" readonly class="form-control-plaintext" value=${applyDetailPlan.bank }>
          </div>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="mb-3">
          <label for="staticEmail" class="col-sm-2 col-form-label">계좌번호</label>
          <div class="col-sm-10 infoContent">
           <input type="text" readonly class="form-control-plaintext" value=${applyDetailPlan.bankNumber }>
          </div>
        </div>
      </div>
    </div>
    </c:otherwise>
    </c:choose>
 
</div> --%>

    

    <!-- End Example Code -->

<!-- 에러발생..  -->
<script>
	$(".btn.approve").on("click", approveClickHandler);
	function approveClickHandler(){
			$.ajax({
				url:"<%=request.getContextPath()%>/biz/approveStatus"
				, type:"POST"
				, data : {orderNo : ${applyDetailPlan.orderNo }}
				, success:function(result){
					alert("승인되었습니다.");
					location.reload();
				}
				, error:function(){
					alert("에러가 발생했습니다.");
				}
			});
		}
	
	
	$(".btn.hold").on("click", holdClickHandler);
	function holdClickHandler(){
		$.ajax({
			url:"<%=request.getContextPath()%>/biz/holdStatus"
			, type:"POST"
			, data : {orderNo : ${applyDetailPlan.orderNo }}
			, success:function(result){
				alert("보류되었습니다.");
				location.reload();
			}
			, error:function(){
				alert("에러가 발생했습니다.");
			}
		});
	}
</script>

<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
	<!-- Scripts -->
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/jquery/jquery.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/owl-carousel.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/animation.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/imagesloaded.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/popup.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/custom.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/user/myinfo.js"></script>
  	
	
</body>
</html>