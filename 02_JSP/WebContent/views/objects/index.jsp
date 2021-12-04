<%@page import="java.util.Date"%>
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
	<!-- 
		URL : 프로토콜 + 서버 + ContextPath + 현재 페이지의 위치를 포함하는 전체 url 경로
		URI : 서버 정보까지 제외하고, 톰캣에서부터 현재 페이지까지 위치를 찾아오는 경로, 즉 네트워크 상에서의 자원 = 서버 상에서 보이는 페이지의 위치
	 -->
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
		매개값으로 지정한 URL로 요청을 재전송한다. (브라우저에 표시되는 URL이 변경된다.) <br>
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
		그래서 클라이언트(브라우저) 입장에서는 하나의 요청만 보냈는데 요청 정보를 forward.jsp에서 forward_target.jsp로 forward한다. (다른 페이지로 넘긴 것) 
		그래서 이 응답할 때 사용한 response 객체를 같이 넘겨준다. 그럼 forward_target.jsp이 처리하고 응답 내용을 response에 담아서 클라이언트에게 내려준다.
		최초 요청했던 url이 유지된다. but, 실제 내용은 forward_target.jsp에 있는 내용이 내려온다.
		
		** 둘은 장단점이 있는게 아니라, 상황에 따라서 필요에 따라 사용한다.
	 -->

	<h3>session 객체</h3>
	
	<!-- 세션 생성 메소드 -->
	isNew() : <%= session.isNew() %><br>
	생성 시간 : <%= new Date(session.getCreationTime()) %><br>
	최종 접속 시간 : <%= new Date(session.getLastAccessedTime()) %><br>
	세션 ID : <%= session.getId() %>
	
	<!-- 브라우저를 켜서 서버에 접속하면 처음 = isNew() : true, 새로고침 = isNew() : false , 기존 세션이 유지되고 있음 until 브라우저 창 종료할 떄까지 -->
	
	<!-- 
		ABOUT HTTP 프로토콜 
		: 클라이언트가 서버에 요청을 하면, 서버는 요청을 보고 응답을 한다. 이 때, 클라이언트에 대한 상태가 서버에 저장(유지)되지 않는다. 
		즉, 한 번 요청에 대한 응답을 하면 클라이언트와의 관계는 유지되지 않는다.
		로그인이나 장바구니 기능들은 클라이언트의 상태가 유지되어야 하는 프로그램에는 HTTP만 가지고는 구현하기가 어렵다.
		따라서 상태는 유지하지 않는 HTTP의 상태 특성 때문에 클라이언트과 서버의 상태(관계)를 유지하기 위한 기능이 세션이다. (similar. cookie)
		세션 : 서버와 클라이언트와의 관계를 서버에 저장한다.
		쿠키 : 서버와 클라이언트와의 관계를 클라이언트(사용자)에서 관리한다.
	 -->
	
	<h3>application 객체</h3>
	
	<table border="1">
		<tr>
			<td>JSP 버전</td>
			<td><%= application.getMajorVersion() %>, <%= application.getMinorVersion() %></td>
		</tr>
		<tr>
			<td>컨테이너정보</td>
			<td><%= application.getServerInfo() %></td>
		</tr>
		<tr>
			<td>웹 애플리케이션의 실제 파일 시스템 경로</td>
			<td><%= application.getRealPath("/") %></td>
		</tr>
	</table>
	
	
	<h3>config 객체</h3>
	
	<table border="1">
		<tr>
			<th>초기 파라미터 이름</th>
			<th>초기 파라미터 값</th>
		</tr>
		
		<%
			Enumeration<String> initParamNames = config.getInitParameterNames();
		
			while(initParamNames.hasMoreElements()){
				String initParamName = initParamNames.nextElement();	
		%>
			<tr>
				<td><%= initParamName %></td>
				<td><%= config.getInitParameter(initParamName) %></td>
			</tr>
		
		<%
			}
		%>
		
	</table>
	
	
	

	
</body>
</html>

