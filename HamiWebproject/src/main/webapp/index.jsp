<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>HAMI 해미</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
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
  <div class="bg_wrapper_1">
    <div class="bg_image_1"></div>
    <div class="bg_shadow_1"></div>
    <div class="main_content_1">해미는<br>모든 강아지를<br>사랑합니다!</div>
  </div>
<footer>
  <div id="footer_wrap">
    <div id="company_name">Hamham Company</div>
    <div id="contact_us">
      Tel : 010-8612-1869<br>Add : 서울시 영등포구 가마산로 63길 7-2 5층
    </div>
  </div>
</footer>
</body>
</html>
