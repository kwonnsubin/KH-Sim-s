<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
        <div>
            <label>요금제명</label>
            <input type="text">
            <label>통신사명</label>
            <input type="text" readonly>
        </div>
        <div>
            <label>통신망</label>
            <select>
                <option>SKT</option>
                <option>KT</option>
                <option>LGU+</option>
            </select>
            <label>통신세대</label>
            <select>
                <option>5G</option>
                <option>LTE</option>
                <option>3G</option>
                <option>LTE/3G</option>
            </select>
        </div>
        <div>
            <label>기본료(원)</label>
            <input type="text">
            <label>기본음성(분)</label>
            <input type="text">
        </div>
        <div>
            <label>초과음성단가(초)</label>
            <input type="text">
            <label>초과문자단가(분)</label>
            <input type="text">
            <label>초과데이터단가(MB)</label>
            <input type="text">
        </div>
    </form>
</body>
</html>