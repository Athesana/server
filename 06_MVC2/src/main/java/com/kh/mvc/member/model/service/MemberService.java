package com.kh.mvc.member.model.service;

import java.sql.Connection;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

import com.kh.mvc.common.jdbc.JDBCTemplate;
import com.kh.mvc.member.model.dao.MemberDao;
import com.kh.mvc.member.model.vo.Member;

public class MemberService {
	
	private MemberDao dao = new MemberDao();

	public Member login(String id, String password) {
		Connection connection = getConnection();
		
		Member member = dao.findMemberById(connection, id);
		
		close(connection);
		
		if(member != null && member.getPassword().equals(password)) {
			return member;
		} else {
			return null;
		}
		
	}

	public int save(Member member) {
		int result = 0;
		Connection connection = getConnection();
		
		result = dao.insertMember(connection, member);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

}
