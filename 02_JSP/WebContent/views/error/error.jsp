<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>에러가 발생했습니다. 관리자에게 문의해 주세요.</h1>
	<%= exception %><br> <!-- 객체의 toString 찍은 것 -->
	<%= exception.getMessage() %><br> <!-- / by zero -->
	<%= exception.getClass().getName() %><br> <!-- java.lang.ArithmeticException -->
	
	<!-- 
	에러 발생 처리하는 방법 2가지
	
	1. 직접 jsp 페이지에 에러 페이지 설정 (errorPage="../error/error.jsp")넣어서 에러가 발생했을 때 해당 페이지로 넘기기
		1-1. 그리고 에러를 처리할 페이지 상단에 (isErrorPage="true") 라고 적어줘야한다.  
		1-2. isErrorPage="true"로 속성이 정해진 페이지에서는 별도의 선언 없이 exception 이라는 변수에 접근할 수 있다.
		1-3. exception 변수에서 여러 메소드를 사용해서 어떤 exception인지 확인할 수 있다.
	2. 톰캣이 웹 애플리케이션을 로드할 때 web.xml에 에러 코드를 <error-page>와 <error-code>404일 때 <location>URI 
		직접 지정해서 해당 에러가 발생했을 때 보여줄 페이지를 지정한다. (web.xml 파일은 수정하면 서버 종료 후 다시 접속해야함-->
</body>
</html>