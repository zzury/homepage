package com.company.hami.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBCUtil {
	//H2 DB 연동
	static final String driver="org.h2.Driver";
	static final String url="jdbc:h2:tcp://localhost/~/test";
	
	//DB 연결객체 만드는 메소드
	public static Connection getConnection() throws Exception{
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,"sa","");
			return con;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//select 작업 종료시 자원 해제시키는 메소드
	public static void close(ResultSet rs, Connection con, PreparedStatement stmt) {
		if(rs!=null) {
			try {
				if(!rs.isClosed()) { //resultset이 closed되지 않았다면
					rs.close();//rs를 close시켜라
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				rs = null;
				
			}
		}//resultset
		
		if(stmt!=null) {
			try {
				if(!stmt.isClosed()) {
					stmt.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				stmt = null;
				
			}
		}//preparedstatement
		
		if(con!=null) {
			try {
				if(!con.isClosed()) {
					con.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				con = null;
				
			}
		}//connection
		
	}
	
	
	//DML 작업 종료시 자원 해제시키는 메소드
	
	public static void close(Connection con, PreparedStatement stmt) {
		if(stmt!=null) {
			try {
				if(!stmt.isClosed()) { //resultset이 closed되지 않았다면
					stmt.close();//rs를 close시켜라
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				stmt = null;
				
			}
		}//preparedstatement
		
		if(con!=null) {
			try {
				if(!con.isClosed()) {
					con.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				con = null;
				
			}
		}//connection
	}
	
	
}
