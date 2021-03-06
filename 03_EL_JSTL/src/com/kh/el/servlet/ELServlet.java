package com.kh.el.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.el.model.vo.Person;


@WebServlet("/el.do")
public class ELServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ELServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 서블릿에서 request, session, application 객체를 가져와서 
    	// 데이터를 setAttribute()에 담아서 el.jsp에 전달한다.
    	
    	HttpSession session = request.getSession();
    	ServletContext application = request.getServletContext();
    	
    	// Request Scope에 데이터를 저장
    	// 값에 오는 데이터 타입은 객체를 포함해서 어떤 타입이든 상관없다. cuz, 두 번째 매개값인 Object는 최상위 데이터 타입으로 auto-boxing 되기 때문에
    	request.setAttribute("classRoom", "R 강의장");
    	request.setAttribute("student", new Person("홍길동", 20, '남'));
    	request.setAttribute("scope", "Request 영역");
    	
    	// Session Scope에 데이터를 저장
    	session.setAttribute("academy", "KH 정보교육원");
    	session.setAttribute("teacher", new Person("문인수", 20, '남'));
    	session.setAttribute("scope", "Session 영역");
    	
    	// Application Scope에 데이터를 저장
    	application.setAttribute("scope", "Application 영역");
    	
    	// request를 다른 곳으로 배송해주는 역할 by forward로 request랑 response를 같이 전달해준다.
		request.getRequestDispatcher("views/el/el.jsp").forward(request, response);
		
		
		// MVC : 요청이 오면 서블릿에서 받아서 비즈니스 로직을 처리하고, 데이터만 request, session, application에 담아서 jsp에 보내주면 jsp 페이지에서는 화면만 그려준다.
		
	}

}
