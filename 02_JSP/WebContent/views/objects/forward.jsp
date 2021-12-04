<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.forward("forward_target.jsp");
%>

<!-- 
	redirect처럼 페이지를 이동시키는 것은 맞지만,
	요청도 1번만 가고, Status Code : 200, URL도 바뀌지 않는다. 
 -->