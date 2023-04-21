<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
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
	
	<title>신청페이지 | ${plan.planName} | 심즈</title>
	
	<!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/plan.css">
	
</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<section>
		<div class="container-sm div-m">
			<div class="row">
				${plan }
				${user }
				가입유형: <span id="joinCategory"></span>
				유심보유: <span id="simYn"></span>
				유심유형: <span id="simType"></span>
				
				<h4>가입 고객 정보</h4>
				<form name="userInfo" action="#">
					<table class="table w-100">
						<tr>
							<td class="w-25">이름</td>
							<td>
								<input name="userName" type="text" value="${user.userName }">
							</td>
						</tr>
						<tr>
							<td class="w-25">주민등록번호</td>
							<td>
								<input name="ssnFirst" id="ssnFirst" type="text"> -
								<input name="ssnLast" id="ssnLast" type="password">
							</td>
						</tr>
						<tr>
							<td class="w-25">휴대폰 번호</td>
							<td>
								<input id="phoneFirst" type="text"> -
								<input id="phoneMiddle" type="text"> -
								<input id="phoneLast" type="text">
							</td>
						</tr>
						<tr>
							<td class="w-25">이메일</td>
							<td>
								<input id="emailId" type="text"> @
								<input id="emailDomain" type="text">
								<select id="emailSelect">
									<option value="">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="nate.com">nate.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="yahoo.com">yahoo.com</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>배송지 주소</td>
							<td>
								<input type="text" id="sample6_postcode" placeholder="우편번호">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample6_address" placeholder="주소"><br>
								<input type="text" id="sample6_detailAddress" placeholder="상세주소">
								<input type="text" id="sample6_extraAddress" placeholder="참고항목">
							</td>
						</tr>
						<tr>
							<td>기타 요청사항</td>
							<td><textarea class="w-100" rows="3"></textarea></td>
						</tr>
					</table>
				</form>
				
				<h4>납부 정보</h4>
				<div class="col input-group mb-3">
					<div class="input-group-text">
						<input class="form-check-input mt-0" type="radio"
							value="1" name="payType" checked="checked">
					</div>
					<input type="text" class="form-control" value="카드납부" readonly>
				</div>
				<div class="col input-group mb-3">
					<div class="input-group-text">
						<input class="form-check-input mt-0" type="radio"
							value="2" name="payType">
					</div>
					<input type="text" class="form-control" value="은행납부" readonly>
				</div>
				<form name="payInfo" action="#" method="post">
					<input type="hidden" name="payType" value="1">
					<table class="table w-100 payInfoTable">
						<tr>
							<td class="w-25">카드 소유자명</td>
							<td>
								<input type="text" id="cardHolder" placeholder="카드 소유자를 입력해주세요">
								<input class="form-check-input" type="checkbox" id="userEqCard">
								<label class="form-check-label" for="userEqCard">고객정보와 동일</label>
							</td>
						</tr>
						<tr>
							<td>소유자 주민등록번호</td>
							<td>
								<input id="cardSsn1" type="text"> -
								<input id="cardSsn2" type="password">
							</td>
						</tr>
						<tr>
							<td>카드번호</td>
							<td>
								<input name="card1" type=""> -
								<input name="card2" type="password"> -
								<input name="card3" type="password"> -
								<input name="card4" type="text">
							</td>
						</tr>
						<tr>
							<td>유효기간</td>
							<td>
								<div class="input-group">
									<select name="cardMonth" class="form-select">
										<option selected>월</option>
										<option value="01">01</option>
										<option value="02">02</option>
										<option value="03">03</option>
										<option value="04">04</option>
										<option value="05">05</option>
										<option value="06">06</option>
										<option value="07">07</option>
										<option value="08">08</option>
										<option value="09">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
									</select>
									<select name="cardYear" class="form-select">
										<option selected>년도</option>
										<option value="2023">2023</option>
										<option value="2024">2024</option>
										<option value="2025">2025</option>
										<option value="2026">2026</option>
										<option value="2027">2027</option>
										<option value="2028">2028</option>
										<option value="2029">2029</option>
										<option value="2030">2030</option>
										<option value="2031">2031</option>
										<option value="2032">10</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<td>가입자와의 관계</td>
							<td>
								<select name="cardRelationship" class="form-select">
									<option selected>가입자와의 관계</option>
									<option value="1">본인</option>
									<option value="2">부모</option>
									<option value="3">자녀</option>
									<option value="4">배우자</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>요금청구서 수령방법</td>
							<td>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="planBill" id="mobile" value="1"> 
									<label class="form-check-label" for="mobile">모바일</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="planBill" id="email" value="2"> 
									<label class="form-check-label" for="email">이메일</label>
								</div>
							</td>
						</tr>
					</table>
				
				</form>
				<form name="payInfo" action="#" method="post">
					<input type="hidden" name="payType" value="2">
					<table class="table w-100 payInfoTable">
						<tr>
							<td class="w-25">예금주</td>
							<td>
								<input type="text" id="accountHolder" placeholder="예금주를 입력해주세요">
								<input class="form-check-input" type="checkbox" id="userEqAccount">
								<label class="form-check-label" for="userEqAccount">고객정보와 동일</label>
							</td>
						</tr>
						<tr>
							<td>예금주 주민등록번호</td>
							<td>
								<input id="accountSsn1" type="text"> -
								<input id="accountSsn2" type="password">
							</td>
						</tr>
						<tr>
							<td>은행</td>
							<td>
								<select name="accBank" class="form-select">
									<option selected>은행 선택</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>계좌번호</td>
							<td>
								<input type="text" placeholder="숫자만 입력해 주세요">
								<!-- 계좌실명조회 해볼까... -->
							</td>
						</tr>
						<tr>
							<td>가입자와의 관계</td>
							<td>
								<select name="accRelationship" class="form-select">
									<option selected>가입자와의 관계</option>
									<option value="1">본인</option>
									<option value="2">부모</option>
									<option value="3">자녀</option>
									<option value="4">배우자</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>요금청구서 수령방법</td>
							<td>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="planBill" id="mobile" value="1"> 
									<label class="form-check-label" for="mobile">모바일</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="planBill" id="email" value="2"> 
									<label class="form-check-label" for="email">이메일</label>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
	<!-- Scripts -->
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/jquery/jquery.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/owl-carousel.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/animation.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/imagesloaded.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/popup.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/custom.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
		const joinCategory = sessionStorage.getItem('joinCategory');
		const simYn = sessionStorage.getItem('simYn');
		const simType = sessionStorage.getItem('simType');
	
		$('#joinCategory').text(joinCategory);
		$('#simYn').text(simYn);
		$('#simType').text(simType);
		
		// 주민등록번호
		var ssn = '${user.userSsn}';
		let [ssn1,ssn2] = ssn.split('-');
		$('#ssnFirst').val(ssn1);
		$('#ssnLast').val(ssn2);
		
		// 휴대폰 번호
		const phone = '${user.userPhone}';
		let [phone1, phone2, phone3] = phone.split('-');
		$('#phoneFirst').val(phone1);
		$('#phoneMiddle').val(phone2);
		$('#phoneLast').val(phone3);
		
		// 이메일
		$('#emailSelect').change(function(){
            $('#emailDomain').val($('#emailSelect').val());
        });
		
		const email = '${user.userEmail}';
		let [email1,email2] = email.split('@');
		$('#emailId').val(email1);
		$('#emailDomain').val(email2);
		
		
		// 우편번호
		function sample6_execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					
					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수
					
					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					    addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
					    addr = data.jibunAddress;
					}
					
					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if(data.userSelectedType === 'R'){
					    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
					    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					        extraAddr += data.bname;
					    }
					    // 건물명이 있고, 공동주택일 경우 추가한다.
					    if(data.buildingName !== '' && data.apartment === 'Y'){
					        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					    }
					    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					    if(extraAddr !== ''){
					        extraAddr = ' (' + extraAddr + ')';
					    }
					    // 조합된 참고항목을 해당 필드에 넣는다.
					    document.getElementById("sample6_extraAddress").value = extraAddr;
					
					} else {
					    document.getElementById("sample6_extraAddress").value = '';
					}
					
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample6_postcode').value = data.zonecode;
					document.getElementById("sample6_address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("sample6_detailAddress").focus();
				}
			}).open();
		}
		
		// 카드정보
		const userEqCard = document.getElementById('userEqCard');
		const cardHolder = document.getElementById('cardHolder');
		const cardSsn1 = document.getElementById('cardSsn1');
		
		userEqCard.addEventListener('change', () => {
			if (userEqCard.checked) {
				cardHolder.value = '${user.userName}';
				$('#cardSsn1').val(ssn1);
				$('#cardSsn2').val(ssn2);
			} else {
				cardHolder.value = '';
				$('#cardSsn1').val('');
				$('#cardSsn2').val('');
			}
		});
		
		// 예금정보
		const userEqAccount = document.getElementById('userEqAccount');
		const accountHolder = document.getElementById('accountHolder');
		
		userEqAccount.addEventListener('change', () => {
			if (userEqAccount.checked) {
				accountHolder.value = '${user.userName}';
				$('#accountSsn1').val(ssn1);
				$('#accountSsn2').val(ssn2);
			} else {
				accountHolder.value = '';
				$('#accountSsn1').val('');
				$('#accountSsn2').val('');
			}
		});

	</script>
</body>
</html>