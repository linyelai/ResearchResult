<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
    <%@ page language="java" import="org.apache.taglibs.standard.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>科研成果及奖励系统</title>
<link href="images/style.css" rel="stylesheet" type="text/css">
<script src="images/jq172.js"></script>
</head>

<body>
<div class="indexnav">
  <!------- Head 开始--------->
  <div class="head">
    <div class="top">
      <div class="warp">
        <div class="welcome">欢迎访问广西师范大学科研成果及奖励系统！</div>
        <div class="weather"><script src="images/time.js"></script></div>
      </div>
    </div>
    <div class="logo"><img src="images/logo.png"></div>
  </div>
  <!------- Head 结束--------->
  <div class="clear"></div>
  <!------- Menu 开始--------->
  <div class="menu">
    <div class="menu_l">
      <ul>
        <li><a href="views/home.jsp" target="_self">网站首页</a></li>
        <li><a href="researchTrend.do" target="_self" class="on">科研动态</a></li>
        <li><a href="researchResult.do" target="_self">科研成果</a></li>
        <li><a href="views/contactUs.jsp" target="_self">联系我们</a></li>
      </ul>
    </div>
    <script type="text/javascript" language="javascript">
		function Gsearch() {
			var txtKeys = document.getElementById("txtKeys");
			location.href = "search.aspx?keys=" + escape(txtKeys.value);
		}
		document.getElementById("txtKeys").onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {
				setTimeout(Gsearch, 1000);
				return false;
			}
			return true;
		}
	</script>
  </div>
  <!------- Menu 结束--------->
  <div class="clear"></div>
  <!------- 中间内容 开始--------->
  <div class="nav">
    <div class="ny">
      <div class="ny_top">
        <div class="toptxt">科研动态</div>
        <div class="wz"><a>当前位置：</a><a href="首页.html" class="a1">首页 ></a><a href="科研动态.html" class="a1">科研动态</a></div>
      </div>
      <div class="clear"></div>
      <div class="ny_txt">
      <div class="txttitle"><p>${report.title }</p></div>
      <div class="txtdata"><fmt:formatDate pattern="yyyy-MM-dd" value="${report.submitDate}" />　　来源：${report.source }　　作者：${report.author }</div>
      <div class="text">
        ${report.content}
      </div>
    </div>
    </div>
    <!------- 中间内容 结束--------->
  </div>
  <!------- 版权信息 开始--------->
  <div class="foot">
    <div class="logo"><img src="images/logo2.png"></div>
    <div class="txt">版权所有：广西师范大学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="###" target="_blank">后台管理</a><br>王城校区：广西桂林市秀峰区王城1号 邮编：541001<br>育才校区：广西桂林市七星区育才路15号 邮编：541004 雁山校区：广西桂林市雁山区雁中路1号 邮编：541006<br>校长办公室电话：0773-5812081 普通本科招生咨询：5818532 研究生招生咨询：5833630 成教招生咨询：5803853</div>
    <div class="ewm">
      <div class="imgt"><img src="images/weibo.jpg"></div>
      <div class="txtt">官方微博</div>
    </div>
    <div class="ewm">
      <div class="imgt"><img src="images/wechat.jpg"></div>
      <div class="txtt">官方微信</div>
    </div>
    <div class="clear"></div>
  </div>
  <!------- 版权信息 开始--------->
</div>
</body>
</html>
