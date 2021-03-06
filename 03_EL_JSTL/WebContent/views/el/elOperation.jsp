<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.el.model.vo.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>EL(연산자)</h2>
	
	<h3>산술 연산</h3>
	10 더하기 5 = ${ 10 + 5 }<br>
	10 더하기 5 = ${ '10' + 5 }<br> <!-- EL에서는 문자 연결 연산자 지원 X, 숫자로 형변환해서 연산해줌 -->
	10 빼기 5 = ${ 10 - 5 }<br>
	10 곱하기 5 = ${ 10 * 5 }<br>
	10 나누기 5 = ${ 10 / 5 } 또는 ${ 10 div 5 }<br>
	10 나누기 7의 나머지 = ${ 10 % 7 } 또는 ${ 10 mod 7 }<br>
	
	<h3>객체 비교 연산</h3>
	<%
		String str1 = "안녕";
		String str2 = new String("안녕");
		Person p1 = new Person("이산아", 20, '여');
		Person p2 = new Person("이산아", 20, '여');
		
		// Page Scope에 데이터를 담기
		pageContext.setAttribute("str1", str1);
		pageContext.setAttribute("str2", str2);
		pageContext.setAttribute("p1", p1);
		pageContext.setAttribute("p2", p2);
	%>
	
	<%--
	영역 객체 안에 담고 나서는 출력이 가능해진다.
	str1 : ${ str1 }<br>
	str2 : ${ str2 }<br>
	 --%>
	 
	 
	<!-- 
		서블릿에 보면 el에서 가져올 데이터를 영역 객체 안에 setAttribute로 저장했다.
		el은 내장 객체 중에서도 영역 객체에 저장되어있는 Attribute 속성에 접근해서 값을 가져온다.
		스크립트릿으로 변수를 선언하면 영역 객체에 담기는 것이 아니라, 지역 변수가 되기 때문에 el로 가져올 수 없다.
		따라서 가져오고 싶으면 어떤 것이든 영역 객체 안에 담아주면 된다.
		
		:EL은 영역 객체에 Attribute로 저장된 값에 접근해서 값을 가져오기 때문에
		스크립트릿에 선언된 변수는 Attribute로 저장된 값이 아니라서 가져올 수 없다.
	-->
	
	<table border="1">
		<tr>
			<th>비교식</th>
			<th>표현식</th>
			<th>EL</th>
		</tr>
		<tr>
			<td>str1 == str2</td>
			<td><%= str1 == str2 %> (비교: <%= str1.equals(str2) %>)</td> <!-- 데이터는 같지만, 주소 값이 다르기 때문에 false -->
			<td>${ str1 == str2 } 또는 ${ str1 eq str2 }</td> <!-- EL의 == 연산은 equals() 메소드와 같은 동작을 한다. true -->
		</tr>
		<tr>
			<td>str1 != str2</td>
			<td><%= str1 != str2 %></td> <!-- true -->
			<td>${ str1 != str2 } 또는 ${ str1 ne str2 }</td> <!-- false -->
		</tr>
		<tr>
			<td>p1 == p2</td>
			<td><%= p1 == p2 %></td> <!-- false -->
			<td>${ p1 == p2 } 또는 ${ p1 eq p2 }</td>
		</tr>
		<tr>
			<td>p1 != p2</td>
			<td><%= p1 != p2 %></td> <!-- true -->
			<td>${ p1 != p2 } 또는 ${ p1 ne p2 }</td>
		</tr>
	</table>
	
	<h3>숫자형 자동 형변환</h3>
	<%
		pageContext.setAttribute("big", 10);
		// pageContext.setAttribute("big", "10"); // 가능
		// pageContext.setAttribute("big", "a");  // 불가능
		// pageContext.setAttribute("big", 'a');  // 가능
		pageContext.setAttribute("small", 3);
	%>
	
	<!-- 실제로 값은 숫자형태로 넣었어도 두 번째 매개값은 Object 형태로 저장되기 때문에 EL 쓰면 자동으로 형변환 되기 때문에 연산 및 비교 연산 가능해진다. -->
	
	Scriptlet : <%= (Integer)pageContext.getAttribute("big") + (int)pageContext.getAttribute("small") %> <!-- 오토언박싱 -->
	
	<!-- Object 타입 끼리는 더하기 연산이 성립되지 않는다. 따라서 강제 형변환이 필요하다. -->
	
	<br>
	
	EL : ${ big + small }<br><br> <!-- 13, 연산 가능  -->
	
	<!-- EL은 영역 객체의 속성으로 담긴 Object 타입을 자동으로 인식하여 형변환 후 연산을 처리한다. 심지어 값이 문자여도 가능, "" 문자 안에서 숫자가 아닌 문자가 들어가면 불가능-->
	
	big &gt; small : ${ big > small } 또는 ${ big gt small }<br>
	big &lt; small : ${ big < small } 또는 ${ big lt small }<br>
	big &gt;= small : ${ big >= small } 또는 ${ big ge small }<br>
	big &lt;= small : ${ big <= small } 또는 ${ big le small }<br>
	
	<!-- 자동 형변환으로 인해서 비교 연산도 가능하다. -->
	
	<h3>객체가 null 또는 비어있는지 체크하는 연산자</h3>
	<%
		// String str3 = null;
		String str3 = "";  // 빈문자열인지도 체크해준다.
		// String str3 = "a"; 
		List<String> list = new ArrayList<>();
		
		list.add(str3);
		
		pageContext.setAttribute("str3", str3);
		pageContext.setAttribute("list", list);
	%>
	
	Scriptlet : <%= str3 == null %>  <!-- true --> , <%= list.isEmpty() %> <!-- true -->
	
	<br><br>
	
	EL : ${ empty str3 }, ${ !empty str3 }, ${ empty list }, ${ not empty list }
	
	
	<h3>논리 연산자, 부정 연산자</h3>
	
	${ true && true } 또는 ${ true and false }<br> 
	${ true || false } 또는 ${ true or false }<br>
	${ !true } 또는 ${ not true }<br>
	${ !(big > small) } 또는 ${ not (big > small) } 
	<!-- false, false : 비교 연산의 결과 값이 논리 값이기 때문에 이렇게도 작성 가능 -->
	
	
	
	
	
	
</body>
</html>