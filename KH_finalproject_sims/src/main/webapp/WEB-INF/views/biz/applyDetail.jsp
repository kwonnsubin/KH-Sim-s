<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    요금제 신청서 상세정보
    <table border="solid">
		<tbody>
			<tr>
				<th scope="row">
					<span>신청번호</span>
				</th>
				<td>${applyDetail.orderNo }</td>
				<th scope="row">
					<span>요금제명</span>
				</th>
				<td>${applyDetail.planName }</td>
                <th scope="row">
                    <span>아이디</span>
                </th>
                <td>${applyDetail.userId }</td>
                <th scope="row">
                    <span>이름</span>
                </th>
                <td>${applyDetail.userName }</td>
                <th scope="row">
                    <span>신청일자</span>
                </th>
                <td>${applyDetail.orderDate }</td>
			</tr>
			<tr>
				<th scope="row">
					<span>주민등록번호</span>
				</th>
				<td>${applyDetail.userSsn }</td>
				<th scope="row">
					<span>휴대폰번호</span>
				</th>
				<td>${applyDetail.userPhone }</td>
			</tr>
			<tr>
				<th scope="row">
					<span>주소</span>
				</th>
				<td colspan="4">${applyDetail.userAddress }</td>
                <th scope="row">
                    <span>이메일</span>
                </th>
                <td colspan="4">${applyDetail.userEmail }</td>
			</tr>
        </tbody>
	</table>

    <table border="solid">
        <tbody>
			<tr>
				<th scope="row">
					<span>가입유형</span>
				</th>
				<td>${applyDetail.joinCategory }</td>
				<th scope="row">
					<span>심종류</span>
				</th>
				<td>${applyDetail.simType }</td>
			</tr>
            <tr>
				<th scope="row">
					<span>유심신청여부</span>
				</th>
				<td>${applyDetail.simYn }</td>
				<th scope="row">
					<span>현재사용통신사</span>
				</th>
				<td>${applyDetail.currentTelecom }</td>
			</tr>
			<tr>
				<th scope="row">
					<span>청구서유형</span>
				</th>
				<td>${applyDetail.planBill }</td>
				<th scope="row">
					<span>납부방법</span>
				</th>
				<td>${applyDetail.planPay }</td>
			</tr>
        </tbody>
    </table>	

    <!--납부방법에 따라 뜨는거 다르게 할 것. -->
    <!--납부 방법 카드일 경우-->
    <table border="solid">
    	<tr>
	        <th scope="row">
	            <span>카드번호</span>
	        </th>
	        <td>${applyDetail.cardNumber }</td>
	        <th scope="row">
	            <span>카드유효기간</span>
	        </th>
	        <td>${applyDetail.cardExpiration }</td>
        </tr>
    </table>

    <!--계좌이체일 경우-->
    <table border="solid">
    	<tr>
	        <th scope="row">
	            <span>은행</span>
	        </th>
	        <td>${applyDetail.bank }</td>
	        <th scope="row">
	            <span>계좌번호</span>
	        </th>
	        <td>${applyDetail.bankNumber }</td>
        </tr>
    </table>

    <table border="solid">
    	<tr>
	        <th scope="row">
	            <span>가입기본료</span>
	        </th>
	        <td>${applyDetail.planPrice }</td>
	        <th scope="row">
	            <span>가입데이터</span>
	        </th>
	        <td>${applyDetail.data }</td>
	        <th scope="row">
	            <span>가입음성</span>
	        </th>
	        <td>${applyDetail.planVoice }</td>
	        <th scope="row">
	            <span>가입문자</span>
	        </th>
	        <td>${applyDetail.planMessage }</td>
        </tr>
    </table>



<script>
/* Javascript 샘플 코드 */


	var xhr = new XMLHttpRequest();
	var url = 'http://apis.data.go.kr/1160100/service/GetDomeBankInfoService/getDomeBankGeneInfo'; /*URL*/
	var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'PHfPC7SVItw6zXzXyZSTViGirU5wxr2MwwLQj5J00RFqEHLRXpIIrvAUjGs2bY6QHBp3SgqaDynMg22h%2BgvZ5w%3D%3D'; /*Service Key*/
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1'); /**/
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
	queryParams += '&' + encodeURIComponent('resultType') + '=' + encodeURIComponent('xml'); /**/
	xhr.open('GET', url + queryParams);
	xhr.onreadystatechange = function () {
	    if (this.readyState == 4) {
	        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
	    }
	};
	
	xhr.send('');
</script>
</body>
</html>