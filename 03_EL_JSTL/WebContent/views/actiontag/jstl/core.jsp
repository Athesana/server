<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <h2>JSTL Core Library</h2>
	 
	 <h3>1. 변수</h3>
	 
	 <h4>1) 변수 선언 (c:set)</h4>
	 
	 <p>
	 	변수를 선언하고 초기값을 대입하는 기능을 하는 태그이다. <br>
	 	변수 선언시에 scope를 지정할 수 있다. (지정하지 않으면 기본적으로 pageScope에 저장된다.)<br>
	 	사용 방법 <br>
	 		- 변수 타입은 별도로 선언하지 않는다.<br>
	 		- 초기값은 반드시 지정해야 한다.<br>
	 		- c:set 태그로 선언한 변수는 EL 구문 안에서 사용 가능 하고 스크립트릿 요소에서는 직접 사용할 수는 없다.
	 </p>
	 
	 <%--pageContext.setAttribute("num1", "10"); --%>
	 <c:set var="num1" value="10" />
	 <%--request.setAttribute("num2", "20"); --%>
	 <c:set var="num2" value="20" scope="request"/>
	 <c:set var="result" value="${ num1 + num2 }" scope="session"/>
	 
	 num1 변수 값 : ${ num1 }<br>
	 num1 변수 값(표현식) : <%= pageContext.getAttribute("num1") %><br>
	 num2 변수 값 : ${ num2 }<br>
	 result 변수 값 : ${ result }
	 
	 
	 
	 
	 
	 
</body>
</html>