<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增科研结果</title>
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.5.4.2/themes/default/easyui.css">
  	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.5.4.2/themes/icon.css">
  	<link rel="stylesheet" type="text/css" href="css/addResearchResult.css">
    <script type="text/javascript" src="js/jquery-easyui-1.5.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery-easyui-1.5.4.2/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/jquery-form.js"></script>
    <script type="text/javascript" src="js/editResearchResult.js"></script>
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
<div class="alignCenter">
<form id="uploadImage"  method="POST" action="uploadEditImage.do" 
enctype="multipart/form-data"accept="image/gif, image/jpeg,image/jpg, image/png">
<input type="hidden" name="id" id="id" value="${result.id}"/>
<div class="clearStyle"><span class="researchLable">科研课题</span>
<span class="researchInput"><input id="title" name ="title" type="text" style="width:300px" value="${result.title }"></span></div>
<div class="clearStyle"><span class="researchLable">参与人</span>
<span class="researchInput"><input id="participates" name ="participant" type="text" style="width:300px" value="${result.participant }"></span></div>
<div class="clearStyle"><span class="researchLable">编号</span>
<span class="researchInput"><input id="no" name="no" type="text" style="width:300px" value="${result.no }"></span></div>
<div class="clearStyle"><span class="researchLable">类型</span>
<span class="researchInput">
<select id="type"  name="type" style="width:200px;" >
    <option value="0"  >论文</option>
    <option value="1" >专利</option>
    <option value="2">专著</option>
    <option value="3">软件著作权</option>
    <option value="4">横向项目</option>
</select>
</span>
</div>
<div class="clearStyle"><span class="researchLable">发表日期</span>
<span class="researchInput"><input id="pulishDate" name="pulishDate" type="text" class="easyui-datebox" required="required" value="${result.pulishDate }"></span></div>
<div class="clearStyle"><span class="researchLable">级别</span>
<span class="researchInput">
<select id="grade" class="easyui-combobox" name="grade" style="width:200px;" value="${result.grade }">
    <option value="0">SCI一区</option>
    <option value="1">SCI二区</option>
    <option value="2">SCI光盘</option>
    <option value="3">EI</option>
    <option value="4">普通刊物</option>
</select>
</span></div>

<div class="clearStyle"><span class="researchLable">工作量</span><span class="researchInput">
<input id="workload" name="workload" type="text" style="width:300px" value="${result.workload }"></span>
<span class="researchInput" style="margin-left:200px;">人/天</span></div>

<div class="clearStyle"><span class="researchLable">奖励金额</span>
<span class="researchInput"><input id="reward" name="reward" type="text" style="width:300px" value="${result.reward }"></span>
<span class="researchInput" style="margin-left:200px;">圆</span>
</div>
<input type="hidden" name="imageName" id="imageName" value="${imageName}">

<div class="clearStyle">
<span class="researchLable">图片</span>
<span class="researchInput">
<input type="file" id="file" name="file" tyle="width:300px" value="${imageName}" >
</span>
<span class="researchLable"><input type="submit" value="上传"  style="margin-left:150px;" onclick="uploadEditImage();"/></span>
</div>
</form>

<div class="clearStyle"><span class="researchLable">
<a id="resultBtn" href="#" class="easyui-linkbutton" onclick="editResult();">修改</a></span>
<span class="researchInput"><a id="resultCancelBtn" href="#" class="easyui-linkbutton" onclick="editResultCancelBtn();">取消</a></span></div>
<div class="clearStyle" style="display:block;margin-top:30px;">
<img alt="科研图片" id="resultImage" src="${imageName}" style="width:200px;height:160px;"></div>

</div>
</body>
</html>