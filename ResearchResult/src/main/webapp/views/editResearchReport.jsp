<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增科研动态</title>
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.5.4.2/themes/default/easyui.css">
  	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.5.4.2/themes/icon.css">
  	<link rel="stylesheet" type="text/css" href="css/index.css">
  		<link rel="stylesheet" type="text/css" href="css/addResearchResult.css">
    <script type="text/javascript" src="js/jquery-easyui-1.5.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery-easyui-1.5.4.2/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
 <script type="text/javascript" charset="utf-8" src="ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="lang/zh-cn/zh-cn.js"></script>

    <style type="text/css">
        div{
            width:100%;
        }
    </style>
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
<div>
	<input type="hidden" id="id" value="${report.id}"/>
	<input type="hidden" id="submitDate" value="${report.submitDate}"/>
	<div>标题：<input id="title" type="text" value="${report.title }" placeholder="输入标题"/></div>
	<div>来源：<input id="source" type="text" value="${report.source }" placeholder="输入来源"/></div>
	<div>作者：<input id="author" type="text" value="${report.author }" placeholder="输入作者"/></div>
	<div>
	    报告内容
	    <script id="editor" name="content" type="text/plain" style="width:1024px;height:300px;"></script>
	</div>
	<div><div style="margin-left: 500px;margin-right:auto;margin-top:20px;"><a id="editReportBtn" href="#" class="easyui-linkbutton" >提交</a></div></div>
</div>
<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
   //var content = '${report.title}';
   ue.ready(function() 
	{
	   	var content = '${report.content}'
        ue.setContent(content);
    });
   
    $("#editReportBtn").click(function(){
        var data = UE.getEditor('editor').getContent();
        var title= $("#title").val();
        var source= $("#source").val();
        var author= $("#author").val();
        var id = $("#id").val();
        var submitDate = $("#submitDate").val();
        $.ajax({
            cache: true,
            type: "POST",
            url: BASE_PATH+"/updateReport.do",
　　　　　　　　data: {
                　　　　　　　　　　"id":id,"content": data,"title":title,"source":source,"author":author,"submitDate":submitDate
            　　　　},
            async: false,
            error: 
            function(request) 
            {
                alert("Connection error");
            },
            success: function()
            {
            	
               window.location.href =BASE_PATH+ "/index.do";
            }
        });
    });

</script>
</body>
</html>