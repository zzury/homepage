package com.company.hami.booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.company.hami.common.JDBCUtil;
import com.company.hami.booking.BookingVO;

public class BookingDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	// SQL 명령어
	private final String MAKE_RESERVE = "insert into booking(res_num,res_date,res_time,prepayment,id,d_name,d_weight,demend) values((select nvl(max(res_num),0)+1 from booking),?,?,?,?,?,?,?)";
	// 일단 엉망으로 더미데이터를 넣어보았다.
	private final String CANCEL_RESERVE = "";

	// makeReservation(BookingVO vo)
	public void makeReservation(BookingVO vo) {
		System.out.println("makeReservation 기능 처리 완료 ");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MAKE_RESERVE);
			// "2019-09-30"와 같은 폼
			// 즉 안을 추후에 vo.Res_date()등으로 대체한다.
			stmt.setDate(1, java.sql.Date.valueOf(vo.getRes_date()));			
			stmt.setInt(2, vo.getRes_time()); 
			stmt.setInt(3, vo.getPrepayment());
			
			stmt.setString(4, vo.getId()); 
			stmt.setString(5, vo.getD_name());
			stmt.setInt(6, vo.getD_weight());			  
			stmt.setString(7, vo.getDemend());
			
			stmt.executeUpdate();
			System.out.println("성공적으로 예약되었음");

		} catch (Exception e) {
			System.out.println("오류 발생으로 예약이 처리되지 않았습니다 : " + e);
		} finally {
			JDBCUtil.close(rs, conn, stmt);
		}
	}
}
