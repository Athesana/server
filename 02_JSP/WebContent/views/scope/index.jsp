<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>영역 객체</h2>
	
	<h3>application 영역과 session영역의 비교</h3>
	
	<%
		application.setAttribute("userName", "이산아");
		session.setAttribute("address", "경기도 시흥시");
	%>
	
	<!-- key:value 형태로 값을 set 하고 있는데, value는 Object라서 객체를 저장할 수도 있다. -->
	
	<a href="scopeTest1.jsp">View Details</a>
	
	<h3>page 영역과 request 영역의 비교</h3>
	
	<a href="scopeTest2.jsp">View Details</a>
	
	
</body>
</html>