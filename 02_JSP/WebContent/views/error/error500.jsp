<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>잠시 후에 다시 실행해 주세요.(500은 내부 서버 에러)</h2>
	
	<button onclick="history.go(-1);">이전 페이지로</button>
	
	<!-- 
		여기는 web.xml에 500으로 가라는 에러코드는 작성했지만 
		errorPage="../error/error.jsp" 별도의 에러 페이지를 지정해서 작성하지 않고 실행했을 때 나오게 하는 페이지임
	-->
</body>
</html>