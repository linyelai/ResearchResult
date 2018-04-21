<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教研成果及奖励系统————后台管理系统</title>
  	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.5.4.2/themes/default/easyui.css">
  	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.5.4.2/themes/icon.css">
  	<link rel="stylesheet" type="text/css" href="css/index.css">
  		<link rel="stylesheet" type="text/css" href="css/addResearchResult.css">
    <script type="text/javascript" src="js/jquery-easyui-1.5.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery-easyui-1.5.4.2/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
<%
		String path = request.getContextPath();//
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
		request.getSession().setAttribute("basePath", basePath);
%>
<script type="text/javascript">
	var BASE_PATH = "<%=basePath %>";
</script>
</head>
<body>
<div id="top" class="top">
<div class="logoText">科研成果及奖励系统————后台管理系统</div>
<div class="username">${loginUser}</div>
<div class="logout"><a href="javascript:logout();">退出登录</a></div>
</div>
<div id="container" class="container">
<div id="navigation">
	<div class="easyui-panel" style="padding:5px;width:150px;height:550px;">
        <ul id="menu" class="easyui-tree">
           
        </ul>
    </div>
 
</div>
<div id="mainWin">

<div  id ="manageTabs" class="easyui-tabs" style="width:100%;height:550px">
	
       <div title="用户管理" style="padding:10px">
       	<div class="userSearch">用户名：<input name="username" id="username" class="easyui-textbox" data-options="iconCls:'icon-search',prompt:'请输入用户名'" style="width:200px">
       	<a id="userBtn" href="#" class="easyui-linkbutton" >查找</a></div>
        <div class="dgpanel">
       		 <table id="userInfo" style="width:100%;height:445px"></table>
		</div>
	</div> 
</div>
	<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post" action="addUser.do">
			<div class="fitem">
				<label>用户名：</label>
				<input id="newName" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>密码：</label>
				<input id="password" type="password" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>确认密码:</label>
				<input id="comfirmPass" type="password" class="easyui-textbox">
			</div>
			<div class="fitem">
				<label>类型：</label>
				<select id="typecc" class="easyui-combobox" name="type" style="width:165px;">
				    <option value="1">管理员</option>
				    <option value ="0">普通用户</option>
				</select>
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()" style="width:90px">Save</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
	</div>
	
	<div id="editUserdlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
			closed="true" buttons="#edit-dlg-buttons">
		<form id="fm1" method="post" action="addUser.do">
		<input type="hidden" id="userId"> 
			<div class="fitem">
				<label>用户名：</label>
				<input id="newName1" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>密码：</label>
				<input id="password1" type="password" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>确认密码:</label>
				<input id="comfirmPass1" type="password" class="easyui-textbox">
			</div>
			<div class="fitem">
				<label>类型：</label>
				<select id="typecc1" class="easyui-combobox" name="type" style="width:165px;">
				    <option value="1">管理员</option>
				    <option value ="0">普通用户</option>
				</select>
			</div>
			<div class="fitem">
				<label>是否可用：</label>
				<select id="enablecc1" class="easyui-combobox" name="type" style="width:165px;">
				    <option value="1">可用</option>
				    <option value ="0">不可用</option>
				</select>
			</div>
		</form>
	</div>
	<div id="edit-dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="editUser()" style="width:90px">Save</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#editUserdlg').dialog('close')" style="width:90px">Cancel</a>
	</div>

</div>
</div>



	<div id="addTeacherdlg" class="easyui-dialog" style="width:600px;height:500px;padding:10px 20px"
			closed="true" buttons="#addTeacher-dlg-buttons">
		<form id="addTeacherfm" method="post" action="addTeacher.do">
			<div class="fitem">
				<label>教师姓名：</label>
				<input  id="tuitorName" class="easyui-textbox" >
			</div>
			<div class="fitem">
				<label>工号：</label>
				<input id="jobNum" class="easyui-textbox" >
			</div>
			<!-- <div class="fitem">
				<label>出生日期：</label>
				<input id="birthday" type="text" class="easyui-datebox" required="required">
			</div>
			<div class="fitem">
				<label>性别：</label>
				<select id="gender" class="easyui-combobox" name="dept" style="width:200px;">
				    <option value="0">男</option>
				    <option value="1">女</option>
				</select>
			</div> -->
			<div class="fitem">
				<label>学位：</label>
				<select id="degree" class="easyui-combobox" name="dept" style="width:200px;">
				    <option value="学士">学士</option>
				    <option value="硕士">硕士</option>
				    <option value="博士">博士</option>
				</select>
			</div>
			<div class="fitem">
				<label>职称：</label>
				<input id="rank" class="easyui-textbox" >
			</div>
			<div class="fitem">
				<label>职务：</label>
				<input id="position" class="easyui-textbox" >
			</div>
			<div class="fitem">
				<label>身份证号码：</label>
				<input id="idCardNum" class="easyui-textbox" >
			</div>
			<div class="fitem">
				<label>学院：</label>
				<select id="academic" class="easyui-combobox" name="dept" style="width:200px;">
				    <option value="职师学院">职师学院</option>
				    <option>数学学院</option>
				    <option>计信学院</option>
				    <option>化学学院</option>
				    <option>物理学院</option>
				</select>
			</div>
		</form>
		<div id="addTeacher-dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="addTeacher()" style="width:90px">Save</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#addTeacherdlg').dialog('close')" style="width:90px">Cancel</a>
		</div>
	</div>
	


<div id="editTeacherdlg" class="easyui-dialog" style="width:600px;height:500px;padding:10px 20px"
			closed="true" buttons="#editTeacher-dlg-buttons">
		<form id="eidtTeacherfm" method="post" action="editTeacher.do">
		<input id="editTeacherId" type="hidden"/>
			<div class="fitem">
				<label>教师姓名：</label>
				<input id="editTeacherName" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>工号：</label>
				<input id="jobNumEdit" class="easyui-textbox" required="true">
			</div>
			<!--<div class="fitem">
				<label>出生日期：</label>
				<input id="birthdayEdit" type="text" class="easyui-datebox" required="required">
			</div>
			 <div class="fitem">
				<label>性别：</label>
				<select id="genderEdit" class="easyui-combobox" name="dept" style="width:200px;">
				    <option value="0">男</option>
				    <option value="1">女</option>
				</select>
			</div> -->
			<div class="fitem">
				<label>学位：</label>
				<select id="degreeEdit" class="easyui-combobox" name="dept" style="width:200px;">
				    <option value="学士">学士</option>
				    <option value="硕士">硕士</option>
				    <option value="博士">博士</option>
				</select>
			</div>
			<div class="fitem">
				<label>职称：</label>
				<input id="rankEdit" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>职务：</label>
				<input id="positionEdit" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>身份证号码：</label>
				<input id="idCardNumEdit" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>学院：</label>
				<select id="academicEdit" class="easyui-combobox" name="dept" style="width:200px;">
				    <option value="职师学院">职师学院</option>
				    <option>数学学院</option>
				    <option>计信学院</option>
				    <option>化学学院</option>
				    <option>物理学院</option>
				</select>
			</div>
		</form>
		<div id="editTeacher-dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="editTeacher()" style="width:90px">Save</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#eidtTeacherdlg').dialog('close')" style="width:90px">Cancel</a>
	</div>
	</div>
	






<style type="text/css">
		#fm,#fm1{
			margin:0;
			padding:10px 30px;
		}
		.ftitle{
			font-size:14px;
			font-weight:bold;
			padding:5px 0;
			margin-bottom:10px;
			border-bottom:1px solid #ccc;
		}
		.fitem{
			margin-bottom:5px;
		}
		.fitem label{
			display:inline-block;
			width:80px;
		}
		.fitem input{
			width:160px;
		}
	</style>
	
	
	
	
</body>
</html>