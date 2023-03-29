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
요금제 가입 신청 목록
 <table border="solid">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>요금제명</th>
                    <th>신청자</th>
                    <th>가입신청상태</th>
                    <th>신청일자</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="applyList" items="${applyList }">
                <tr>
                    <td>${applyList.rownum }</td>
                    <td>${applyList.planName }</td>
                    <td>${applyList.userName }</td>
                    <td>${applyList.orderStatus }</td>
                    <td>${applyList.orderDate }</td>
                </tr>
                </c:forEach>                
            </tbody>
        </table>
</body>
</html>