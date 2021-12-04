<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.sendRedirect("redirect_target.jsp");
%>

<!-- Status Code : 302 : 이 응답 코드는 요청한 리소스의 URI(ContextPath~페이지 위치까지)가 일시적으로 변경되었음을 의미  -->
<!-- 
	브라우저에서 요청을 해서 redirect.jsp로 왔는데 다시 요청을 한다.
	여기에서 sendRedirect로 응답을 해주면, 브라우저에서 sendRedirect에 적힌 URL로 브라우저가 재전송, 재요청을 한다.
	그래서 요청이 2번이 하게 되는 구조이다.
	즉, sendRedirect는 매개값으로 지정한 URL로 요청을 재전송 시킨다. ("클라이언트야 이 주소로 다시 요청해!" 라고 응답하는 것)
	브라우저에서 재요청하기 때문에 URL이 변경된다.
-->
