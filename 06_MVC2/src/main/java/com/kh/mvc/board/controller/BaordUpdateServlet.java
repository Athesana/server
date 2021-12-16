package com.kh.mvc.board.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.common.util.FileRename;
import com.oreilly.servlet.MultipartRequest;


@WebServlet("/board/update")
public class BaordUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public BaordUpdateServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 로그인 체크 & 본인의 게시글이 수정하려는 게시글이 맞는지 확인(직접 해보세요) 
    	Board board = null;
    	int no = Integer.parseInt(request.getParameter("no"));
    	
    	board = new BoardService().findBoardByNo(no);
    	
    	request.setAttribute("board", board);
    	request.getRequestDispatcher("/views/board/update.jsp").forward(request, response);
    	
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	Board board = null;
    	// 새로 업로드 되는 파일 네임, 서버에 저장되는 파일 네임
    	String originalFileName = null;
    	String renamedFileName = null;
    	String path = getServletContext().getRealPath("/resources/upload/board");
    	int maxSize = 10485760;
    	String encoding = "UTF-8";
    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
    	
    	// 넘겨오는 값들을 담을 board 객체 생성
    	board = new Board();
    	
    	board.setNo(Integer.parseInt(mr.getParameter("no")));
    	board.setTitle(mr.getParameter("title"));
    	board.setWriterId(mr.getParameter("writer"));
    	board.setContent(mr.getParameter("content"));
    	board.setOriginalFileName(mr.getParameter("originalFileName"));
    	board.setRenamedFileName(mr.getParameter("renamedFileName"));

    	// 파일에 대한 정보 가져오기
    	originalFileName = mr.getOriginalFileName("upfile");
    	renamedFileName = mr.getFilesystemName("upfile");
    	
    	if(originalFileName != null && !originalFileName.equals("")) {
    		File file = new File(path + "/" + board.getRenamedFileName());
    		
    		if(file.exists()) {
    			file.delete();
    		}
    		
    		board.setOriginalFileName(originalFileName);
        	board.setRenamedFileName(renamedFileName);
    	} 
    	
    	result = new BoardService().save(board);
    	
    	if(result > 0) {
    		request.setAttribute("msg", "게시글 수정 성공");
    	} else {
    		request.setAttribute("msg", "게시글 실패 성공");
    	}
    	
    	request.setAttribute("location", "/board/view?no=" + board.getNo());
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
