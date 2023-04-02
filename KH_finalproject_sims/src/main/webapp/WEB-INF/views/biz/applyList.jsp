<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
요금제 가입 신청 목록
	<div>
		<form action="${path}/biz/applyList">
			<select name="cnt" onchange="submit();">
				<c:forEach var="num" begin="5" end="30" step="5">
					<option value="${num }" ${requestScope.paging.pageLimit eq num ? "selected" : "" }>${num } 개</option>
				</c:forEach>
			</select>
		</form>
	</div>

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
            	<c:if test="${empty requestScope.paging.page}">
            		<tr>
            			<td colspan="6">가입신청서가 없습니다.</td>
            		</tr>
            	</c:if>
            
            	<c:if test="${not empty requestScope.paging.page}">
	                <c:forEach var="applyList" items="${requestScope.paging.page}">
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
	                    onclick="location.href='<%=request.getContextPath()%>/biz/applydetail?orderNo=${applyList.orderNo}'">
	                    상세보기</button></td>
	                </tr>
	                </c:forEach>   
                </c:if>          
            </tbody>
        </table>
        
     <!-- 페이지 번호 -->
     <c:if test="${not empty requestScope.paging.page}"> <!-- 신청서가 하나도 없으면 페이징X -->
		<ul class="pagination">
			<c:set var="pageNumber" value="${empty param.p ? 1 : param.p }" />
			<c:choose>
				<c:when test="${requestScope.paging.prevPage eq -1 }">
					<li class="page-item disabled"><a class="page-link">prev</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="${path}/biz/applyList?p=${requestScope.paging.prevPage }">prev</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="pNum" items="${requestScope.paging.pageList }">
				<li class="page-item ${pNum eq pageNumber ? 'active' : '' }"><a class="page-link" href="${path}/biz/applyList?p=${pNum }">${pNum }</a></li>
			</c:forEach>
			<c:choose>
				<c:when test="${requestScope.paging.nextPage eq -1 }">
					<li class="page-item disabled"><a class="page-link">next</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="${path}/biz/applyList?p=${requestScope.paging.nextPage }">next</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	  </c:if>

</body>
</html>