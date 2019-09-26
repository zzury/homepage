<%@ page language="java" contentType="text/html; charset=EUC-KR"
    	 pageEncoding="EUC-KR"%>
<%@ page import="com.company.hami.booking.BookingDAO" %>
<%@ page import="com.company.hami.booking.BookingVO" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>예약폼</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/makeReservationForm.css">
<script>
    function form_verifing(){
    	if(document.bookingForm.id.value!=""){
    		document.bookingForm.submit();
    	}
    }
</script>
</head>
<body>
 <body>
	<header>
    <div id="lineheader">
    <div id="title"><a href="index.jsp"><img src="${pageContext.request.contextPath}/resources/img/title.png"/></a></div>
    <div id="nav-icon" onClick="nav_span()">
      <span></span>
      <span></span>
      <span></span>
    </div>
      <nav id="nav">
        <ul>
          <a href="#"><li>오시는길</li></a>
          <%
			String session_id = (String) session.getAttribute("id");
			if(session_id==null) {
			//user id가 세션으로 넘어오지 않았다면 로그인 상태가 아님%>
				<a href="login.jsp"><li>로그인</li></a>
			<%}else{%>
				<a href="logout.do"><li>로그아웃</li></a>
			<%}%>
          <a href="#"><li>마이페이지</li></a>
          <a href="reservation.jsp"><li>예약 안내</li></a>
          <a href="#"><li>선생님 소개</li></a>
        </ul>
      </nav>
      </div>
  </header>
  <div id="container">
        <div id="info">
           <h1>Hami 예약안내</h1><hr>
                    <ul>
                      <li>* &nbsp; Hami는 올바른 예약문화를 위해 <span>예약금</span>을 받고 있습니다.</li>
	            			  <li>* &nbsp; 예약금은 전체 미용금액에서 <span>차감</span>됩니다. </li>
	            			  <li>* &nbsp; <span>예약 취소나 변경</span>은 Hami로 연락주세요.</li>
                    </ul>
                  </div>

                  <div id="bookingForm">
                    <form name="bookingForm" action="makereservation.do" method="post">
    	            		<input type="hidden" name="res_year">
    	            		<input type="hidden" name="res_date">
    	            		<input type="hidden" name="res_time">
    	            		
    	             <p><label for="prepayment">선결제</label>
                        <input type="text" name="prepayment" id="prepayment" size="43"></p>	
                      <p><label for="id">보호자 ID</label>
                        <input type="text" name="id" id="id" size="43"></p>
                      <p><label for="d_name">반려견 이름</label>
                        <input type="text" name="d_name" id="d_name" size="43"></p>
                      <p><label for="passwd">반려견 몸무게 </label>
                        <select name="d_weight">
                          <option selected>--선택해주세요--</option>
                          <option value="1"> ~5kg </option>
                          <option value="2"> 5kg ~ 10kg </option>
                          <option value="3"> 10kg ~ 15kg </option>
                        </select></p>
                      <p><label style="display:block;" for="demend">요청사항</label>
                        <textarea name="demend" id="demend" rows="10" cols="50"></textarea>

                  <div class="rsvt">
                    <button type="button" onclick="form_verifing()">예약하기</button>
                  </div>
			</form>
          </div>
    </div>  
    </body>
</body>
</html>
