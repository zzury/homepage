<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.Calendar"%>
<%
	Calendar cal = Calendar.getInstance(); //이번 달 저장을 위한
	Calendar cal2 = Calendar.getInstance(); //저번 달 저장을 위해 현재 날짜를 저장
	cal2.set(Calendar.MONTH,-1); //저번 달로 이동
	
	int cal_last = cal.getActualMaximum(Calendar.DATE); //이번 달의 전체 날짜
	int cal2_last = cal2.getActualMaximum(Calendar.DATE); //전달의 전체 날짜
	
	int year = cal.get(Calendar.YEAR); //2019 : 현재 년도
	int month = cal.get(Calendar.MONTH)+1;	//9 : 현재 달
	int date = cal.get(Calendar.DATE);	//25 : 현재 일
	
	cal.set(Calendar.DATE,1);	//1일로 셋
	int first_day = cal.get(Calendar.DAY_OF_WEEK); //일요일 1, 토요일 7
	
	int cal2_days = first_day-2; //일요일 -1, 토요일 5
	int prev_index = cal2_days; //인덱스로 받아와 하나씩 줄이며 마이너스한다.
	int cur_index = 1; //이번달의 시작일
	int next_index = 1; //다음달의 시작일
	
	String[] month_eng = {"JANUARY","FEBRUARY","MARCH","APRIL","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER"};
	
	int index = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>HAMI - 예약하기</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
<style> /*달력 css*/
.month{
  color: black;
  font-size: 25px;
  line-height:50px;
  font-weight: bold;
  text-align:center;
}
#calendar-wrap{
  margin:0 auto;
  width: 709px;
}
body {
font-family: Tahoma;
}
.form_title{
text-align: center;
}
#calendar {
width: 720px;
height: auto;
}
/*#calendar a {
color: #8e352e;
text-decoration: none;
}*/
#calendar ul{
list-style: none;
padding: 0;
margin: 0;
width: 100%;
}
#calendar .days{
  height:85px;
}
#calendar li {
display: block;
float: left;
width: 14.342%;
padding: 5px;
box-sizing: border-box;
border: 1px solid #ddd;
margin-right: -1px;
margin-bottom: -1px;
}
#calendar ul.weekdays { /*요일 전체 셀*/
width: 708px;
height: 23px;
background: black;
}
#calendar ul.weekdays li { /*요일*/
text-align: center;
text-transform: uppercase;
line-height: 20px;
border: none !important;
padding: 1px 6px;
color: white;
font-size: 13px;
}
#calendar .days li { /*날짜 셀 */
width: 102px;
height: 85px;
}
#calendar .days li:hover { /*날짜 셀 호버 */
background: #e4f2f2;
}
#calendar .date { /*날짜 */
text-align: center;
margin-bottom: 5px;
padding: 4px;
color: #333;
width: 20px;
float: right;
}
#calendar .other-month {
background: #f5f5f5;
color: #666;
}
/* ============================
      Mobile Responsiveness
 ============================*/
@media screen and (min-width: 631px) and (max-width: 1200px) {
  #container{
    width:100%;
  }
}
/*phone*/
@media screen and (max-width:630px){
  #container{
    width:100%;
  }
  #calendar-wrap{
    width:100%;
  }
  #calendar{
    width:100%;
  }
  #calendar ul.weekdays { /*요일 전체 셀*/
  width: 100%;
  height: 23px;
  background: black;
  }
  #calendar .days{ /*날짜 셀 */
  display:flex;
  height: 70px;
  }
  #calendar .days li { /*날짜 셀 */
  flex-grow:1;
  height: 70px;
  }
}
	
#time_wrap{
  margin-top:15px;
  width:696px;
  border:1px solid #ddd;
  padding:5px;
  text-align:center;
}
#time_wrap .lab_wrap{
  padding-left:15px;
  padding-right:15px;
}
.time_label{
  float:left;
}
.time_small_lab{
  float:right;
}
#time_btn{
  list-style:none;
  margin:0;
  padding:0;
  display:inline-block;
}
#time_btn li{
  border: 1px solid #ddd;
  float:left;
  padding:10px;
}
.time_label{
  font-size:15px;
}
.time_small_lab{
  font-size:12px;
}
</style>
<script>
function nav_span(){
  document.getElementById('nav-icon').classList.toggle('open');
  document.getElementById('nav').classList.toggle('open');
}
</script>
</head>
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
  <div id="calendar-wrap">
           <div class="form_title">
               <h1> RESERVATION</h1>
           </div>
           <div id="calendar">
                 <div class="month"><%=month_eng[month]%> <%=year%></div>
               <ul class="weekdays">
                   <li>Sunday</li>
                   <li>Monday</li>
                   <li>Tuesday</li>
                   <li>Wednesday</li>
                   <li>Thursday</li>
                   <li>Friday</li>
                   <li>Saturday</li>
               </ul>
               <!-- Days from previous month -->
               <%
               for (int i=0;i<6;i++){%>
            	   <ul class="days">
            	  <%for (int j=0;j<7;j++){
            	  		if(index<cal2_days){%>
            		  	<li class="day other-month">
                       		<div class="date"><%=cal2_last-prev_index%></div>
                   		</li>
            	   <%	prev_index--;
            	  		}else if(index<(cal2_days+cal_last)+1){%>
            	  			<li class="day" onclick="selectDate(<%=year%>,<%=month%>,<%=cur_index%>)">
                            	<div class="date"><%=cur_index %></div>
                        	</li>
                        	
            	  	<%cur_index++;
            	  		}else{%>
            	  			<li class="day other-month">
                       			<div class="date"><%=next_index%></div>
                   			</li>
            	  	<%	next_index++;
            	  		}
            	  		index++;
            	  	}
            	  %>
            	  </ul>
             <% }
               %>
           </div><!-- /. calendar -->
       </div><!-- /. wrap -->
       <br><br>
       <div class="reservation_form">
         <form action="makereservation.do" method="POST">
         <input type="text" id="year"/>
         <input type="text" id="month"/>
         <input type="text" id="date"/>
         <input type="submit" value="집좀가고싶다진짜아아아"/>
        </form>
       </div>
      <fieldset>
        <legend>notice</legend>
            <div class="notice">
              <h3>예약안내</h3>
                    ① 예약은 회원제로 진행됩니다.<br>
                    ② 올바른 예약문화를 위해 예약금을 받겠습니다.<br>
                    ③ 예약변경시 연락하세요 주리찡 HTML 개잘짠다 ㅇㅈㅇㅈ
                    </div><br>
      </fieldset>
    </div>
</body>
</html>
