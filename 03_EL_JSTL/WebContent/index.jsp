<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>EL/JSTL</h2>
	
	<h3>EL(Expression Language)</h3>
	<p>
		EL은 &lt;%= vlaue %&gt;, out.print(value)와 같이 JSP 화면에 표현하고자 하는 코드를 <br>
		\${ value }의 형식으로 표현하여 작성하는 것을 EL이라 한다.
	</p>
	
	<h4>1) EL</h4>
	
	<a href="el.do">View Details</a>
	
	<!-- 여기까지만 하면 404 페이지 에러 : 페이지가 없거나, 처리해줄 서블릿이 없기 때문에 서블릿을 만들어보자. -->
	
	
	<h4>2) EL(Param)</h4>
	
	<!-- <form action="/03_EL_JSTL/views/el/elParam.jsp" method="post"> ContextPath가 바뀌면 404 에러 발생할 수 있다.-->
	<form action="${ pageContext.request.contextPath }/views/el/elParam.jsp" method="post">
		<fieldset>
			<legend>제품 입력</legend>
			<input type="text" name="pName" placeholder="제품명을 입력하세요."><br>
			<input type="number"name="pCount" placeholder="수량을 입력하세요."><br>
			<input type="text" name="option" placeholder="옵션 1"><br>
			<input type="text" name="option" placeholder="옵션 2"><br>
			<input type="submit" value="전송">
		</fieldset>	
	</form>
	
	
	<h4>2) EL(연산자)</h4>
	
	<a href="${ pageContext.request.contextPath }/views/el/elOperation.jsp">View Details</a>
	
	
	<h3>JSP Action Tag</h3>
	<p>
		JSP 페이지에서 자바 코드 등의 스크립트 언어를 사용하지 않고, <br>
		HTML 태그 형태로 페이지나 객체에 접근할 수 있도록 태그를 이용해 구현한 기능을 말한다. <br>
		태그 형태로 만든다고 해서 ~~?? 
	</p>
	
	<h4>1) 표준 액션 태그 (Standard Action Tag)</h4>
	<p>
		별도의 라이브러리 설치 없이, JSP 페이지에서 바로 사용이 가능하고 태그 앞에 jsp: 접두어가 붙는다.
	</p>
	
	<a href="${ pageContext.request.contextPath }/views/actiontag/standard/include.jsp">jsp:include</a>
	<br>
	<a href="${ pageContext.request.contextPath }/views/actiontag/standard/forward.jsp">jsp:forward</a>
	
	<h4>2) 커스텀 액션 태그(Custom Action Tag)</h4>
	<p>
		개발자가 직접 만들어서 사용하는 액션 태그로 라이브러리 형태로 설치해야만 사용이 가능하다. <br>
		커스텀 액션 태그는 모든 태그의 이름 앞에 jsp: 이외의 접두어를 사용한다. 
	</p>
	<h4>3) JSTL (JSP Standard Tag Library)</h4>
	<p>
		JSP에서 사용하는 커스텀 태그로 <br>
		공통으로 사용하는 코드의 집합을 사용하기 쉽게 태그화하여 표준으로 제공되는 액션 태그를 말한다.
	</p>
	
	<h5>3-1) JSTL Core Library</h5>
	<p>
		변수와 URL, 조건문, 반복문 등의 로직과 관련된 JSTL 액션 태그를 제공한다.
	</p>
	
	<a href="${ pageContext.request.contextPath }/views/actiontag/jstl/core.jsp">JSTL Core</a>
	
	
	
	
	
	
</body>
</html>