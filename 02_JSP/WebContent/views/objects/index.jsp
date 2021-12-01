<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>JSP 내장 객체</h2>
	
	<h3>request 객체</h3>
	
	<h4>헤더와 관련된 메소드</h4>
	<table border="1">
		<tr>
			<th>헤더 이름</th>
			<th>헤더 값</th>
		</tr>
		
	<%
		Enumeration<String> headerNames = request.getHeaderNames();	
		while(headerNames.hasMoreElements()){
			String headerName = headerNames.nextElement();
	%>
		<tr>
			<td><%= headerName %></td>
			<td><%= request.getHeader(headerName) %></td>
		</tr>
	<%		
			// System.out.println(headerName + " " + request.getHeader(headerName));
		}
	
	%>
	</table>
	
	<h3>URL / URI, 요청 방식과 관련된 메소드</h3>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>값</th>
		</tr>
		<tr>
			<td>서버 도메인명</td>
			<td><%= request.getServerName() %></td>
		</tr>
		<tr>
			<td>서버 포트 번호</td>
			<td><%= request.getServerPort() %></td>
		</tr>
		
		<tr>
			<td>서버 URL</td>
			<td><%= request.getRequestURL() %></td>
		</tr>
		
		<tr>
			<td>서버 URI</td>
			<td><%= request.getRequestURI() %></td>
		</tr>
		<tr>
			<td>요청 쿼리</td>
			<td><%= request.getQueryString()%></td>
		</tr>
		<tr>
			<td>클라이언트 IP 주소</td>
			<td><%= request.getRemoteAddr() %></td>
		</tr>
		<tr>
			<td>프로토콜</td>
			<td><%= request.getProtocol() %></td>
		</tr>
		<tr>
			<td>요청방식</td>
			<td><%= request.getMethod() %></td>
		</tr>
		<tr>
			<td>웹 애플리케이션 경로</td>
			<td><%= request.getContextPath() %></td>
		</tr>

	</table>
	
	<h3>reponse 객체</h3>
	<p>
		sendRedirect(String url) <br>
		지정한 URL로 요청을 재전송한다. (브라우저에 표시되는 URL이 변경된다.) <br>
		브라우저에 표시되는 주소가 바뀌는 방식을 리다이렉트 방식이라고 한다. <br>
		리다이렉트는 브라우저가 이동할 페이지로 요청과 응답 객체를 새로 생성하여 전송하기 때문에 요청과 응답 정보가 유지되지 않는다.
	</p>
		
	<a href="redirect.jsp">redirect 테스트</a>
	
	<h3>pageContext 객체</h3>
	<p>
		forward(String url) <br>
		지정한 URL로 현재 페이지의 요청과 응답에 대한 제어권을 영구적으로 넘긴다.
		브라우저에 표시되는 주소가 바뀌지 않는 방식을 포워딩 방식이라고 한다.
		포워딩 방식은 현재 페이지의 요청과 응답에 대한 제어권만 다른 페이지로 넘어가기 때문에 요청 정보와 응답 정보가 유지되는 특성이 있다.
	</p>
	
	<a href="forward.jsp">forward 테스트</a>
	
	<!-- 
		[리다이렉트]
		redirect.jsp가 아니라 redirect_target.jsp로 URL이 바뀐다.
		클라이언트가 브라우저에서 서버로 요청을 보내면 -> redirect.jsp를 요청한다. -> sendRedirect() 응답 객체에 redirect 정보를 준다. -> 브라우저는 응답을 보고 다시 요청을 보낸다. -> To "redirect_target.jsp"로
		이 내용 대로 처리한 다음에 그 결과 내용을 클라이언트에게 보내준다. 
		요청이 2번이 가게 된다. 서버는 2번의 응답을 해주게 된다. 
		따라서 클라이언트에서 요청을 보낼 때는 request 메시지를 만들어서 보내고, 서버에서 응답할 때는 response 메시지를 만들어서 응답한다.
		그리고 서버에서 다시 요청하라고 했기 때문에 앞과 다른 메시지를 만들어서 보내고, 서버에서 응답에 따라서 또 다른 response 메시지를 만들어서 응답한다.

		[포워드]
		forward() 하면 request와 response를 요청에 대한 정보를 현재 서버 안에 있는 forward.jsp가 직접 요청을 처리하는게 아니라, 요청 내용을 내부에서 forward_target.jsp로 넘긴다. 
		그럼 forward_target.jsp가 요청 처리하고 그 응답 결과를 클라이언트에게 보내준다.
		그래서 클라이언트(브라우저) 입장에서는 하나의 요청만 보냈는데 forward.jsp에서 forward_target.jsp로 forward한다. (다른 페이지로 넘긴 것) 
		그래서 이 응답할 때 사용한 response 객체를 같이 넘겨준다. 그럼 타겟이 처리하고 응답 내용을 response에 담아서 내려준다.
		최초 요청했던 url이 유지된다. but, 실제 내용은 forward_target.jsp에 있는 내용이 내려온다.
		
		** 둘은 장단점이 있는게 아니라, 상황에 따라서 필요에 따라 사용한다.
	 -->

	
	
	
	
	
	
</body>
</html>

