<%@page import="com.kh.el.model.vo.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	/*
	// request 객체에 저장된 속성(Attribute)을 가져온다.
	String classRoom = (String)request.getAttribute("classRoom");
	Person student = (Person)request.getAttribute("student");
	
	// session 객체에 저장된 속성(Attribute)을 가져온다.
	String academy = (String)session.getAttribute("academy");
	Person teacher = (Person)session.getAttribute("teacher");
	*/
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>EL(Expression Language)</h2>
	
	<h3>1. 기존 Scriptlet을 이용하는 방식으로 request, session 객체에 담겨있는 데이터를 출력</h3>
	
	<%-- 
	학원명 : <%= academy %><br>
	강의장 : <%= classRoom %><br>
	강사 : <%= teacher.getName() %>, <%= teacher.getAge() %>, <%= teacher.getGender() %><br>
	수강생 : <%= student.getName() %>, <%= student.getAge() %>, <%= student.getGender() %><br><br>
	 --%>
	
	<h3>2. EL을 이용하는 방식으로 request, session 객체에 담겨있는 데이터를 출력</h3>
	
	<!-- 
		1. EL은 request, session 등 JSP 영역 객체를 구분하지 않아도 자동으로 입력된 속성명(키 값)을 검색해서 존재하는 경우 값을 가져온다.
			- page -> request -> session -> application 영역 순서대로 해당 속성을 찾고 값을 가져온다.
			
		2. EL은 Scriptlet과 다르게 getter를 사용하지 않고 filed명으로 직접 접근하는 것 같지만 아니다. (접근제한자가 private여도 가능)
			내부적으로 해당 객체의 getter를 자동으로 할당하여 저장된 값을 읽어온다. (getter를 추가해야한다.)
			
		: Person.java 파일에서 @Data 를 없애고 실행해보면 다음 에러 발생 (lombok이 깔려있다는 전제하에, 없으면 getter 추가)
		javax.el.PropertyNotFoundException: 타입 [com.kh.el.model.vo.Person]에서 프로퍼티 [name]을(를) 찾을 수 없습니다.
	 -->
	
	학원명 : ${ academy }<br>
	강의장 : ${ classRoom }<br>
	강사 : ${ teacher.name }, ${ teacher.age }, ${ teacher.gender }<br>
	수강생 : ${ student.name }, ${ student.age }, ${ student.gender }<br>
	
	
	<h3>3. 중복되는 EL 사용시에 영역 객체에 저장된 속성명이 같은 경우(실습에서는 "scope를 말함")</h3>
	
	scope : ${ scope }<br> 
	<!-- 순서대로 속성을 찾지만, 만약에 발견된다면 발견된 영역에 있는 값을 즉시 출력하고 끝! -->
	
	<!-- 만약 내가 원한 영역에 있는 속성 값을 가져 오고 싶다면? : EL 내장 객체를 활용하세요~ -->
	
	<%
		// Page Scope에 데이터를 저장
		pageContext.setAttribute("scope", "Page 영역");
	%>
	
	<!-- 여러 스코프에 동일한 속성을 저장했다면, 명시적으로 스코프를 지정해서 원하는 영역의 속성 값을 읽어올 수 있다. -->
	Page 영역의 scope : ${ scope } 또는  ${ pageScope.scope }<br> 
	Request 영역의 scope : ${ requestScope.scope }<br>
	Session 영역의 scope : ${ sessionScope.scope }<br>
	Application 영역의 scope : ${ applicationScope.scope }<br>
	

	<h3>4. ContextPath 가져오기</h3>
	<h4>Scriptlet을 이용하는 방식</h4>
	ContextPath : <%= request.getContextPath() %>
	
	<h4>EL을 이용하는 방식</h4>
	ContextPath : ${ pageContext.request.contextPath }	
	
	
	
	<h3>5. 헤더에 접근하기</h3>
	<h4>Scriptlet 을 이용하는 방식</h4>
	Host 		: <%= request.getHeader("host") %><br>
	User-Agent	: <%= request.getHeader("User-Agent") %>
	
	<h4>EL을 이용하는 방식</h4>
	Host 		: ${ header.host }<br>
	User-Agent	: ${ header['User-Agent'] %>
	
	
	
	
	
	
</body>
</html>