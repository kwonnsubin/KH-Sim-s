<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
통신사 정보 수정
<form action="modifyBizInfo" method="post">

		<div>
			<span>기본정보</span>
		</div>
	

        <div>
            <label>법인명</label>
            <input type="text" name="planName">
            <label>대표자명</label>
            <input type="text" name="bizOwnerName" >
        </div>
        <div>
            <label>사업자등록번호</label>
            <input type="text" name="bizCrn">
            <label>법인등록번호</label>
            <input type="text" name="bizSsn">
        </div>
        <div>
            <label>회사우편번호</label> <!-- api -->
            <input type="text" name="bizZipCode">
            <label>회사주소</label>
            <input type="text" name="bizLocation">
        </div>
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
            <input type="text" name="phoneOpTime">
            <label>개통 소요시간 (유심보유시)</label>
            <input type="text" name="phoneOpTimeUsim">
		</div>
		
		<div>
			<label>지원통신망</label>
            <input type="text" name="network">
            <label>영업시간(오픈)</label>
            <input type="text" name="bizBeginTime" >
            <label>영업시간(클로징)</label>
            <input type="text" name="bizEndTime" >
		</div>
		
		<div>
			<label>휴무일</label>
            <input type="text" name="bizClosedDay">
		</div>
		
		<div>
			<label>고객센터번호</label>
		</div>
		
		<div>
			<label>로고이미지 첨부</label> <!-- 파일첨부 -->
		</div>
        
        <button type="submit">등록</button>
    </form>
</body>
</html>