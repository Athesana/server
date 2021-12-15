package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.BoardService;


@WebServlet("/board/delete")
public class BoardDeleteServlet extends HttpServlet {
	
	private BoardService service = new BoardService();
	private static final long serialVersionUID = 1L;
       

    public BoardDeleteServlet() {
    }

    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	// 로그인 체크 & 본인의 게시글이 삭제하려는 게시글이 맞는지 확인(직접 해보세요) 
    	// 로그인 됐으면 데이터 베이스에서 NO 값 가지고 게시글 조회한 다음에 그 게시글의 작성자와 로그인 체크할 때 로그인 멤버에 있는 아이디랑 동일한지 체크
    	int result = 0;
    	int no = Integer.parseInt(request.getParameter("no"));
    	System.out.println("No : " + no);
    	
    	result = service.delete(no);
    	
		if(result > 0) {
			// 게시글 삭제가 성공했다는 뜻
			request.setAttribute("msg", "게시글 삭제 성공");
			request.setAttribute("location", "/board/list");
		} else {
			// 게시글 삭제가 실패했다는 뜻
			request.setAttribute("msg", "게시글 삭제 실패");
			request.setAttribute("location", "/board/list");
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);	
    	
	}

}
