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

	// SQL ��ɾ�
	private final String MAKE_RESERVE = "insert into booking(res_num,res_date,res_time,prepayment,id,d_name,d_weight,demend) values((select nvl(max(res_num),0)+1 from booking),?,?,?,?,?,?,?)";
	// �ϴ� �������� ���̵����͸� �־�Ҵ�.
	private final String CANCEL_RESERVE = "";

	// makeReservation(BookingVO vo)
	public void makeReservation(BookingVO vo) {
		System.out.println("makeReservation ��� ó�� �Ϸ� ");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MAKE_RESERVE);
			// "2019-09-30"�� ���� ��
			// �� ���� ���Ŀ� vo.Res_date()������ ��ü�Ѵ�.
			stmt.setDate(1, java.sql.Date.valueOf(vo.getRes_date()));			
			stmt.setInt(2, vo.getRes_time()); 
			stmt.setInt(3, vo.getPrepayment());
			
			stmt.setString(4, vo.getId()); 
			stmt.setString(5, vo.getD_name());
			stmt.setInt(6, vo.getD_weight());			  
			stmt.setString(7, vo.getDemend());
			
			stmt.executeUpdate();
			System.out.println("���������� ����Ǿ���");

		} catch (Exception e) {
			System.out.println("���� �߻����� ������ ó������ �ʾҽ��ϴ� : " + e);
		} finally {
			JDBCUtil.close(rs, conn, stmt);
		}
	}
}
