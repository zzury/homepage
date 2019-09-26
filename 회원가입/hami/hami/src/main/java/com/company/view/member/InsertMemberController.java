package com.company.view.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.company.hami.member.UserDAO;
import com.company.hami.member.UserVO;

public class InsertMemberController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//request.setCharacterEncoding("EUC-KR");
		
				System.out.println("회원가입처리");
				

				String id = request.getParameter("id");
				String passwd = request.getParameter("passwd");
				String email = request.getParameter("email");
				String zipcode = request.getParameter("zipcode");
				String address1 = request.getParameter("address1");
				String address2 = request.getParameter("address2");
				
				UserVO vo = new UserVO();
				vo.setId(id);
				vo.setPasswd(passwd);
				vo.setEmail(email);
				vo.setZipcode(zipcode);
				vo.setAddress1(address1);
				vo.setAddress2(address2);
				
				UserDAO userDAO = new UserDAO();
				userDAO.insertMember(vo);
				
				ModelAndView mav = new ModelAndView();
				mav.setViewName("Join");
				
				return mav;
			}

}
