<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 페이지</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css">
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
        <div id="loginForm">
           <h1>LOGIN</h1><hr>
              <fieldset>
                <legend>info</legend><br>
                  <div class="info">로그인이 필요한 서비스 입니다.<br>
                    Hami의 회원이 아니시면 회원가입을 해주세요.</div><br>
                  <div class="login">
                    <form action="login.do" method="POST">
                      <p><label for="id">아이디</label>
                        <input type="text" name="id" id="id" size="43"></p>
                      <p><label for="passwd">비밀번호</label>
                        <input type="password" name="passwd" id="passwd" size="43"></p>
                        <button type="submit">로그인</button>
                    </form>
                  </div>
                  <div class="join">
                    <button type="button" onclick="location.href=#">회원가입</button>
                  </div>
              </fieldset>
          </div>
    </div>
</body>
</html>