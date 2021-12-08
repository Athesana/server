package com.kh.ajax.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.GsonBuilder;
import com.kh.ajax.model.vo.User;


@WebServlet("/jqAjax3.do")
public class JqAjaxServlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public JqAjaxServlet3() {

    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 사용자가 보내주는 파라미터 값 받아보자
    	char gender = request.getParameter("gender").charAt(0);
    	
    	// 사용자 정보가 저장되어 있는 List 생성
    	List<User> list = new ArrayList<>();
    	
    	list.add(new User(1, "김철수", 30, '남'));
    	list.add(new User(2, "김영희", 30, '여'));
    	list.add(new User(3, "영심이", 16, '여'));
    	list.add(new User(4, "왕경태", 16, '남'));
    	list.add(new User(5, "이산아", 20, '여'));
    	
    	List<User> users = list.stream().filter(user -> user.getGender() == gender).collect(Collectors.toList());
    	
    	// System.out.println(gender);
    	// System.out.println(list);
    	// System.out.println(users);
    	
    	response.setContentType("application/json; charset=UTF-8");
    	
    	// 객체가 안에 들어있는 배열로 출력해준다.
    	new GsonBuilder().setPrettyPrinting().create().toJson(users, response.getWriter());
    	
    	
	}

}
