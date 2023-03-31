<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
요금제 정보
<!-- 요금제 번호 추가할까 말까 -->
	<table border="solid">
		<tr>
			<th>
				<span>요금제명</span>
			</th>
			<td>${planDetail.planName} </td>
			<th>
				<span>통신사명</span>
			</th>
			<td>${planDetail.bizName}</td>
		</tr>
		<tr>
			<th>
				<span>통신망</span>
			</th>
			<td>
			<c:choose>
				<c:when test="${planDetail.netNo eq 1}">
					KT
				</c:when>
				<c:when test="${planDetail.netNo eq 2}">
					SKT
				</c:when>
				<c:otherwise>
					LGU+
				</c:otherwise>
			</c:choose>
			</td>
			<th>
				<span>통신세대</span>
			</th>
			<td>
			<c:choose>
				<c:when test="${planDetail.genNo eq 1}">
					5G
				</c:when>
				<c:when test="${planDetail.genNo eq 2}">
					LTE
				</c:when>
				<c:when test="${planDetail.genNo eq 3}">
					3G
				</c:when>
				<c:otherwise>
					LTE/3G
				</c:otherwise>
			</c:choose>
			</td>
		</tr>
		<tr>
			<th>
				<span>기본료(원)</span>
			</th>
			<td>${planDetail.planPrice}</td>
			<th>
				<span>기본음성(분)</span>
			</th>
			<td>${planDetail.planVoice}</td>
		</tr>
		<tr>
			<th>
				<span>기본문자(건)</span>
			</th>
			<td>${planDetail.planMessage}</td>
			<th>
				<span>기본데이터(mb)</span>
			</th>
			<td>${planDetail.planData}</td>
		</tr>
		<tr>
			<th>
				<span>초과음성단가(초)</span>
			</th>
			<td>${planDetail.planVoiceOver}</td>
			<th>
				<span>초과문자단가(건)</span>
			</th>
			<td>${planDetail.planMessageOver}</td>
			<th>
				<span>초과데이터단가(mb)</span>
			</th>
			<td>${planDetail.planDataOver}</td>
		</tr>
	</table>

</body>
</html>