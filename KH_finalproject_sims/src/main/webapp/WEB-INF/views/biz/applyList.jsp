<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
요금제 가입 신청 목록
 <table border="solid">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>요금제명</th>
                    <th>신청번호<br>신청자</th>
                    <th>가입신청상태</th>
                    <th>신청일자</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="applyList" items="${applyList }">
                <tr>
                    <td>${applyList.rownum }</td>
                    <td>${applyList.planName }</td>
                    <td>${applyList.serialNo }<br>${applyList.userId }</td>
                    <td>
                    <c:choose>
                    	<c:when test="${applyList.orderStatus eq 1}">
                    		신청완료
                    	</c:when>
                    	<c:when test="${applyList.orderStatus eq 2}">
                    		승인완료
                    	</c:when>
                    	<c:otherwise>
						승인보류
						</c:otherwise>
                    </c:choose>
                    </td>
                    <td>${applyList.orderDate }</td>
                    <td><button type="button" class="btn detail" data-orderNo="${applyList.orderNo}"
                    onclick="location.href='/biz/applydetail?'orderNo="+${applyList.orderNo}>
                    상세보기</button></td>
                </tr>
                </c:forEach>             
            </tbody>
        </table>
<%--         
<script>

	$(".btn.detail").on("click.detailClickHandler");
	function detailClickHandler(){
		console.log("해당 가입신청서 상세페이지로 넘어갑니다.");
		console.log("${applyList.orderNo}")
		
		var orderNo = parseInt($(this).attr("id"));
		
		$.ajax({
			 url : "<%=request.getContextPath()%>/biz/applydetail"
			,type : "POST"
			,data : {orderNo : orderNo}
			,success: function (data) {
			      console.log("orderNo데이터 들고가는 것 성공");
			      console.log(data);
			}
			,error:function(){
				alert("상세페이지를 볼 수 없습니다.");
			}
		})
	} 
</script>
         --%>
</body>
</html>