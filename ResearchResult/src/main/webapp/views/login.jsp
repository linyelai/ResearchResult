<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>科研成果及奖励后台管理系统————登录页面</title>
<link href="image/styleCSS.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript">
	var code;
	function createCode() {
		code = "";
		var codeLength = 5; //验证码的长度
		var checkCode = document.getElementById("checkCode");
		var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
		'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
		'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9'); //所有候选组成验证码的字符，当然也可以用中文的
		for (var i = 0; i < codeLength; i++) 
		{
			var charNum = Math.floor(Math.random() * 52);
			code += codeChars[charNum];
		}
		if (checkCode) 
		{
			checkCode.className = "code";
			checkCode.innerHTML = code;
		}
	}
	function validateCode() 
	{
		var inputCode = document.getElementById("inputCode").value;
		var flag = true;
		var username = document.getElementById("username");
		if(username==null||""==username.value)
		{
			alert("请输入用户名！");
			return false;
		}
		var password = document.getElementById("password");
		if(password==null||""==password.value)
		{
			alert("请输入密码！");
			return false;
		}
		if (inputCode.length <= 0) 
		{
			alert("请输入验证码！");
			return false
		}
		else if (inputCode.toUpperCase() != code.toUpperCase()) 
		{
			alert("验证码输入有误！");
			createCode();
			return false;
		}
		return flag;
		        
	}    
	function login()
	{
		if(validateCode())
		{
			var form = document.getElementById('loginForm');
			//再次修改input内容
			form.submit();
			
		}
		
	}
	window.onload= function()
	{
		createCode();
	}
</script>
</head>

<body>
<div class="indexnav">
  <div class="mainnav">
    <div class="logo"><img src="image/ht_logo.png"></div>
    <div class="nav">
      <div class="nav_l">
      <form action="login.do" id="loginForm" method="post">
        <ul>
          <li>账　号：</li>
          <li>密　码：</li>
          <li>验证码：</li>
        </ul>
      </div>
      <div class="nav_r">
        <ul>
          <li><input class="txt1" name="username" id="username"></li>
          <li><input class="txt1" name="password" type="password" id="password"></li>
          <li><input class="txt2" id="inputCode"><div class="code" id="checkCode" onclick="createCode()">点击</div></li>
          <li class="text1"><div class="Btn" onClick="JavaScript:login();">登录</div></li>
          <li class="text1"><div class="Btn" onClick="JavaScript:cancleLogin();">取消</div></li>
         <!--  <li class="text"><a href="#">取消</a></li> -->
        </ul>
        </form>
      </div>
    </div>
  </div> 
  <div class="footer">版权所有：广西师范大学</div> 
  <div class="clear"></div>
</div>

</body>
</html>
