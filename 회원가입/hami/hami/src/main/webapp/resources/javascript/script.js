/**
 * ID 중복체크 검사하는 함수
 */
function idCheck(id){
	if(id == ""){
		alert('아이디를 입력해 주세요');
	}else{
		url = "idCheck.jsp?id="+id;
		window.open(url, "post", "width=300, height=180");
	}
}


/*
 * 우편번호 검색하는
 */
function zipCheck(){
	url = "ZipCheck.jsp?check=y";	//Get 방식으로 전송
	window.open(url, "windowZipcode", "width=500, height=700, scrollbars=yes");
}

/*
 * 데이터 입력 유무 체크 함수
 */
function inputCheck(){
	if(document.join.id.value==""){
		alert('아이디를 입력하세요');
		document.join.id.focus();
	}
	else if(document.join.passwd.value==""){
		alert('비밀번호를 입력하세요');
		document.join.passwd.focus();
	}
	else if(document.join.email.value==""){
		alert('이메일을 입력하세요');
		document.join.email.focus();
	}
	else if(document.join.zipcode.value==""){
		alert('우편번호를 입력하세요');
		document.join.zipcode.focus();
	}else if(document.join.address2.value==""){
		alert('상세주소를 입력하세요');
		document.join.address2.focus();
	}else{
	//서버로 데이터 전송(submit 버튼을 누른 효과)
	document.join.submit();
	}
}