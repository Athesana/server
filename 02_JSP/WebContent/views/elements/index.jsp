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
		why? JSP 파일이 자바파일로 변환될 때 JSP 주석은 생략을 하고 변환한다. JSP 파일은 직접 실행시키는 것이 아니라 servlet으로 변환하는 과정을 거치기 때문에 
		HTML 주석은 out.write()의 매개 값으로 작성되어 클라이언트한테 보내게 될 내용 중 하나로 인식(비록 브라우저는 인식하지 않아서 화면에 보이지는 않지만..)
	--%>
	
	<%!
		// 선언부 (필드, 메소드 선언) : java 파일로 변활 될 때, class 안에 있는 멤버 변수로 선언이 된다.
		private String name = "이산아";
		private LocalDate date;
	%>
	<%
		// scriptlet : 자바 코드를 기술 (접근 제한자를 붙일 수 없다.)
		int total = 0; // 지역변수 (_jspService 메소드 안에서)
		
		for(int i = 1; i <= 10; i++){
			total += i;
		}
		
		System.out.println(total);
	%>
	
	<%-- 표현식 : 출력해볼 때 사용 --%>
	저의 이름은 <%= name %> 입니다.
	
	<br>
	
	expression 출력 : 
	1부터 10까지의 합은 <%= total %> 입니다. <br>
	
	scriptlet 출력 : 
	1부터 10까지의 합은 <% out.print(total); %> 입니다.
	
	
</body>
</html>




