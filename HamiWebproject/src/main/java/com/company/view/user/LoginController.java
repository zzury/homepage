package com.company.view.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.company.hami.user.UserDAO;
import com.company.hami.user.UserVO;

public class LoginController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//1. 사용자 입력 정보 추출
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		//2. 데이터베이스 연결
		UserVO vo = new UserVO();
		UserDAO userDAO = new UserDAO();
		
		vo.setId(id);
		vo.setPasswd(passwd);
		
		UserVO user = userDAO.getUser(vo);
		
		//3. 포워딩
		ModelAndView mav = new ModelAndView();
		if(user != null) {
			//로그인 성공
			/* view의 이름 앞에 redirect:를 붙이는 이유
			 * -> ViewResolver가 설정되어 있더라도 이를 무시하고 redirect한다.
			 * 그리고 로그인에 성공했을 때 실행되는 GetBoardListController에서는
			 * 확장자 '.jsp'를 제거해야 한다.
			 */
			HttpSession session = request.getSession();
			session.setAttribute("id", user.getId());
			mav.setViewName("index");
		}else {
			//로그인 실패
			mav.setViewName("redirect:login.jsp");
		}return mav;
	}

}
