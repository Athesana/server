package com.kh.ajax.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ajax.model.vo.User;


@WebServlet("/jqAjax2.do")
public class JqAjaxServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public JqAjaxServlet2() {

    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// Integer객체에 parseInt 메소드 사용해서 String userNo로 받던 것을 int userNo로 바꿈
    	int userNo = Integer.parseInt(request.getParameter("userNo"));
    	
    	// 사용자 정보가 저장되어 있는 List 생성
    	List<User> list = new ArrayList<>();
    	
    	list.add(new User(1, "김철수", 30, '남'));
    	list.add(new User(2, "김영희", 30, '여'));
    	list.add(new User(3, "영심이", 16, '남'));
    	list.add(new User(4, "왕경태", 16, '남'));
    	list.add(new User(5, "이산아", 20, '여'));
    	
    	User findUser = list.stream()
    						.filter(user -> user.getNo() == userNo)
    						.findFirst()
    						.orElse(null);
    	
    	// Predicate : 매개값 user가 있고 판별해서 true나 false로 리턴해서 userNo랑 동일한 값만 걸려내서 stream()된고, 요소 한개만 가져오고 싶어서 .findFirst를 주면 Optional로 값을 가져온다.
    	
    	
    	response.setContentType("application/json; charset=UTF-8");

    	// 라이브러리를 쓰기 전에 JSON을 만들어서 테스트해보자. (넘 복잡...)
//    	String result = "{\"no\":1, \"name\":\"홍길동\", \"age\":30 \"gender\":\"남\"}";
//    	
//    	response.getWriter().print(result);
    	
    	// 1번 방법
//    	String json = new Gson().toJson(findUser);
//    	
    	// 사람이 읽기 편한 형태로 출력해주는 방법(Gson -> Json(객체))
//    	String json2 = new GsonBuilder().setPrettyPrinting().create().toJson(findUser);
//    	
//    	System.out.println(json);
//    
//    	System.out.println(json2);
//    
//    	response.getWriter().print(new Gson().toJson(findUser));
    	
    	// 2번 방법
    	new Gson().toJson(findUser, response.getWriter());
    	
    	
    	// 없는 값을 조회하면 null을 리턴한다.
	}


}
