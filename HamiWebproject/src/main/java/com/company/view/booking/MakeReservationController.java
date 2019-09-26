package com.company.view.booking;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.company.hami.booking.BookingDAO;
import com.company.hami.booking.BookingVO;

public class MakeReservationController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("makeReservation 준비");	
			//1. 사용자 입력 정보 추출
			/*
			 * String year = request.getParameter("res_year"); String month =
			 * request.getParameter("res_month"); String date =
			 * request.getParameter("res_date"); String res_time =
			 * request.getParameter("res_time");
			 */	
				//날짜와 시간은 달력에서 받아오게 수정해줘야 함!!
				String year = "2019";
				String month = "3";
				String date = "5";
				String res_time = "13";
				
				String prepayment = request.getParameter("prepayment");
				
				String id = request.getParameter("id");
				String d_name = request.getParameter("d_name");
				String d_weight = request.getParameter("d_weight");
				String demend = request.getParameter("demend");
				
				//2. 데이터베이스 연결
				BookingVO vo = new BookingVO();
				
				//1~9월에 0 붙이는 처리는 내일할래		
				if(month.length()==1) { month="0"+month; }
				if(date.length()==1) { date="0"+date; }		 
				vo.setRes_date(year+"-"+month+"-"+date);
				
				vo.setRes_time(Integer.parseInt(res_time));
				vo.setPrepayment(Integer.parseInt(prepayment));
				
				vo.setId(id);
				vo.setD_name(d_name);
				vo.setD_weight(Integer.parseInt(d_weight));
				vo.setDemend(demend);
				
				BookingDAO bookingDAO = new BookingDAO();
				
				bookingDAO.makeReservation(vo);				
				//3. 포워딩
				ModelAndView mav = new ModelAndView();
				mav.setViewName("index");
				
				return mav;
			}
}
