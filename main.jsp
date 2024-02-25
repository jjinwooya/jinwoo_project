<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<script>
	function home() {
 		//alert("~!");함수 호출 확인
 		window.open("main.jsp");
	}
	function logIn() {
		//alert("^^");함수 호출 확인
		window.open("login.jsp");// 일단 로그인 jsp는 만들지 않음. 
	}
	
	function gaip() {
		//alert("@@");함수 호출 확인
		window.open("final_exam.jsp");
	}
	
	
</script>
<body>
<div align ="right">
 		HOME<input type ="button" value="홈" onclick="home()"><br> 
 		로그인<input type ="button" value="로그인" onclick="logIn()"><br>
 		회원가입<input type ="button" value="회원가입" onclick="gaip()"><br>
 
<hr>
</div>
<div align ="center">

<h1>final_exam_main</h1>
<h3>회원가입 링크 클릭하세요</h3>
</div>
</body>
</html>