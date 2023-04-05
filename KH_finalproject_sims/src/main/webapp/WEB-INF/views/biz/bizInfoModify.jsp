<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
통신사 정보 수정
<form action="modifyInfo" method="post" enctype="multipart/form-data" id="modifyForm">

		<div>
			<span>기본정보</span>
		</div>
	

        <div>
            <label>법인명</label>
            <input type="text" name="bizName">
            <label>대표자명</label>
            <input type="text" name="bizOwnerName" >
        </div>
        <div>
            <label>사업자등록번호</label>
            <input type="text" name="bizCrn">
            <label>법인등록번호</label>
            <input type="text" name="bizSsn">
        </div>
        
       <!--  <div>
            <label>회사우편번호</label> api
            <input type="text" name="bizZipCode" placeholder="우편번호">
            <input type="button" onclick="postCode()" value="우편번호 찾기">
            
            
            <label>회사주소</label>
            <input type="text" name="bizLocation">
        </div> -->
        
        <input type="text" id="postcode" name="bizZipCode" placeholder="우편번호">
		<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="roadAddress" placeholder="도로명주소">
		
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" id="detailAddress" placeholder="상세주소">
		<input type="text" id="extraAddress" placeholder="참고항목">
		        
        
         <div>
            <label>전화</label>
            <input type="text" name="bizPhone">
            <label>팩스</label>
            <input type="text" name="bizFax" >
        </div>
        <div>
            <label>이메일</label>
            <input type="text" name="bizEmail">
            <label>홈페이지</label>
            <input type="text" name="bizHp">
        </div>
        
        <div>
		<span>상세정보</span>
		</div>
		
		<div>
			<label>개통소요시간</label>
            <select name="phoneOpTime">
			  <c:forEach var="i" begin="0" end="150" step="1">
			    <option value="${i/10.0}">
			      <c:out value="${i/10.0}" />
			    </option>
			  </c:forEach>
			</select>일 
            
            <label>개통 소요시간 (유심보유시)</label>
            <select name="phoneOpTimeUsim">
			  <c:forEach var="i" begin="0" end="150" step="1">
			    <option value="${i/10.0}">
			      <c:out value="${i/10.0}" />
			    </option>
			  </c:forEach>
			</select>일 
		</div>
		
		<div>
			<label>지원통신망</label>
            <input type="checkbox" name="net" value="KT망">KT망
            <input type="checkbox" name="net" value="SKT망">SKT망
            <input type="checkbox" name="net" value="LGU+망">LGU+망
            
            
            <label>영업시간</label>
            <!-- 영업시간 -->
            <select name="bizBeginTime">
			  <c:forEach var="hour" begin="0" end="23">
			    <option value="${hour}:00">
			      <c:out value="${hour}:00" />
			    </option>
			    <option value="${hour}:30">
			      <c:out value="${hour}:30" />
			    </option>
			  </c:forEach>
			</select>
			~
			<select name="bizEndTime">
			  <c:forEach var="hour" begin="0" end="23">
			    <option value="${hour}:00">
			      <c:out value="${hour}:00" />
			    </option>
			    <option value="${hour}:30">
			      <c:out value="${hour}:30" />
			    </option>
			  </c:forEach>
			</select>

            
            
		</div>
		
		<div>
			<label>휴무일</label>
            <div>
            	<input type="checkbox" name="weekday" value="월">월
            	<input type="checkbox" name="weekday" value="화">화
            	<input type="checkbox" name="weekday" value="수">수
            	<input type="checkbox" name="weekday" value="목">목
            	<input type="checkbox" name="weekday" value="금">금
            	<input type="checkbox" name="weekday" value="토">토
            	<input type="checkbox" name="weekday" value="일">일
           		<input type="checkbox" name="weekday" value="공휴일">공휴일
            </div>
           
						            
		</div>
		
		<div>
			<label>고객센터번호</label>
			<span>KT</span><input type="text" name="KtService">
			<span>SKT</span><input type="text" name="SktService">
			<span>LGU+</span><input type="text" name="LguService">
		</div>
		
		<div>
			<label>로고이미지 첨부</label> <!-- 파일첨부 -->
			<input type="file" name="logo" placeholder="첨부파일" multiple="multiple">
		</div>
        
        <button type="submit">등록</button>
    </form>


<!-- 우편번호 찾기 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;

                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                }   else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<!-- 선택한 값들 한 문자열로 합치기(휴무일) -->
<!-- <script>
	var form = document.getElementById("modifyForm"); // form 태그의 id 값
	var weekdays = "";
	for (var i = 0; i < form.elements.length; i++) {
	  var element = form.elements[i];
	  if (element.name === "weekday" && element.checked) {
	    weekdays += element.value;
	    if (i < form.elements.length - 1) {
	      weekdays += ",";
	    }
	  }
	}
	var bizClosedDay = document.querySelector('input[name="bizClosedDay"]'); // name이 "bizClosedDay"인 input element 선택
	bizClosedDay.value = weekdays; // 선택된 input element의 value 값을 weekdays로 설정
	console.log("BizClosedDay:", weekdays); // 콘솔창에서 확인 불가.. 
</script> -->
<!-- 선택한 값들 한 문자열로 합치기(지원통신망) -->
<!-- <script>
	var form = document.getElementById("modifyForm");
	var net ="";
	for (var i = 0; i < form.elements.length; i++) {
		  var element = form.elements[i];
		  if(element.name === "net" && element.checked ){
			  net += element.value;
			  if (i < form.elements.length - 1) {
			      net += ",";
			    }
			  }
		  }
	var netNo = document.querySelector('input[name="netNo"]');
	netNo.value= net;
</script> -->
</body>
</html>