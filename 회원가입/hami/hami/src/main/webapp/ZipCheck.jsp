<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!-- 추가 -->
<%@ page import="com.company.hami.member.UserDAO" %>
<%@ page import="com.company.hami.member.ZipcodeBean" %>
<%@ page import="java.util.*" %>

<%
	request.setCharacterEncoding("EUC-KR");
	String check = request.getParameter("check");
	String area3 = request.getParameter("area3");

	//주의
	Vector<ZipcodeBean> zipcodeList = new Vector<ZipcodeBean>();
	UserDAO manager=UserDAO.getInstance();
	zipcodeList = manager.zipCheck(area3);
	int totalList = zipcodeList.size();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script language="javascript" src="./resources/javascript/script.js" charset="utf-8"></script>
<script>
   function dongCheck(){
      if(document.zipForm.area3.value==''){
         alert('동 이름을 입력해주십시오.(예)개포1동');
         document.zipForm.area3.focus();
         return;
      }
      document.zipForm.submit();
   }

   function sendAddress(zipcode,area1,area2,area3,area4){
      var address1=area1+" "+area2+" "+area3+" "+area4;
      opener.document.join.zipcode.value=zipcode;
      opener.document.join.address1.value=address1;
      self.close();
   }

</script>
</head>
<body>
<center>
	<b>우편번호 찾기</b>
	<table>
	<form name="zipForm" method="POST" action="ZipCheck.jsp">
		<tr>
			<td><br>
			동이름 입력: <input name="area3" type="text">
			<input type="button" value="검색" onClick="dongCheck();">
			</td>
		</tr>
		<input type="hidden" name="check" value="n">
		</form>
		<%
			if(check.equals("n")){
		%>
		<%
			if(zipcodeList.isEmpty()){
		%>
		<tr><td lign="center"><br>검색된 결과가 없습니다.</td></tr>
		<%	}
			else{
		%>
		<tr><td lign="center"><br>
		** 검색후, 아래 우편번호를 클릭하면 자동으로 우편번호와 주소가 입력됩니다.
			</td>
		</tr>
		<%
			for(int i=0; i<totalList; i++){
				ZipcodeBean zip = zipcodeList.elementAt(i);
				String tempZipcode = zip.getZipcode();
				String tempArea1 = zip.getArea1();
				String tempArea2 = zip.getArea2();
				String tempArea3 = zip.getArea3();
				String tempArea4 = zip.getArea4();
		%>
		<tr>
			<td>
				 <a href="javascript:sendAddress('<%=tempZipcode%>',
				 								'<%=tempArea1%>',
				 								'<%=tempArea2%>',
				 								'<%=tempArea3%>',
				 								'<%=tempArea4%>');">
												<%=tempZipcode%>&nbsp;
												<%=tempArea1%>&nbsp;
												<%=tempArea2%>&nbsp;
												<%=tempArea3%>&nbsp;
												<%=tempArea4%></a><br>
		<%
			}
		}
		%>
		<% } %>
			</td>
		</tr>
		<tr>
			<td align="center">
			<br><a href="javascript:this.close();"></a></td>
		</tr>
	</table>
</center>
</body>
</html>
