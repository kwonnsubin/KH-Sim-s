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
		<div class="container-sm div-sm rounded-form">
			
			<div class="row my-3">
				<h4>가입 고객 정보</h4>
				<div class="col-sm-12 my-3">
					<div>
						<input type="hidden" name="bizId" value="${plan.bizId}">
						<input type="hidden" name="userId" value="${user.userId}">
						<input type="hidden" name="planNo" value="${plan.planNo}">
						<input type="hidden" name="netNo" value="${plan.netNo}">
						<input type="hidden" name="genNo" value="${plan.genNo}">
						<input type="hidden" name="orderPrice" value="${plan.planPrice}">
						<input type="hidden" name="orderData" value="${plan.planData}">
						<input type="hidden" name="orderVoice" value="${plan.planVoice}">
						<input type="hidden" name="orderMessage" value="${plan.planMessage}">
					</div>
					
					
					<table class="table table-borderless w-100 my-3">
						<tr>
							<td class="w-25">이름</td>
							<td>
								<input type="text" value="${user.userName }">
							</td>
						</tr>
						<tr>
							<td class="w-25">주민등록번호</td>
							<td>
								<input id="ssnFirst" type="text" style="width: 100px" maxlength="6" 
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -
								<input id="ssnLast" type="password" style="width: 100px" maxlength="7"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
								<div class="alert-ssn"></div>
							</td>
						</tr>
						<tr>
							<td class="w-25">휴대폰 번호</td>
							<td>
								<input id="phoneFirst" type="text" style="width: 60px" maxlength="3"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -
								<input id="phoneMiddle" type="text" style="width: 64px" maxlength="4"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -
								<input id="phoneLast" type="text" style="width: 64px" maxlength="4"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
								<div class="alert-phone"></div>
							</td>
						</tr>
						<tr>
							<td class="w-25">이메일</td>
							<td>
								<input id="emailId" type="text" style="width: 100px"> @
								<input id="emailDomain" type="text" style="width: 120px">
								<select id="emailSelect" class="form-select" style="width: 150px; display: inline-block;">
									<option value="">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="nate.com">nate.com</option>
									<option value="daum.net">daum.net</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="yahoo.com">yahoo.com</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>배송지 주소</td>
							<td class="lh-lg">
								<input type="text" id="postcode" placeholder="우편번호"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
								<input type="button" onclick="daumPostcode()" value="우편번호 찾기" class="btn btn-sm"><br>
								<input type="text" id="input_address" placeholder="주소" style="min-width: 55%"> 
								<input type="text" id="input_extraAddress" placeholder="참고항목" style="min-width: 44%"><br>
								<input type="text" id="detailAddress" placeholder="상세주소">
							</td>
						</tr>
					    <tr>
					        <td>이용중인 통신사</td>
					        <td>
					            <select name="currentTelecom" class="form-select" style="width: 150px;">
					                <option value="1">SKT</option>
					                <option value="2">KT</option>
					                <option value="3">LGU+</option>
					                <option value="4">SKT 알뜰폰</option>
					                <option value="5">KT 알뜰폰</option>
					                <option value="6">LGU+ 알뜰폰</option>
					            </select>
					        </td>
					    </tr>
					</table>
				</div>
			</div>
			<hr>
			<div class="row my-3">
				<div class="col-sm-12 my-3">
					<h4>납부 정보</h4>
				</div>
				<div class="col-sm-6 my-3">
					<input class="btn-check" type="radio" value="1" name="planPay" id="payCard">
					<label class="btn-inherit btn-m btn-outline-secondary w-100" for="payCard">카드납부</label>
				</div>
				<div class="col-sm-6 my-3">
					<input class="btn-check" type="radio" value="2" name="planPay" id="payAcc">
					<label class="btn-inherit btn-m btn-outline-secondary w-100" for="payAcc">계좌납부</label>
				</div>
			</div>

			<div class="row my-3">
				<div class="col-sm-12">
					<!-- 카드 납부 -->
					<form name="payInfo1" method="post" style="display: none;">
						<table class="table w-100 payInfoTable table-borderless">
							<tr>
								<td class="w-25">카드 소유자명</td>
								<td>
									<input type="text" id="cardHolder" placeholder="카드 소유자">
									<input class="form-check-input" type="checkbox" id="userEqCard">
									<label class="form-check-label" for="userEqCard">고객정보와 동일</label>
								</td>
							</tr>
							<tr>
								<td>소유자 주민등록번호</td>
								<td>
									<input id="cardSsn1" type="text" style="width: 100px" maxlength="6"
										oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -
									<input id="cardSsn2" type="password" style="width: 100px" maxlength="7"
										oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
									<div class="alert-cardssn"></div>
								</td>
							</tr>
							<tr>
								<td>카드번호</td>
								<td>
									<input name="card1" id="card1" type="text" style="width: 60px" maxlength="4"
										oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -
									<input name="card2" id="card2" type="password" style="width: 60px" maxlength="4"
										oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -
									<input name="card3" id="card3" type="password" style="width: 60px" maxlength="4"
										oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -
									<input name="card4" id="card4" type="text" style="width: 60px" maxlength="4"
										oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
									<div class="card-alert"></div>
								</td>
							</tr>
							<tr>
								<td>유효기간</td>
								<td>
									<div class="input-group"  style="width: 200px">
										<select name="cardMonth" class="form-select">
											<option value="" selected>월</option>
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
											<option value="" selected>년도</option>
											<option value="2023">2023</option>
											<option value="2024">2024</option>
											<option value="2025">2025</option>
											<option value="2026">2026</option>
											<option value="2027">2027</option>
											<option value="2028">2028</option>
											<option value="2029">2029</option>
											<option value="2030">2030</option>
											<option value="2031">2031</option>
											<option value="2032">2032</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td>가입자와의 관계</td>
								<td>
									<select name="cardRelationship" class="form-select" style="width: 200px">
										<option value="" selected>가입자와의 관계</option>
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
										<input class="form-check-input" type="radio" name="cardPlanBill" id="card-mobile" value="1"> 
										<label class="form-check-label" for="card-mobile">모바일</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="cardPlanBill" id="card-email" value="2"> 
										<label class="form-check-label" for="card-email">이메일</label>
									</div>
								</td>
							</tr>
						</table>
					</form>
					
					<!-- 계좌 납부 -->
					<form name="payInfo2" method="post" style="display: none;">
						<table class="table w-100 payInfoTable table-borderless">
							<tr>
								<td class="w-25">예금주</td>
								<td>
									<input type="text" id="accHolder" placeholder="예금주를 입력해주세요">
									<input class="form-check-input" type="checkbox" id="userEqAccount">
									<label class="form-check-label" for="userEqAccount">고객정보와 동일</label>
								</td>
							</tr>
							<tr>
								<td>예금주 주민등록번호</td>
								<td>
									<input id="accountSsn1" type="text" maxlength="6" style="width: 100px"
										oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -
									<input id="accountSsn2" type="password" maxlength="7" style="width: 100px"
										oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
									<div class="alert-accssn"></div>
								</td>
							</tr>
							<tr>
								<td>은행</td>
								<td>
									<select name="accBank" class="form-select" style="width: 200px">
										<option value="" selected>은행 선택</option>
										<option value="국민">국민</option>
										<option value="신한">신한</option>
										<option value="우리">우리</option>
										<option value="SC제일">SC제일</option>
										<option value="KEB하나">KEB하나</option>
										<option value="시티">시티</option>
										<option value="경남">경남</option>
										<option value="광주">광주</option>
										<option value="대구">대구</option>
										<option value="부산">부산</option>
										<option value="전북">전북</option>
										<option value="제주">제주</option>
										<option value="기업">기업</option>
										<option value="농협">농협</option>
										<option value="수협">수협</option>
										<option value="산업">산업</option>
										<option value="수출입">수출입</option>
										<option value="저축">저축</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>계좌번호</td>
								<td>
									<input id="accNumber" type="text" placeholder="숫자만 입력해 주세요"
									 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
									<div class="acc-alert"></div>
								</td>
							</tr>
							<tr>
								<td>가입자와의 관계</td>
								<td>
									<select name="accRelationship" class="form-select" style="width: 200px">
										<option value="" selected>가입자와의 관계</option>
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
										<input class="form-check-input" type="radio" name="accPlanBill" id="acc-mobile" value="1"> 
										<label class="form-check-label" for="acc-mobile">모바일</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="accPlanBill" id="acc-email" value="2"> 
										<label class="form-check-label" for="acc-email">이메일</label>
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<button id="submitBtn" class="btn w-100 btn-lg">신청하기</button>
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
		function daumPostcode() {
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
					    document.getElementById("input_extraAddress").value = extraAddr;
					
					} else {
					    document.getElementById("input_extraAddress").value = '';
					}
					
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("input_address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("detailAddress").focus();
				}
			}).open();
		}
		
		// 고객정보와 동일(카드)
		const userEqCard = document.getElementById('userEqCard');
		const cardHolder = document.getElementById('cardHolder');
		
		userEqCard.addEventListener('change', () => {
			if (userEqCard.checked) {
				cardHolder.value = '${user.userName}'; // 카드 명의
				$('#cardSsn1').val(ssn1);	// 카드 소유자 주민등록번호
				$('#cardSsn2').val(ssn2);
			} else {
				cardHolder.value = '';
				$('#cardSsn1').val('');
				$('#cardSsn2').val('');
			}
		});
		
		// 고객정보와 동일(계좌)
		const userEqAccount = document.getElementById('userEqAccount');
		const accHolder = document.getElementById('accHolder');
		
		userEqAccount.addEventListener('change', () => {
			if (userEqAccount.checked) {
				accHolder.value = '${user.userName}';	// 예금 명의
				$('#accountSsn1').val(ssn1);	// 예금주 주민등록번호
				$('#accountSsn2').val(ssn2);
			} else {
				accHolder.value = '';
				$('#accountSsn1').val('');
				$('#accountSsn2').val('');
			}
		});

		// 지불방법 
		document.querySelectorAll('input[name="planPay"]').forEach((radio) => {
		  radio.addEventListener('change', () => {
		    if (radio.value === '1') {
		      payInfo1.style.display = 'block';
		      payInfo2.style.display = 'none';
		    } else if (radio.value === '2') {
		      payInfo1.style.display = 'none';
		      payInfo2.style.display = 'block';
		    }
		  });
		});
		
		// 카드번호 유효성체크
		const card4 = document.getElementById('card4');
		card4.addEventListener('input', () => {
			const cardNum = $('input[name="card1"]').val() + $('input[name="card2"]').val()
					            	+ $('input[name="card3"]').val() + $('input[name="card4"]').val();
			let cardNumArr = Array.from(cardNum); // 카드번호 배열로
			const lastNum = Number(cardNumArr.pop()); // 마지막 숫자
			cardNumArr.reverse(); // 뒤집기
			cardNumArr = cardNumArr.map((num, idx) => idx % 2 === 0 ? Number(num) * 2 : Number(num)); // 홀수번째숫자 *2
			cardNumArr = cardNumArr.map((num) => 9 ? num - 9 : num); // 9보다 큰 숫자에서 -9
			let sum = cardNumArr.reduce((acc, curr) => acc + curr, 0); // 합계
			sum += lastNum;
			const modulo = sum % 10; // 합이 10의 배수인지 확인
			if (!modulo) {
				$('.card-alert').html("<p style='color: red;'>유효한 카드번호입니다.</p>");
			} else {
				$('.card-alert').html("<p style='color: red;'>유효하지 않은 카드번호입니다.</p>");
			}
		})
		
		// 계좌번호 자릿수
		const accNum = document.getElementById('accNumber');
		accNum.addEventListener('input', () => {
			if (accNum.value.length < 10 || accNum.value.length > 14) {
				$('.acc-alert').html("<p style='color: red;'>유효하지 않은 계좌번호입니다.</p>");
			} else {
				$('.acc-alert').html("");
			}
		})
		
		// 주민등록번호 자릿수
		const ssnFirst = document.getElementById('ssnFirst');
		const ssnLast = document.getElementById('ssnLast');
		const cardSsn1 = document.getElementById('cardSsn1');
		const cardSsn2 = document.getElementById('cardSsn2');
		const accSsn1 = document.getElementById('accountSsn1');
		const accSsn2 = document.getElementById('accountSsn2');
		ssnFirst.addEventListener('input', () => {
			if (ssnFirst.value.length < 6) {
				$('.alert-ssn').html("<p style='color: red;'>6자 이상 입력해주세요.</p>")
			} else {
				$('.alert-ssn').html("");
			}
		})
		ssnLast.addEventListener('input', () => {
			if (ssnFirst.value.length < 7) {
				$('.alert-ssn').html("<p style='color: red;'>7자 이상 입력해주세요.</p>")
			} else {
				$('.alert-ssn').html("");
			}
		})
		cardSsn1.addEventListener('input', () => {
			if (cardSsn1.value.length < 6) {
				$('.alert-cardssn').html("<p style='color: red;'>6자 이상 입력해주세요.</p>")
			} else {
				$('.alert-cardssn').html("");
			}
		})
		cardSsn2.addEventListener('input', () => {
			if (cardSsn2.value.length < 7) {
				$('.alert-cardssn').html("<p style='color: red;'>7자 이상 입력해주세요.</p>")
			} else {
				$('.alert-cardssn').html("");
			}
		})
		accSsn1.addEventListener('input', () => {
			if (accSsn1.value.length < 6) {
				$('.alert-accssn').html("<p style='color: red;'>6자 이상 입력해주세요.</p>")
			} else {
				$('.alert-accssn').html("");
			}
		})
		accSsn2.addEventListener('input', () => {
			if (accSsn2.value.length < 7) {
				$('.alert-accssn').html("<p style='color: red;'>7자 이상 입력해주세요.</p>")
			} else {
				$('.alert-accssn').html("");
			}
		})
		
		// 전화번호 자릿수
		const phoneFirst = document.getElementById('phoneFirst');
		const phoneMiddle = document.getElementById('phoneMiddle');
		const phoneLast = document.getElementById('phoneLast');
		phoneFirst.addEventListener('input', () => {
			if (phoneFirst.value.length < 3) {
				$('.alert-phone').html("<p style='color: red;'>3자 이상 입력해주세요.</p>")
			} else {
				$('.alert-phone').html("");
			}
		})
		phoneMiddle.addEventListener('input', () => {
			if (phoneMiddle.value.length < 3) {
				$('.alert-phone').html("<p style='color: red;'>3자 이상 입력해주세요.</p>")
			} else {
				$('.alert-phone').html("");
			}
		})
		phoneLast.addEventListener('input', () => {
			if (phoneLast.value.length < 4) {
				$('.alert-phone').html("<p style='color: red;'>4자 이상 입력해주세요.</p>")
			} else {
				$('.alert-phone').html("");
			}
		})
		
		// 자동 이동
		$('#ssnFirst').on('keyup', function() {
			if (this.value.length == 6) {
				$('#ssnLast').focus()
			}
		})
		
		
		$('#phoneFirst').on('keyup', function() {
			if (this.value.length == 3) {
				$('#phoneMiddle').focus()
			}
		})
		
		$('#phoneMiddle').on('keyup', function() {
			if (this.value.length == 4) {
				$('#phoneLast').focus()
			}
		})
		
		$('#cardSsn1').on('keyup', function() {
			if (this.value.length == 6) {
				$('#cardSsn2').focus()
			}
		})
		
		$('#card1').on('keyup', function() {
			if (this.value.length == 4) {
				$('#card2').focus()
			}
		})
		
		$('#card2').on('keyup', function() {
			if (this.value.length == 4) {
				$('#card3').focus()
			}
		})
		
		$('#card3').on('keyup', function() {
			if (this.value.length == 4) {
				$('#card4').focus()
			}
		})
		
		$('#accountSsn1').on('keyup', function() {
			if (this.value.length == 6) {
				$('#accountSsn2').focus()
			}
		})
		
		// 신청 데이터
	    $(document).ready(function() {
	        $('#submitBtn').click(function() {
	        	if ($('input[name="planPay"]:checked').val() == null) {
	        		alert('모든 항목을 입력해주세요.');
	        	} else {
		        	const planPay = $('input[name="planPay"]:checked').val();
		            if (planPay == '1') {
			            if ($('select[name="currentTelecom"]').val() === '' || $('input[name="cardPlanBill"]').val() === '' 
			                    || $('#postcode').val() === '' || $('#input_address').val() === '' || $('#cardHolder').val() === ''
			                    || $('#cardSsn1').val() === '' || $('#cardSsn2').val() === '' 
			                    || $('input[name="card1"]').val() === '' || $('input[name="card2"]').val() === ''
			                    || $('input[name="card3"]').val() === '' || $('input[name="card4"]').val() === ''
			                    || $('select[name="cardRelationship"]').val() === ''
			                    || $('select[name="cardMonth"]').val() === '' || $('select[name="cardYear"]').val() === '') {
			                alert('모든 입력 항목을 입력해주세요.');
			                return;
			            } else {
				            const bizId = $('input[name="bizId"]').val();
				            const userId = $('input[name="userId"]').val();
				            const planNo = parseInt($('input[name="planNo"]').val());
				            const joinCategory = sessionStorage.getItem('joinCategory');
				            const simType = sessionStorage.getItem('simType');
				            const simYn = sessionStorage.getItem('simYn');
				            const currentTelecom = $('select[name="currentTelecom"]').val();
				            const planBill = $('input[name="cardPlanBill"]').val();
				            const planPay = '1';
				            const netNo = parseInt($('input[name="netNo"]').val());
				            const genNo = parseInt($('input[name="genNo"]').val());
				            const orderPrice = parseInt($('input[name="orderPrice"]').val());
				            const orderData = parseInt($('input[name="orderData"]').val());
				            const orderVoice = parseInt($('input[name="orderVoice"]').val());
				            const orderMessage = parseInt($('input[name="orderMessage"]').val());
				            const orderAddress = '[' + $('#postcode').val() + ']' + $('#input_address').val() + ' '
				            	+ $('#detailAddress').val() + $('#input_extraAddress').val();
				            const cardHolder = $('#cardHolder').val();
				            const cardSsn = $('#cardSsn1').val() + '-' + $('#cardSsn2').val();
				            const cardRelationship = $('select[name="cardRelationship"]').val();
				            const cardNumber = $('input[name="card1"]').val() + '-' + $('input[name="card2"]').val() + '-'
				            	+ $('input[name="card3"]').val() + '-' + $('input[name="card4"]').val();
				            const cardExpiration = $('select[name="cardMonth"]').val() + '/' + $('select[name="cardYear"]').val();
				            $.ajax({
				                url: '${cpath}/plan/${planNo}/order',
				                type: 'POST',
				                data: {
				                    'bizId': bizId,
				                    'userId': userId,
				                    'planNo': planNo,
				                    'joinCategory': joinCategory,
				                    'simType': simType,
				                    'simYn': simYn,
				                    'currentTelecom': currentTelecom,
				                    'planBill': planBill,
				                    'planPay': planPay,
				                    'netNo': netNo,
				                    'genNo': genNo,
				                    'orderPrice': orderPrice,
				                    'orderData': orderData,
				                    'orderVoice': orderVoice,
				                    'orderMessage': orderMessage,
				                    'orderAddress': orderAddress,
				                    'cardHolder': cardHolder,
				                    'cardSsn': cardSsn,
				                    'cardRelationship': cardRelationship,
				                    'cardNumber': cardNumber,
				                    'cardExpiration': cardExpiration,
				                },
				                success: function(result) {
				                	window.location.href = '${cpath}/mypage/myplan';
				                	// 문자 보내기
/* 				                	$.ajax({
				        	            url: '${cpath}/send-one',
				        	           	type: 'POST',
				        	            data: {
				        	                'phoneNum': $('#phoneFirst').val()+$('#phoneMiddle').val()+$('#phoneLast').val()
				        	            },
				        	            success: function(result) {
				        	            	alert("문자 보냄");
				        	            },
				        	            error: function(xhr, status, error) {
				        	            	console.log("xhr.status: " + xhr.status);
				        	             console.log("xhr.statusText: " + xhr.statusText);
				        	             console.log("xhr.responseText: " + xhr.responseText);
				        	             console.log("xhr.readyState: " + xhr.readyState);
				        	             console.log(status);
				        	             console.log(error);
				        	            	alert("문자 실패");
				        	            }
				        	        }); */
				                },
				                error: function(xhr, status, error) {
				                	console.log("xhr.status: " + xhr.status);
					                console.log("xhr.statusText: " + xhr.statusText);
					                console.log("xhr.responseText: " + xhr.responseText);
					                console.log("xhr.readyState: " + xhr.readyState);
					                console.log(status);
					                console.log(error);
				                	alert("요금제 신청 실패");
				                }
							});
			            }
		            } else if (planPay == '2') {
			            if ($('select[name="currentTelecom"]').val() === '' || $('input[name="accPlanBill"]').val() === '' 
			            		|| $('#postcode').val() === '' || $('#input_address').val() === '' 
			            		|| $('#accHolder').val() === ''
			                    || $('#accountSsn1').val() === '' || $('#accountSsn2').val() === '' 
			                    || $('select[name="accRelationship"]').val() === ''
			                    || $('#accNumber').val() === '' || $('select[name="accBank"]').val() === ''
			                    ) {
			                alert('모든 입력 항목을 입력해주세요.');
			                return;
			            } else {
				            const bizId = $('input[name="bizId"]').val();
				            const userId = $('input[name="userId"]').val();
				            const planNo = parseInt($('input[name="planNo"]').val());
				            const joinCategory = sessionStorage.getItem('joinCategory');
				            const simType = sessionStorage.getItem('simType');
				            const simYn = sessionStorage.getItem('simYn');
				            const currentTelecom = $('select[name="currentTelecom"]').val();
				            const planBill = $('input[name="accPlanBill"]').val();
				            const planPay = '2';
				            const netNo = parseInt($('input[name="netNo"]').val());
				            const genNo = parseInt($('input[name="genNo"]').val());
				            const orderPrice = parseInt($('input[name="orderPrice"]').val());
				            const orderData = parseInt($('input[name="orderData"]').val());
				            const orderVoice = parseInt($('input[name="orderVoice"]').val());
				            const orderMessage = parseInt($('input[name="orderMessage"]').val());
				            const orderAddress = '[' + $('#postcode').val() + ']' + $('#input_address').val() + ' '
				            	+ $('#detailAddress').val() + $('#input_extraAddress').val();
					        const accHolder = $('#accHolder').val();
				            const accSsn = $('#accountSsn1').val() + '-' + $('#accountSsn2').val();
				            const accRelationship = $('select[name="accRelationship"]').val();
				            const accNumber = $('#accNumber').val();
				            const accBank = $('select[name="accBank"]').val();
				            $.ajax({
				                url: '${cpath}/plan/${planNo}/order',
				                type: 'POST',
				                data: {
				                    'bizId': bizId,
				                    'userId': userId,
				                    'planNo': planNo,
				                    'joinCategory': joinCategory,
				                    'simType': simType,
				                    'simYn': simYn,
				                    'currentTelecom': currentTelecom,
				                    'planBill': planBill,
				                    'planPay': planPay,
				                    'netNo': netNo,
				                    'genNo': genNo,
				                    'orderPrice': orderPrice,
				                    'orderData': orderData,
				                    'orderVoice': orderVoice,
				                    'orderMessage': orderMessage,
				                    'orderAddress': orderAddress,
				                    'accHolder': accHolder,
				                    'accSsn': accSsn,
				                    'accRelationship': accRelationship,
				                    'accNumber': accNumber,
				                    'accBank': accBank
				                },
				                success: function(result) {
				                	window.location.href = '${cpath}/mypage/myplan';
				                	// 문자 보내기
/* 				                	$.ajax({
				        	            url: '${cpath}/send-one',
				        	           	type: 'POST',
				        	            data: {
				        	                'phoneNum': $('#phoneFirst').val()+$('#phoneMiddle').val()+$('#phoneLast').val()
				        	            },
				        	            success: function(result) {
				        	            	alert("문자 보냄");
				        	            },
				        	            error: function(xhr, status, error) {
				        	            	console.log("xhr.status: " + xhr.status);
											console.log("xhr.statusText: " + xhr.statusText);
											console.log("xhr.responseText: " + xhr.responseText);
											console.log("xhr.readyState: " + xhr.readyState);
											console.log(status);
											console.log(error);
											alert("문자 실패");
				        	            }
				        	        }); */
				                },
				                error: function(xhr, status, error) {
				                	console.log("xhr.status: " + xhr.status);
					                console.log("xhr.statusText: " + xhr.statusText);
					                console.log("xhr.responseText: " + xhr.responseText);
					                console.log("xhr.readyState: " + xhr.readyState);
					                console.log(status);
					                console.log(error);
				                	alert("요금제 신청 실패");
				                }
				            });
			            }
		            }
	        	}
	        });
	    });

	</script>
</body>
</html>