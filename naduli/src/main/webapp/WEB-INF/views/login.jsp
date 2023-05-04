<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NADULI</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	*{
		
	
	}
	.main_container{
		margin : 0 auto;
		width : 1200px;
		border : 1px solid red;
	}
	#membership_box{
		margin : 0 auto;
		border : 1px solid blue;
		width: 800px; 
	
	}
</style>
</head>
<body>
<h1>Login</h1>
<div class="main_container">
	<div id="membership_box">
		<form method="get" name="frm" action="/loginMember">
			<div id="label_box">
				<h4><label>아이디</label></h4>
				<input type="text" id="id" name="id" placeholder="아이디를 입력하세요.">
			</div><div id="label_box">
				<h4><label>패스워드</label></h4>
				<input type="password" id="pw" name="pw" placeholder="패스워드를 입력하세요.">
			</div>
			<div>
				<input type="submit" value="로그인">
			</div>
		</form>
	</div>
</div>
</body>
</html>