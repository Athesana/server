package com.kh.mvc.board.controller;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.common.util.FileRename;
import com.kh.mvc.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;


@WebServlet("/board/write")
public class WriteServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
	private BoardService service = new BoardService();
	
    public WriteServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false); 
    	Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;
    	String viewName = "/views/board/write.jsp";
    	
    	if(loginMember == null) {
    		viewName = "/views/common/msg.jsp";
        	request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
        	request.setAttribute("location", "/");
        		
    	}
    	
    	request.getRequestDispatcher(viewName).forward(request, response);
   }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		
    	// 파일이 저장될 경로 (경로가 없다면 미리 폴더를 만들어줘야 에러가 나지 않는다.)
    	String path = getServletContext().getRealPath("/resources/upload/board");
    	
    	// 파일의 사이즈를 지정 (10MB)
    	int maxSize = 10485760;
    	
    	// 문자에 대한 인코딩 설정
    	String encoding = "UTF-8";
    			
    	/*
    	 * DefaultFileRenamePolicy
    	 * 	- 업로드 되는 파일에 대한 rename 처리에 사용
    	 * 	- 중복되는 이름의 파일을 저장할 때, 이름 뒤에 0 ~ 9999 를 붙인다. (for 파일 구분) 
    	 */
    	
    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename()); 
    	
    	// 폼 파라미터로 넘어온 값들(파일에 대한 정보가 아님)
    	String title = mr.getParameter("title");
		String writer = mr.getParameter("writer");
		String content = mr.getParameter("content");
		
		// 파일에 대한 정보를 가져올 때
		String filesystemName = mr.getFilesystemName("upfile");
		String OriginalFileName = mr.getOriginalFileName("upfile");
		
		// 로그인 안 한 사용자가 접근할 경우 게시글 작성이 불가능하도록 체크하는 로직
		HttpSession session = request.getSession(false); 
    	Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;
    	
    	if(loginMember != null) {
    		Board board = new Board();
    		
    		board.setWriterNo(loginMember.getNo());
    		board.setTitle(title);
    		board.setContent(content);
    		board.setOriginalFileName(OriginalFileName);
    		board.setRenamedFileName(filesystemName);
    		
    		result = service.save(board);
    		
    		if(result > 0) {
    			// 게시글 등록이 성공했다는 뜻
    			request.setAttribute("msg", "게시글 등록 성공");
    			request.setAttribute("location", "/board/list");
    		} else {
    			// 게시글 등록이 실패했다는 뜻
    			request.setAttribute("msg", "게시글 등록 실패");
    			request.setAttribute("location", "/board/list");
    		}
    		
    	} else {
    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
    		request.setAttribute("location", "/");    		
    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);	
		
	
	}

}