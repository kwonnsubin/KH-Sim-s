<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 페이지</title>
</head>
<body>
	<form action="login" method="post" >
		<!-- 아이디 -->
		<input type="text" name="adminId" placeholder="아이디를 입력하세요" />
		<!-- 비밀번호 -->
		<input type="password" name="adminPw" placeholder="비밀번호를 입력하세요"  />
		<!--제출 -->
		<button type="submit">로그인</button>
	</form> 
</body>
</html>