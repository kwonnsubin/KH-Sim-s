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
<h2>${planList[0].bizName}의 요금제 목록</h2>
	<div>
        <span class="count float-1">총 0건</span>
    </div>
    <div>
        <table border="solid">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>요금제명</th>
                    <th>등록일</th>
                    <th>수정/삭제</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="plan" items="${planList}">
                <tr>
                    <td>${plan.rownum }</td>
                    <td><a href="<%=request.getContextPath()%>/biz/planDetail?planNo=${plan.planNo }">${plan.planName }</a></td>
                    <td>${plan.planDate } </td>
                    <td>
                    <button>수정</button><!-- 요금제 수정이 필요한가??? -->
                    <button>삭제</button>
                    </td>
                </tr>
                </c:forEach>                
            </tbody>
        </table>
    </div>
    
    <div>
    	<button type="button"  onclick="registerBtn(this);">요금제 등록하기</button>
    </div>
    <%-- location.href='<%=request.getContextPath()%>/biz/registerPlan'" --%>
<script>
	function registerBtn(){
		location.href="<%=request.getContextPath()%>/biz/registerPlan";
	}
</script>   
</body>
</html>