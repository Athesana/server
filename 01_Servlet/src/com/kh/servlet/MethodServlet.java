package com.kh.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MethodServlet
 */


@WebServlet("/method.do")
public class MethodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MethodServlet() {
    }


    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 사용자가 보낸 정보(데이터)들은 request 객체 안에 키(클라이언트에서 보낼 때 사용하는 name 속성의 값), 값(value 속성의 값) 형태로 담겨 있다.
    	// 해당 name 속성을 가지는 요소의 value 값을 문자열로 읽어온다. 어떤 값을 입력해도 다 문자열로 읽는다.
    	// 쿼리 스트링
    	String userName = request.getParameter("userName");
    	String age = request.getParameter("age");
    	String gender = request.getParameter("gender");
    	String height = request.getParameter("height");
    	
    	// 해당 name 속성을 가지는 요소들의 value 값들을 문자열의 배열로 읽어온다.
    	String[] foods = request.getParameterValues("food");
    	
    	System.out.println(userName);
    	System.out.println(age);
    	System.out.println(gender);
    	System.out.println(height);
    	
    	Arrays.stream(foods).forEach((food) -> System.out.println(food));
    	
    	
    	// 여기서부터가 사용자에게 보여주는 응답 화면에 대한 설정
    	// 응답 화면이 문서 형태의 html이고 문자 셋은 UTF-8 이라는 것을 명시하고 있다.
    	// 아래의 과정이 없으면 인코딩 문제로 한글이 깨진다.
    	response.setContentType("text/html;charset=UTF-8");
    	
    	// 사용자에게 응답 화면을 출력하기 위한 스트림을 생성한다. (문자 기반 출력 스트림)
    	PrintWriter out = response.getWriter();
    	
    	// 자바 코드로 응답 화면을 작성하고 있는 과정이다.
		out.write("<html>");
		out.write("<body>");
		out.write("<h1>개인 정보 출력 화면</h1>");
		out.printf("%s님은 %s세이고, 키가 %scm인 %s입니다. 좋아하는 음식은 ", userName, age, height, gender);
		Arrays.stream(foods).forEach((food) -> out.write(food + " "));
		out.write("입니다.");
		out.write("</body>");
		out.write("</html>");
    	
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// POST 방식으로 넘겨받은 데이터가 영어 혹은 숫자가 아닐 경우 아래와 같이 인코딩 처리를 해야 한다.
    	// GET 방식의 경우 인코딩 설정이 필요없는 이유는 URL에 값들이 포함되어서 전달되기 때문이다.
    	// POST 방식은 body 에 값들을 담아서 전달하기 때문에 기본적으로 ISO-8859-1로 인코딩 되었다고 간주하기 때문에 인코딩 처리가 필요하다. 
    	request.setCharacterEncoding("UTF-8");
    	this.doGet(request, response);
	}
    
    
    
    
    
    
    
    
    
    

}
