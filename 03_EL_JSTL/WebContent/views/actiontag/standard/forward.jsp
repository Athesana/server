<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>jsp.forward 액션 태그</h2>
	<p>
		현재 페이지의 요청과 응답에 대한 처리권을 다른 페이지로 넘기는 액션 태그이다.
	</p>

	<script>
		alert('안녕하세요.');
	</script>	
	
	<jsp:forward page="forwardPage.jsp"/>
	
	<!-- 
	포워딩 전에 응답 객체에 쓴 내용은 forwarding 되면서 버퍼가 지워져서 아무런 효과가 없다. 따라서 alert 되지 않는 것
	서블릿으로 바뀔 때 : out.print('<jsp:forward page="forwardPage.jsp"/>') 형식으로 쓰여지게 된다. 
	사용자에게 매번 넘어가는게 아니라 버퍼에 쌓이고 있다. out 객체에 있던 버퍼에 쌓여있던 내용이 사라지고 클라이언트에게 가지 않는다.
	-->
	
	<%--
	같은 의미의 태그, but 파라미터가 있으면 닫는 태그가 필요하다.
	<jsp:forward page="forwardPage.jsp"></jsp:forward>
	--%>
	
	
	
</body>
</html>