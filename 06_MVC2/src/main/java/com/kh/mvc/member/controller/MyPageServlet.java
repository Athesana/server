package com.kh.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.member.model.vo.Member;




@WebServlet("/member/myPage")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MyPageServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	// false 인 이유? 세션이 없으면 새로 만들어서 주기 때문에, 기존 로그인이 됐으면 세션이 있기 때문에 그 세션을 주고 없으면 null을 준다. ??
    	HttpSession session = request.getSession(false); 
    	Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;
    	
    	if(loginMember != null) {
    		// 2번 방법)
    		// 데이터 베이스에서 해당하는 아이디 = loginMember를 다시 조회한다. 
    		// 데이터 베이스에서 멤버 객체를 가져와서 request 영역에 담아서 포워딩 시킨다.
    		
    		request.getRequestDispatcher("/views/member/myPage.jsp").forward(request, response);
    		
    	} else {
    		request.setAttribute("msg", "로그인 후 수정해 주세요.");
    		request.setAttribute("location", "/");
    		
    		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);	
    	}

	}

}
