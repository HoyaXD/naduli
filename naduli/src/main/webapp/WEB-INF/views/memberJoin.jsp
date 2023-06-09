<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Naduli join the Membership</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	#label_box input{
		width: 280px;
		height: 30px;	
	}
	label_box .zip_code{
	  	width: 50px;
	}
	select{
		width: 280px;
		height: 37px;
	}
	#label_box2 input{
		width: 280px;
		height: 30px;
		margin-bottom: 5px; 
	}
	input[id="detailAddress"]{
		width: 380px;
	}
</style>
</head>
<body>
<h1>Naduli 회원가입</h1>
<div class="main_container">
	<div id="membership_box">
		<form method="post" name="frm" action="/registerMember">
			<div id="label_box">
				<h4><label>아이디</label></h4>
				<input type="text" name="getId" placeholder="ID를 입력하세요.">@
				<select id="mail" name="email">
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="nate.com">nate.com</option>
					<option value="gmail.com">gmail.com</option>
					<option>직접입력</option>
				</select>
			</div>
			<div id="label_box">
				<h4><label>패스워드</label></h4>
				<input type="password" id="pw" name="pw" placeholder="패스워드를 입력하세요.">
			</div>
			<div id="label_box">
				<h4><label>패스워드 확인</label></h4>
				<input type="password" id="pwCheck" name="pwCheck" placeholder="패스워드를 재입력하세요.">
				<span id="pwCheckComment"></span>
			</div>
			<div id="label_box">
				<h4><label>이름</label></h4>
				<input type="text" name="name" placeholder="이름을 입력하세요.">
			</div>
			<div id="label_box">
				<h4><label>전화번호</label></h4>
				<input type="text" name="tel" placeholder="전화번호를 입력하세요.(ex 010-1111-1111)">
			</div>
			<div id="label_box2">
				<h4><label>주소</label></h4>
				<input type="text" name="postCode" id="postcode" placeholder="우편번호" readonly>
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" readonly><br>
				<input type="text" name="getAddress" id="address" placeholder="주소" readonly><br>
				<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
				<input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목">
			</div>
			<input type="submit" value="회원가입" onclick="return validationCheck();">
		</form>
	</div>
</div>
<script>
	
	//pw중복체크
	$('#pwCheck').focusout(function() {  
        let passRule = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
        let pw = document.frm.pw.value;
        if(document.frm.pwCheck.value != ""){
            if (pw.length < 8) {
                document.getElementById("pwCheckComment").innerHTML ="<span style='color:red'>비밀번호는 8글자 이상이어야 합니다.</span>";
            }else if (pw.length > 20) {
                document.getElementById("pwCheckComment").innerHTML ="<span style='color:red'>비밀번호는 20글자를 초과할 수 없습니다.</span>";
            }else if (!passRule.test(pw)) {
                document.getElementById("pwCheckComment").innerHTML ="<span style='color:red'>비밀번호는 특수문자,영문,숫자 모두 포함해야 합니다.</span>";
            }else if(document.frm.pw.value == document.frm.pwCheck.value){
                document.getElementById("pwCheckComment").innerHTML = "<span style='color:green'>비밀번호 일치합니다.</span>";
            }else {
                document.getElementById("pwCheckComment").innerHTML = "<span style='color:red'>비밀번호가 일치하지 않습니다.</span>";
            }
        }
    });

	//카카오 주소검색 
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
	
	//유효성검사
	function validationCheck(){
		if(document.frm.id.value ==''){
			alert("아이디를 입력해주세요.");
			document.frm.id.focus();
			return false;
		}else if(document.frm.pw.value ==''){
			alert("비밀번호를 입력해주세요.");
			document.frm.pw.focus();
			return false;
		}else if(document.frm.pwCheck.value ==''){
			alert("비밀번호 확인을 입력해주세요.");
			document.frm.pwCheck.focus();
			return false;
		}else if(document.frm.name.value ==''){
			alert("이름을 입력해주세요.");
			document.frm.id.focus();
			return false;
		}else if(document.frm.tel.value ==''){
			alert("전화번호를 입력해주세요.");
			document.frm.tel.focus();
			return false;
		}else if(document.frm.address.value ==''){
			alert("주소를 입력해주세요.");
			document.frm.address.focus();
			return false;
		}else if(document.getElementById("pwCheckComment").innerText != "비밀번호 일치합니다."){
			alert("비밀번호가 일치하지 않습니다.");
			document.frm.pw.focus();
			return false;
		}else {
			return true;
		}
	}
</script>
</body>
</html>