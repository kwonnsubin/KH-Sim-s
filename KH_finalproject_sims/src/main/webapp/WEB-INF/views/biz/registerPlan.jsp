<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="registerPlan" method="post">
        <div>
            <label>요금제명</label>
            <input type="text" name="planName">
            <label>통신사명</label>
            <!-- <span>박제하고싶은데.. </span> -->
            <input type="text" name="bizName">
        </div>
        <div>
            <label>통신망</label>
            <select name="netNo">
                <option value="1">SKT</option>
                <option value="2">KT</option>
                <option value="3">LGU+</option>
            </select>
            <label>통신세대</label>
            <select name="genNo">
                <option value="1">5G</option>
                <option value="2">LTE</option>
                <option value="3">3G</option>
                <option value="4">LTE/3G</option>
            </select>
        </div>
        <div>
            <label>기본료(원)</label>
            <input type="text" name="planPrice">
            <label>기본음성(분)</label>
            <input type="text" name="planVoice">
        </div>
         <div>
            <label>기본문자(건)</label>
            <input type="text" name="planMessage">
            <label>기본데이터(mb)</label>
            <input type="text" name="planData">
        </div>
        <div>
            <label>초과음성단가(초)</label>
            <input type="text" name="planVoiceOver">
            <label>초과문자단가(분)</label>
            <input type="text" name="planMessageOver">
            <label>초과데이터단가(MB)</label>
            <input type="text" name="planDataOver">
        </div>
        <button type="submit">등록</button>
    </form>
    
    <!-- 등록이 되면 등록이 되었다는 창이 뜨게 하고 요금제 목록 창으로  -->
</body>
</html>