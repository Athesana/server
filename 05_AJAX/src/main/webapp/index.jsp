<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<c:set var="path" value="${ pageContext.request.contextPath }"/>
	<h2>AJAX</h2>
	
	<h3>1. JavaScript를 이용한 AJAX 테스트</h3>
	<h4>1) GET 방식으로 서버에 데이터 전송 및 응답</h4>
	
	<button onclick="jsAjaxTest1()">GET 방식 전송</button>
	
	<p id="test1"></p>
	
	<script>
		function jsAjaxTest1(){
			// 1. XMLHttpRequest 객체 생성
			let xhr = new XMLHttpRequest();
			
			/* 브라우저 버전별 ajax 지원 여부 및 호환성 검사를 해야 한다.
			// IE 7버전 이상 또는 그 외의 브라우저들
			if(window.XMLHttpRequest) {
				xhr = new XMLHttpRequest();
			}
			 // IE 6버전 이하일 경우
			else if (window.ActiveXObject){
				try {
					xhr = ActiveXObject("Microsoft.XMLHTTP");
				} catch(e) {
					xhr = null;
				}
			} 
			// ajax를 지원하지 않는 브라우저
			else {
				xhr = null;
			}
			*/
			
			// 2. onreadystatechange : AJAX 통신에 대한 응답 상태에 변경이 있을 경우 실행될 함수 
			xhr.onreadystatechange = () => {
				/* 
					1) readyState : 서버 응답 상태 확인 (AJAX 통신 진행 상황 확인)
						- 0 : 요청이 초기화 되지 않은 상태
						- 1 : 서버 연결이 설정된 상태
						- 2 : 서버가 요청을 받은 상태
						- 3 : 서버가 요청을 처리하는 상태
						- 4 : 서버가 요청에 대한 처리가 끝났고 응답을 준비하는 상태
				*/
				
				console.log("readyState : " + xhr.readyState);
				
				if(xhr.readyState === 4){
					/*
						2) status : HTTP 응답 상태 코드 (응답이 정상적으로 이뤄졌는지 확인)
							- 200 : OK
							- 404 : Not Found
					*/
					
					if(xhr.status === 200){
						let str = xhr.responseText; // 서버에서 응답해주는 데이터를 문자열로 담고 있는 속성이다.
						
						document.getElementById('test1').innerHTML = str;
						
					} else {
						console.log("AJAX 통신 실패 : " + xhr.status);
					}
					
				}	
				
			}
			
			// 3, open() 메소드를 호출 : 서버와 데이터 교환할 때 필요한 정보를 입력한다. (요청 방식, 대상(서버), 비동기/동기 여부(기본 값 : true))
			xhr.open("GET", "${path}/jsAjax.do?name=이산아&age=20", true);
			
			// 4. send() 메소드를 호출 : 서버에 데이터를 전송(요청)한다.
			xhr.send();
			
		}
	</script>
	
	
	<h4>2) POST 방식으로 서버에 데이터 전송 및 응답</h4>
	
	<button onclick="jsAjaxTest2()">POST 방식 전송</button>
	
	<p id="test2"></p>
	
	<script>
		function jsAjaxTest2(){
			//1. XMLHttpRequest 객체 생성
			let xhr = new XMLHttpRequest();
			
			// 2. onreadystatechange
			xhr.onreadystatechange = () => {
				if(xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200){
					
					let str = xhr.responseText;
					
					document.getElementById('test2').innerHTML = str;
				}
			}
			
			// 3. open()
			xhr.open("POST", "${path}/jsAjax.do?", true);
			
			// * POST 방식 데이터 전송 시 send() 호출 전에 MIME TYPE을 설정해야 한다.
			// 아래의 헤더를 추가하지 않으면 서버에서 전송한 파라미터를 인식하지 못한다.
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
			
			// 4. send()
			xhr.send("name=홍길동&age=30");
		}
		
	
	</script>
	
	
	<h3>2. jQuery를 이용한 AJAX 테스트</h3>
	
	<h4>1) GET 방식으로 서버에 데이터 전송 및 응답</h4>
	입력 : <input type="text" id="input1" />
	응답 : <input type="text" id="output1" readonly />
	
	<button id="btn1">전송</button>
	
	<script>
		$(document).ready(() => {
			$('#btn1').on("click", () => {
				let input = $("#input1").val();
				
				$.ajax({
					type: "get", // 전송 방식(get 또는 post)
					url: "jqAjax1.do", // 데이터를 전송할 URL(필수값!)
					data: {  // 요청 시 전달할 파라미터 설정 (속성명과 변수명이 동일하면 네이밍 규칙에 의해 하나만 작성해도 된다.)
						input: input
					},
					success: function(result){
					// AJAX 통신 성공 시 처리할 콜백 함수 지정
					// 매개변수는 서버에서 응답이 왔을 때 그 값이 저장되는 변수 (변수명은 임의로 지정할 수 있다.)
						console.log(result);
					
						$("#output1").val(result);
					},
					error: function(error){
						// AJAX 통신 실패 시 처리할 콜백 함수 지정
						console.log("error", error);
					},
					complete: function(){
						// 통신의 성공 여부와 상관 없이 실행되는 콜백 함수 지정할 때 사용
						console.log("complete")
					}
				});
			});
			
		});
	
	</script>
	
	
	<h4>2) POST 방식으로 서버에 데이터 전송 및 응답</h4>
	입력 : <input type="text" id="input2" />
	응답 : <input type="text" id="output2" readonly />
	
	<button id="btn2">전송</button>
	
	<script>
		$(document).ready(() => {
			$("#btn2").on("click", () => {
				let input = $("#input2").val();
				
				$.ajax({
					type: "post",
					url: "jqAjax1.do",
					data: {
						input // input: input으로 변경된다. (속성명과 해당 속멍값을 담고 있는 변수명이 동일한 경우)
					},
					success: function(result){
						$("#output2").val(result);
					},
					error: function(error){
						console.log(error)
					}
				});
				
			});	
		
		
		});
		
	</script>
	
	<h4>3) 서버로 데이터 전송 후, 응답을 객체(Object)로 받아보자. </h4>
	
	<p>
		회원 번호를 입력하여 조회 버튼을 클릭<br>
		사용자가 존재하면 사용자 정보를 출력하고, 사용자가 존재하지 않으면 "사용자 정보가 없습니다." 출력
	</p>
	
	회원 번호 입력 : <input type="text" id="userNo"/>
	<button id="btn3">조회</button><br><br>
	
	<textarea id="textArea1" rows="4" cols="40"></textarea>
	
	<script>
		$(document).ready(() => {
			$("#btn3").on("click", () => {
				
				let userNo = $("#userNo").val();
				
				$.ajax({
					type: "GET",
					url: "jqAjax2.do",
					dataType: "json", // 응답 데이터 형식(미 작성 시 응답 데이터 형식을 판단하여 지정한다.)
					data: {
						userNo
					},
					success: function(obj){
						console.log(obj);
						
						let result = "";
						
						if(obj !== null){
							result = "no : " + obj.no + ", name : " + obj.name + ", age" + obj.age + ", gender : " + obj.gender;
						} else {
							result = "사용자 정보가 없습니다.";
							
						}
						
						$("#textArea1").val(result);
						
					},
					error: function(error){
						console.log(error)
					}
				});
				
			});
			
		});
	
	</script>
	
	<%-- 
		1. 스크립트 만들고 404뜨니까
		2. JqAjaxServlet2.java 서블릿 만들고
		3. model.vo에 User 클래스 만듬	
		4. JqAjaxServlet2에 LIST 객체 생성하고 데이터 저장
		5. tojson 라이브러리 활용하면 자바스크립트 객체로 만들어서 클라이언트로 정보를 넘겨준다.
	--%>
	
	<h4>4) 서버로 데이터 전송 후, 응답을 리스트(List)로 받기</h4>
	
	<p>
		선택한 성별을 가진 모든 회원 정보를 출력
	</p>
	
	<!-- name 속성은 같아야 한다. -->
	성별 : <label><input type="radio" name="gender" value="남" checked>남자</label>
		  <label><input type="radio" name="gender" value="여">여자</label>
	
	
	<button id="btn4">조회</button>
	
	<br><br>
	
	<textarea id="textArea2" rows="4" cols="40"></textarea>
	
	<script>
		$(document).ready(() => {
			$("#btn4").on("click", () => {
				let gender = $("input[name=gender]:checked").val();
				
				$.ajax({
					type: "get",
					url: "jqAjax3.do",
					dataType: "json",
					data: {
						gender
					},
					success: (list) => {
						let result = "";
						
						$.each(list, (i) => {
							result +=
								"no : " + list[i].no + ", name : " + list[i].name + " \n";  
							
						}) ;
						
						$("#textArea2").val(result);
					},
					error: (error) => {
						console.log(error);
						
					}
					
				});

			});
			
		});
	
	
	</script>
	

	
</body>
</html>