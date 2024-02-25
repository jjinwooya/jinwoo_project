<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 신청서</title>
<script>//name은 값을 전송 id는 고유객체
	window.onload = function() {
		//document.querySelector("#id").onblur = checkId; 여기서 잘 이해가 안 갑니다. 
		//아마 안에 내용물을 전달받아서 ()해서 될 거 같은데 정확히 이해가 안 갑니다. 
		//그래서 윈도우 온로드 바깥에서 구현했습니다. 리턴 시켜야 되는걸까요?? 
		document.querySelector("#btnCheckId").onclick = check;
		let key = document.querySelector("#password");// 1번 비밀번호
		//console.log(key.value); //작동확인 원래 아래 function쪽에서는 작동했는데 입력순서 때문에 작동안하는 거 같습니다.
		let key2 = document.querySelector("#password2");//2번 비밀번호 1번하고 값을 비교해야 됨
		//console.log(key2.value); //작동확인 원래 아래 function쪽에서는 작동했는데 입력순서 때문에 작동안하는 거 같습니다.
		let myForm= document.fr; //form태그 네임으로 접근 5번기능을 위해 변수 정의 
		
		
		document.querySelector("#password").onkeyup = function() {//3번기능 비밀번호 길이체크
			let keyDiv = document.querySelector("#checkPasswdResult");
			if(key.value.length >= 8 && key.value.length <= 16) {
				keyDiv.innerText = "사용가능한 패스워드입니다";
				keyDiv.style.color = "blue";
	 		} else {
	 			keyDiv.innerText = "사용불가능합니다";
	 			keyDiv.style.color = "red";
	 		}
	 	}
		
		document.querySelector("#password2").onkeyup = function() {//4번기능 비밀번호
			let keyDiv2 = document.querySelector("#checkPasswd2Result");
			if(key.value == key2.value) {
				keyDiv2.innerText = "비밀번호일치";
				keyDiv2.style.color = "blue";
	 		} else {
	 			keyDiv2.innerText = "비밀번호불일치";
	 			keyDiv2.style.color = "red";
	 		}
			
		}
		document.querySelector("#jumin1").onkeyup = function() {//5번기능 주민번호(앞자리)
			if(myForm.jumin1.value.length == 6) {
				document.fr.jumin2.focus();
			}
		}
		document.querySelector("#jumin2").onkeyup = function() {//5번기능 주민번호(뒷자리)
			if(myForm.jumin2.value.length == 7) {
				document.fr.jumin2.blur();
			}
		}
		document.querySelector("#emailDomain").onchange = function() {//7번기능
			myForm.Email2.value = myForm.emailDomain.value;
			
			if(myForm.emailDomain.options[0].selected) {
				myForm.Email2.value = myForm.emailDomain.value;//0번 셀렉트 선택시 직접 입력기능을 잘 모르겠습니다. 
				myForm.Email2.style.backgroundColor = "white";
			} else if(myForm.emailDomain.options[1].selected) {
				myForm.Email2.value.disabled;
				myForm.Email2.style.backgroundColor = "grey";
				//alert("naver!");
			} else if(myForm.emailDomain.options[2].selected) {
				//alert("nate");
				myForm.Email2.value.disabled;
				myForm.Email2.style.backgroundColor = "grey";
			} else if(myForm.emailDomain.options[3].selected) {
				//alert("gmail");
				myForm.Email2.value.disabled;
				myForm.Email2.style.backgroundColor = "grey";
			}
		}
		myForm.cb_all.onclick = function() {//8번 기능입니다. 
			if(myForm.cb_all.checked) { 
				myForm.hobby[0].checked = true;
				myForm.hobby[1].checked = true;
				myForm.hobby[2].checked = true;
			} else {
				myForm.hobby[0].checked = false;
				myForm.hobby[1].checked = false;
				myForm.hobby[2].checked = false;
				
			}		
		}	
		myForm.onsubmit = function() {//9번 영역의 조건문 switch 케이스나 분명 더 좋은 방법이 있으리라고 생각합니다. 일단 현재는 구현이 어렵네요.
			if(!myForm.name.value) {
				alert("이름을 적어주세요");
				myForm.name.focus();
				return false; 
			} else if(key.value.length >= 8 && key.value.length <= 16) {
				alert("비밀번호를 적어주세요");
				myForm.password.focus();//대충 입력해도 submit이 되어버려서 수정이 필요합니다. 
				return false;
			} else if(!myForm.id.length) {
				alert("아이디를 입력해주세요")
				myForm.id.focus();
			}
		}
		
		
	};//윈도우 온로드 함수 끝. 
 	function check() {//1번 기능 id중복버튼 클릭시 작동. 
 		window.open("check_id.jsp");
 	}
 	function checkId(blu) {//2번기능 아이디 길이체크하기 
 		//console.log(blu.value.length); 길이값 확인완료
 		let elem = document.querySelector("#checkIdResult");//값을 출력할 div 영역
 		let blu1 = blu.value.length;//8글자까지 작성하도록 maxlength를 이용했습니다. 
 		if(4<=blu1 && blu1<=8) {
 			elem.innerText = "사용가능합니다.!";
			elem.style.color = "green";
 		}else {
 			elem.innerText = "4~8글자만 사용가능합니다.!";
			elem.style.color = "red";
 		}
 		
 	} // 윈도우 로드 밖에서 하면 되는데 왜 안에서는 안 될까요?? 	

	function back() { //10번기능인데 이벤트로 전달해서 해야 되는데 조금 더 찾아보고 해보겠습니다. 
 		//alert("!");
		location.href="main.jsp";
 	}	



</script>
</head>
<body>

	<div align="center">
	<h1>회원가입</h1>
	<form action="" name="fr">
	<table border="1">
	<tr>
		<th>이름</th>
		
		<td><input type="text"  id ="name" name= "name" size="20"></td>
	</tr>
	<tr>
		<th>id</th>
		<td><input type="text" id ="id" name="id"  placeholder="4~8글자"  maxlength="8"  onblur="checkId(this)">
		<input type="button" value="id중복확인" id="btnCheckId" name="id" onclick="check()">
		
		<div id= "checkIdResult">
		</div>
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" id ="password" name="password" placeholder="8~16글자" maxlength="16">
		<div id= "checkPasswdResult"></div></td>
	</tr>
	<tr>
		<th>비밀번호확인</th>
		<td><input type="password" id ="password2" name="password2" >
		<div id= "checkPasswd2Result"></div></td>
	</tr>
	<tr>
		<th>주민번호</th>
		<td><input type= "text" id ="jumin1"  name="jumin1" size="10" maxlength="6" > -
		<input type= "text" id ="jumin2" name="jumin2" maxlength="7">
		<div id= "juminbun"></div></td>
	</tr>
	<tr>
		<th rowspan="2"><h3>주소</h3></th>
		<td>
		<input type="text" id ="passCode" name="passCode" size="6">
		<input type="button" id ="address2" value="주소검색" onclick="search_address()"><br>
		<input type="text" id ="address1" name="address1" placeholder="기본주소"required><br> 
		<input type="text" id="address2" name="address2" placeholder="상세주소" size="25">
		</td>
		
	</tr>
	<tr>
				
		
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" id ="email1" name="email1">@<input type="text" id ="Email2" name="Email2" readonly>
		<select id= "emailDomain" name="emailDomain">
		<option value="">직접입력</option>
		<option value="naver.com">naver.com</option>
		<option value="nate.com">nate.com</option>
		<option value="gmail.com">gmail.com</option>
       </select>
		</td>
	</tr>
	<tr>
		<th>직업</th>
		<td><select id ="job" name="job">
		<option value="hang">항목을 선택하세요</option>
		<option value="ga">개발자</option>
		<option value="db">db엔지니어</option>
		<option value="care">관리자</option>
        </select>
		</td>
	</tr>
	<tr>
		<th>성별</th>
		<td><input type="radio" name="gender" value="M">남
		
		<input type="radio" name="gender" value="F">여
 </td>
	</tr>
	<tr>
		<th>취미</th>
		
		<td>
		<input type="checkbox" name="hobby" value="여행">여행
		<input type="checkbox" name="hobby" value="독서">독서
		<input type="checkbox" name="hobby" value="게임">게임
		<input type="checkbox" id="cb_all" name="cb_all">전체선택

		</td>
	</tr>
	
	
	
	
	<tr>
		<th>가입동기</th>
		<td>
	<textarea cols="60" rows="5"   name="motivation"
	placeholder="남길말씀이 있다면 여기에" ></textarea></td>
	</tr>
	<tr>
	<td colspan="2" align="center">
	<input type="submit" value="가입">
	<input type="reset" value="초기화">
	<input type="button" value="돌아가기" onclick="back()">
	</td>
	</tr>
	

  </table>
 </form>
</div>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function search_address() {
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
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    //th는 행의 제목셀에 저절로 진하게 해주고 중앙으로 해줌.
    //td는 그냥 칸 
</script>

</body>
</html>