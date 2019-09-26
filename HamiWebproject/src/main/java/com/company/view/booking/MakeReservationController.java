package com.company.view.booking;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.company.hami.booking.BookingVO;

public class MakeReservationController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 //1. 사용자 입력 정보 추출
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String date = request.getParameter("date");
        
        //2. 데이터베이스 연결
        BookingVO vo = new BookingVO();
        BookingDAO bookingDAO = new BookingDAO();
        //1~9월에 0 붙이는 처리는 내일할래
        vo.setRes_date(year+"-"+month+"-"+date);
        bookingDAO.makeReservation(vo);
        
        
        //3. 포워딩
        ModelAndView mav = new ModelAndView();
        mav.setViewName("index");
        return mav;
     }

}
