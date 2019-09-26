<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.company.hami.member.UserDAO"%>
    
<%
    	request.setCharacterEncoding("EUC-KR");
    %>
<%
	String id = request.getParameter("id");
	UserDAO manager = UserDAO.getInstance();
	int idCheck = manager.confirmId(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="0" align="center">
		<tr>
			<td align="center">
			<%
				if(idCheck == 1){	//ID가 중복된 경우
			%>
			<br>
			<%= id %> 는 이미 존재하는 ID 입니다.(ID중복)&nbsp;<br><br>
			
			<input type="button" value="닫기" onClick="javascript:self.close();
						opener.document.join.id.foucus();">
			<%	}else{ %>
			<br>
			<%= id %>는 사용 가능한 ID 입니다. &nbsp;<br><br>
			<input type="button" value="닫기" onClick="javascript:self.close();
						opener.document.join.passwd.foucus();">
			<%}%>
			</td>
		</tr>
	</table>
</body>
</html>