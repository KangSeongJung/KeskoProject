<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration02.html</title>
    <link rel="stylesheet" href="./common/style.css"> 
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    $( function() {
        //라디오를 버튼모양으로 바꿔주는 jQuery UI
        $("input[type=radio]").checkboxradio({
            icon: false
        });
        //날짜선택을 편리하게 - Date Picker
        $("#birthday").datepicker({
            dateFormat : "yy-mm-dd",
            showOn: "both",
            buttonImage: "./images/pick.jpg",
            buttonImageOnly: true,
        });    
        $('<img src="" alt="" class="ui-datepi" />cker-trigger').css({'position':'relative','top':'11px','width':'33px','marginTop':'-5px'});
    } );
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    function zipcodeFind(){
        new daum.Postcode({
            oncomplete: function(data) {
                //DAUM 우편번호API가 전달해주는 값을 콘솔에 출력
                console.log("zonecode", data.zonecode);
                console.log("address", data.address);
                //회원 가입폼에 적용
                var f = document.registFrm;//<form>태그의 DOM객체를 변수에 저장
                f.zipcode.value = data.zonecode;
                f.address1.value = data.address;
                f.address2.focus();
            }
        }).open();
    }
    </script>
    <script>
    function registValdidate(form){
    	/* alert("폼값이 전송되기 전 유효성 체크를 해주세요."); */
    	if($("select[name='game']").val()==""){
    		alert('종목을 선택하세요')
    		$("select[name='game']").focus();
         	return false; 
    	}
    	
    	if($("input[name='korname']").val()==""){
    		alert('한글이름을 입력하세요')
    		$("input[name='korname']").focus();
         	return false; 
    	}
    	
    	if($("input[name='engname']").val()==""){
    		alert('영어이름을 입력하세요')
    		$("input[name='engname']").focus();
         	return false; 
    	}
    		
    	if($("input[name='id']").val()==""){
    		alert('아이디를 입력하세요')
    		$("input[name='id']").focus();
         	return false; 
    	}
    	
    	if($("input[name='pass1']").val()==""){
    		alert('비밀번호를 입력하세요')
    		$("input[name='pass1']").focus();
         	return false; 
    	}
    	
    	if($("input[name='birthday']").val()==""){
    		alert('생년월일을 입력하세요')
    		$("input[name='birthday']").focus();
         	return false; 
    	}
    	
    	if($("input[name='zipcode']").val()==""){
    		alert('주소를 입력하세요')
    		$("input[name='zipcode']").focus();
         	return false; 
    	}
    	
    	if($("input[name='address1']").val()==""){
    		alert('상세주소를 입력하세요')
    		$("input[name='address1']").focus();
         	return false; 
    	}
    	
    	if($("input[name='address2']").val()==""){
    		alert('상세주소를 입력하세요')
    		$("input[name='address2']").focus();
         	return false; 
    	}
    	
    	if($("input[name='email1']").val()==""){
    		alert('이메일을 입력하세요')
    		$("input[name='email1']").focus();
         	return false; 
    	}
    	
    	if($("input[name='email2']").val()==""){
    		alert('이메일을 입력하세요')
    		$("input[name='email2']").focus();
         	return false; 
    	}
    	
    	if($("select[name='mobile1']").val()==""){
    		alert('휴대번호를 입력하세요')
    		$("select[name='mobile1']").focus();
         	return false; 
    	}
    	
    	if($("select[name='tel1']").val()==""){
    		alert('전화번호를 입력하세요')
    		$("select[name='tel1']").focus();
         	return false; 
    	}
    	
    }
    function idCheck(form){
    	alert("아이디 중복체크는 하지않습니다.");
    }
    function inputEmail(form){
		var value = $('.s01').val();
		if(value==""){
			$('input[name=email2]').attr('readonly', false);
			$('input[name=email2]').val('');
		}
		else{
			$('input[name=email2]').attr('readonly', true);
			$('input[name=email2]').val(value);
		}
    }
    
    function commonFocusMove(obj, charLen, nextObj){
    	if(obj.value.length == charLen)
            document.getElementsByName(nextObj)[0].focus();
    }
    </script>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-5">
        <a class="navbar-brand" href="#!"><img src="../images/logo.png" alt="그림없음" width=150px/></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0 text-end">
                <li class="nav-item"><a class="nav-link " aria-current="page" href="../main.jsp">홈화면</a></li>
                <li class="nav-item"><a class="nav-link active" href="../company/ceo.jsp">회사소개</a></li>
                <li class="nav-item"><a class="nav-link" href="../../kesboard/list.do">커뮤니티</a></li>
            </ul>
        </div>
    </div>
</nav>

<header class="bg-dark py-5">
    <div class="container px-5">
        <div class="row gx-5 justify-content-left">
            <div class="col-lg-6">
                <div class="text-center my-5">
					<div class="tab_menu">
				</div>   
                </div>
            </div>
        </div>
    </div>
</header>

<form action="../../kesuser/register.do" method="post" name="registFrm" onsubmit="return registValdidate(this)">
<div class="AllWrap">
    <div class="wrap_regiform">
        <p>*필수입력사항</p>
        <table class="regi_table">
            <colgroup>
                <col width="180px">
                <col width="*">
            </colgroup>
            <tr>
                <td><span class="red">*</span> 종목</td>
                <td>
	                    <select name="game" class="form-select form-select-lg">
					    	<option value="">종목을 선택해주세요</option>
					     	<option value="리그 오브 레전드">리그 오브 레전드</option>
					     	<option value="카트라이더">카트라이더</option>
					     	<option value="배틀그라운드">배틀그라운드</option> 
					     	<option value="배틀그라운드 모바일">배틀그라운드 모바일</option> 
					     	<option value="FIFA 온라인4">FIFA 온라인4</option> 
					     	<option></option> 
				        </select> 
                </td>
            </tr>
           
            <tr>
                <td><span class="red">*</span> 이름</td>
                <td>
                    <input type="text" class="w01" name="korname" value="" style="max-width: 150px" placeholder="한글이름"/>
                    <input type="text" class="w01" name="engname" value="" style="max-width: 150px" placeholder="영어이름"/>                                                          
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <span class="comment">※ 8~16자의 영문과 숫자만 가능합니다.</span>                
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> 아이디</td>
                <td>
                    <input type="text" class="w01" name="id" value="" style="max-width: 150px"/>
                    <button type="button" onclick="idCheck(this.form);">중복확인</button>
                </td>
            </tr>
             <tr>
                <td></td>
                <td>
                    <span class="comment">
                        ※ 영문/숫자/특수문자 조합 6~20자 이상 입력해주세요.
                    </span>
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> 비밀번호</td>
                <td>
                    <input type="password" class="w01" name="pass1" value="" />
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> 생년월일</td>
                <td style="padding: 0px 0 5px 5px;">
                    <input type="text" class="w02" name="birthday" id="birthday" value="" />
                    <!-- <img src="./images/pick.jpg" id="pick" class="pick" /> -->
                </td>
            </tr>
            <tr>
            	<td><span class="red">*</span> 성별</td>
                <td>
                    <label for="radio-1">남</label>
                    <input type="radio" name="gender" id="radio-1" value="남" checked>
                    <label for="radio-2">여</label>
                    <input type="radio" name="gender" id="radio-2" value="여">
                    
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> 주소</td>
                <td>
                    <input type="text" class="w03" name="zipcode" value="" />
                    <button type="button" onclick="zipcodeFind();">우편번호찾기</button> 
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="text" class="w04" name="address1" value="" />                
                    <input type="text" class="w04" name="address2" value="" />
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> 이메일</td>
                <td>
                    <input type="text" class="w05" name="email1" value="" />
                    @
                    <input type="text" class="w05" name="email2" value="" />
                    <select name="email_domain" class="s01" onchange="inputEmail(this.form);">
                        <option value="">직접입력</option>
                        <option value="naver.com">naver.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="gmail.com">gmail.com</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> 휴대폰번호</td>
                <td>
                    <select name="mobile1" class="s02" onchange="commonFocusMove(this, 3, 'mobile2');">
                        <option value=""></option>
						<option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                    </select>
                    -
                    <input type="text" class="w06" name="mobile2" maxlength="4" 
                        value="" onkeyup="commonFocusMove(this, 4, 'mobile3');" />
                    -
                    <input type="text" class="w06" name="mobile3" maxlength="4" 
                        value="" onkeyup="commonFocusMove(this, 4, 'tel1');" />
                </td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td>
                    <select name="tel1" class="s02" onchange="commonFocusMove(this, 3, 'tel2');">
                        <option value=""></option>
						<option value="02">02</option>                        
                        <option value="031">031</option>
						<option value="032">032</option>
						<option value="033">033</option>
                    </select>
                    -
                    <input type="text" class="w06" name="tel2" maxlength="4" value="" onkeyup="commonFocusMove(this, 4, 'tel3');" />
                    -
                    <input type="text" class="w06" name="tel3" maxlength="4" value="" />
                </td>
            </tr>
        </table>
        <div style="text-align: center; margin-top:10px;">
            <button type="submit" class="btn_search">회원가입</button>
            <button type="reset" class="btn_search">다시쓰기</button>
        </div>
    </div>
</div>
</form>
</body>
</html>