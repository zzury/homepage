package com.company.hami.member;


import java.sql.*; //Connection, DriverManager, PrepareStatement, ResultSet, SQLException
import java.util.*;	//Vector

import com.company.hami.common.JDBCUtil;

public class UserDAO {
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	
	//DB 관련 멤버변수 선언
	private Connection			conn=null;
	private PreparedStatement	pstmt = null;
	private ResultSet			rs=null;
	
	//H2 JDBC 연동
	private final String Member_Insert = "insert into member(id, passwd, email, zipcode, address1, address2)values(?,?,?,?,?,?)";
	
	 //사용자 정의 메소드
	      public int confirmId(String id) {
	    	  int idDuplication = 0;	//id 중복 여부 체크 변수
	    	  
	    	  try {
	    		  //해킹 대비=> PreparedStatement 방식으로 구현한다.
	    		  String ConfirmId_SELECT = "select id from member where id=?";

		    	  conn= JDBCUtil.getConnection();
	    		  pstmt = conn.prepareStatement(ConfirmId_SELECT);
	    		  pstmt.setString(1, id);
	    		  rs = pstmt.executeQuery();
	    		  
	    		  
	    		  if(rs.next()) {
	    			  idDuplication = 1;	//ID가 중복
	    		  }else {
	    			  idDuplication = -1;	//사용 가능한 ID(중복 되지 않음!)
	    		  }
	    		  
	    	  }catch(Exception e) {
	    		  System.out.println("confirmId():" + e);
	    	  }finally {
	    		  JDBCUtil.close(conn, pstmt);
	    	  }
	    	  return idDuplication;
	      }//end confirmId()
	      
	      public Vector<ZipcodeBean> zipCheck(String area3) throws Exception{
	  		
	  		Vector<ZipcodeBean> list = new Vector<ZipcodeBean>();
	  		try {
	  			String AREA3_SELECT = "select * from zipcode where area3 like '%"+area3+"%'";
	  			conn= JDBCUtil.getConnection();
	  			pstmt = conn.prepareStatement(AREA3_SELECT);
	  			rs = pstmt.executeQuery();
	  			
	  			while(rs.next()) {
	  				ZipcodeBean zip = new ZipcodeBean();
	  				zip.setZipcode(rs.getString("zipcode"));
	  				zip.setArea1(rs.getString("area1"));
	  				zip.setArea2(rs.getString("area2"));
	  				zip.setArea3(rs.getString("area3"));
	  				zip.setArea4(rs.getString("area4"));
	  				
	  				list.add(zip);
	  			}
	  		}catch(Exception e){
	  			System.out.println(e);
	  		}finally {
	  			JDBCUtil.close(conn, pstmt);
	  		}
	  		return list;
	  	}
	
	public void insertMember(UserVO vo) {
		System.out.println("===>JDBC로 insertMember() 기능처리");
		
		try {
			conn= JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(Member_Insert);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPasswd());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getZipcode());
			pstmt.setString(5, vo.getAddress1());
			pstmt.setString(6, vo.getAddress2());
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("insertMember()" + e);
		}finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
}