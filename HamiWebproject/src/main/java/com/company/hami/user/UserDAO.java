package com.company.hami.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.company.hami.common.JDBCUtil;
import com.company.hami.user.UserVO;

public class UserDAO {
	private Connection			conn = null;
	private PreparedStatement	stmt = null;
	private ResultSet			rs = null;
	
	//SQL 명령어
			private final String USER_GET = "select * from user where id=? and passwd=?";
			
			public UserVO getUser(UserVO vo) {
				UserVO user = null;
				
				try {
					conn = JDBCUtil.getConnection();
					stmt = conn.prepareStatement(USER_GET);
					stmt.setString(1, vo.getId());
					stmt.setString(2, vo.getPasswd());
					rs = stmt.executeQuery();
					
					if(rs.next()) {
						user = new UserVO();
						user.setId(rs.getString("ID"));
						user.setPasswd(rs.getString("PASSWD"));
						user.setName(rs.getString("NAME"));
						user.setEmail(rs.getString("EMAIL"));
						user.setAddress(rs.getString("ADDRESS"));
						user.setRank(rs.getInt("rank"));
					}			
				}catch(Exception e) {
						System.out.println("getUser() 처리에서 오류 발생" + e);
				}finally {
					JDBCUtil.close(rs, conn, stmt);	
				}
				return user;
			}

}
