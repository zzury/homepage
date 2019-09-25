<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
                 <div class="month">August 2014</div>
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
               <ul class="days">
                   <li class="day other-month">
                       <div class="date">27</div>
                   </li>
                   <li class="day other-month">
                       <div class="date">28</div>
                   </li>
                   <li class="day other-month">
                       <div class="date">29</div>
                   </li>
                   <li class="day other-month">
                       <div class="date">30</div>
                   </li>
                   <li class="day other-month">
                       <div class="date">31</div>
                   </li>
                   <!-- Days in current month -->
                   <li class="day">
                       <div class="date">1</div>
                   </li>
                   <li class="day">
                       <div class="date">2</div>
                   </li>
               </ul>
                   <!-- Row #2 -->
               <ul class="days">
                   <li class="day">
                       <div class="date">3</div>
                   </li>
                   <li class="day">
                       <div class="date">4</div>
                   </li>
                   <li class="day">
                       <div class="date">5</div>
                   </li>
                   <li class="day">
                       <div class="date">6</div>
                   </li>
                   <li class="day">
                       <div class="date">7</div>
                   </li>
                   <li class="day">
                       <div class="date">8</div>
                   </li>
                   <li class="day">
                       <div class="date">9</div>
                   </li>
               </ul>
                   <!-- Row #3 -->
               <ul class="days">
                   <li class="day">
                       <div class="date">10</div>
                   </li>
                   <li class="day">
                       <div class="date">11</div>
                   </li>
                   <li class="day">
                       <div class="date">12</div>
                   </li>
                   <li class="day">
                       <div class="date">13</div>
                   </li>
                   <li class="day">
                       <div class="date">14</div>
                   </li>
                   <li class="day">
                       <div class="date">15</div>
                   </li>
                   <li class="day">
                       <div class="date">16</div>
                   </li>
               </ul>
                   <!-- Row #4 -->
               <ul class="days">
                   <li class="day">
                       <div class="date">17</div>
                   </li>
                   <li class="day">
                       <div class="date">18</div>
                   </li>
                   <li class="day">
                       <div class="date">19</div>
                   </li>
                   <li class="day">
                       <div class="date">20</div>
                   </li>
                   <li class="day">
                       <div class="date">21</div>
                   </li>
                   <li class="day">
                       <div class="date">22</div>
                   </li>
                   <li class="day">
                       <div class="date">23</div>
                   </li>
               </ul>
                       <!-- Row #5 -->
               <ul class="days">
                   <li class="day">
                       <div class="date">24</div>
                   </li>
                   <li class="day">
                       <div class="date">25</div>
                   </li>
                   <li class="day">
                       <div class="date">26</div>
                   </li>
                   <li class="day">
                       <div class="date">27</div>
                   </li>
                   <li class="day">
                       <div class="date">28</div>
                   </li>
                   <li class="day">
                       <div class="date">29</div>
                   </li>
                   <li class="day">
                       <div class="date">30</div>
                   </li>
               </ul>
               <!-- Row #6 -->
               <ul class="days">
                   <li class="day">
                       <div class="date">31</div>
                   </li>
                   <li class="day other-month">
                       <div class="date">1</div> <!-- Next Month -->
                   </li>
                   <li class="day other-month">
                       <div class="date">2</div>
                   </li>
                   <li class="day other-month">
                       <div class="date">3</div>
                   </li>
                   <li class="day other-month">
                       <div class="date">4</div>
                   </li>
                   <li class="day other-month">
                       <div class="date">5</div>
                   </li>
                   <li class="day other-month">
                       <div class="date">6</div>
                   </li>
               </ul>
           </div><!-- /. calendar -->
       </div><!-- /. wrap -->
       <br><br>
       <div class="reservation_form">
         
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