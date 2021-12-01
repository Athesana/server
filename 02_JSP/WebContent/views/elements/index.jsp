<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>JSP 스크립트 요소(Elements)</h2>
	<!-- HTML -->
	<%-- JSP --%>
	<%-- 두 주석의 차이점 --%>
	<%-- 페이지 소스 보기 혹은 개발자 도구에 HTML 주석은 확인이 가능하고 JSP 주석은 확인이 불가능하다. 
		why? JSP 파일이 자바파일로 변환될 때 JSP 주석은 생략을 하고 변환한다. JSP 파일은 직접 실행시키는 것이 아니라 servlet으로 변환하는 과정을 거치기 때문에--%>
	
	<%!
		// 선언부 (필드, 메소드 선언)
		private String name = "이산아";
		private LocalDate date;
	%>
	<%
		// 자바 코드를 기술
		int total = 0; // 지역변수
		
		for(int i = 1; i <= 10; i++){
			total += i;
		}
		
		System.out.println(total);
	%>
	
	
	저의 이름은 <%= name %> 입니다.
	
	<br>
	
	expression 출력 : 
	1부터 10까지의 합은 <%= total %> 입니다. <br>
	
	scriptlet 출력 : 
	1부터 10까지의 합은 <% out.print(total); %> 입니다.
	
	
</body>
</html>




