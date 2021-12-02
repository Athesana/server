<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		pageContext.setAttribute("pageScope", "pageValue");
		request.setAttribute("requestScope", "requestValue");
		
		//response.sendRedirect("scopeTest3.jsp");  // null
		pageContext.forward("scopeTest3.jsp");  // 포워드 가능, 스코프가 유효하다.
	%>
	
	<!-- 
		pageContext : 현재 test2 파일에서만 set, get 할 수 있다. 현재 페이지 내부에서만 접근할 수 있다. 
		request : 사용자가 보낸 요청에 대해 응답하기 전까지 스코프가 유지(유효)하다. 하나의 요청에 처리에 응답하기 전까지는 여러 페이지에 대해서 데이터 공유가 가능하고, 요청에 대해 응답하면 그제서야 끝!
	 -->
</body>
</html>