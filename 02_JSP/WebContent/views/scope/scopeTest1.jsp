<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>application 영역과 session영역의 비교</h3>
	현재 application 영역에 저장된 데이터 : <%= application.getAttribute("userName") %><br>
	
	현재 session 영역에 저장된 데이터 : <%= session.getAttribute("address") %>
	
	<!-- 
		how to 실습?
		1. 서버 실행 시키고
		2. URL 복사해서 브라우저를 닫고 다시 URL 복사하면
		3. application 영역에 저장된 데이터는 출력이 되지만, session 영역에 저장된 데이터는 null로 나온다.
	 -->

	<!-- 
		페이지가 다르지만 데이터가 공유되고 있는 상황임 
		application : 톰캣 위에 애플리케이션이 올라가 있기 때문에, 톰캣 종료하면 애플리케이션도 종료된다. 애플리케이션이 실행되는 동안만 유효하기 때문에 종료하면 없어진다.
					서버를 접속을 끊었다가 다시 접속하면 애플리케이션도 종료된다. 웹 애플리케이션이 실행되는 동안 유지되기 때문에 종료되서 재실행되지 않는 한은 스코프가 유효하다.
					set 해주면 별도로 애플리케이션 객체에서 removeattribute 하지 않는 이상은 지워지지 않는다. 
		session : 브라우저를 닫았다가 다시 열면 세션은 종료되고 기존의 데이터는 삭제된다.
				 여러 페이지에서 기능이 유지되어야 하는 기능(로그인, 장바구니 등)할 때 사용한다.
	-->
	
</body>
</html>