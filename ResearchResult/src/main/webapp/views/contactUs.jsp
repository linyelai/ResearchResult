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
<link href="../images/style.css" rel="stylesheet" type="text/css">
<script src="../images/jq172.js"></script>
</head>

<body>
<div class="indexnav">
  <!------- Head 开始--------->
  <div class="head">
    <div class="top">
      <div class="warp">
        <div class="welcome">欢迎访问广西师范大学科研成果及奖励系统！</div>
        <div class="weather"><script src="../images/time.js"></script></div>
      </div>
    </div>
    <div class="logo"><img src="../images/logo.png"></div>
  </div>
  <!------- Head 结束--------->
  <div class="clear"></div>
  <!------- Menu 开始--------->
  <div class="menu">
    <div class="menu_l">
      <ul>
         <li><a href="../home.do" target="_self" class="on">网站首页</a></li>
        <li><a href="../researchTrend.do" target="_self">科研动态</a></li>
        <li><a href="../researchResult.do" target="_self">科研成果</a></li>
        <li><a href="contactUs.jsp" target="_self">联系我们</a></li>
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
        <div class="toptxt">联系我们</div>
        <div class="wz"><a>当前位置：</a><a href="首页.html" class="a1">首页 ></a><a href="联系我们.html" class="a1">联系我们</a></div>
      </div>
      <div class="clear"></div>
      <div class="ny_cont">
        <!---------关于广西师范大学 开始---------->
        <div class="cont">
          <div class="imgw1"><img src="../images/lx_img1.png"></div>
          <div class="txtw1">
            <p class="pt">关于广西师范大学</p>
            <p>广西师范大学是教育部和广西壮族自治区人民政府共建高校、国家"中
西部高校基础能力建设工程"项目建设高校、卓越教师培养计划改革项目承
担高校之一、广西壮族自治区重点大学，坐落在世界著名山水旅游名城、
国家首批历史文化名城桂林市。
　　截至2013年，学校建筑面积88多万平方米；教学仪器设备总值2.77亿
元；1个国家级实验教学示范中心，8个自治区级实验教学示范中心，3个自
治区人才培养模式创新实验区，200多个校级实习实训基地。学校有王城、
育才、雁山3个校区，校园面积4100多亩。全日制本科生18539人，博士
生91人，全日制研究生5300余人，各类长短期留学生1200多人，函授、
进修生等10000余人。
            </p>
          </div>
          <div class="clear"></div>
        </div>
        <!---------关于广西师范大学 结束---------->
      <!---------关于寿鹤 开始---------->
      <div class="cont">
        <div class="imgw2"><img src="../images/lx_img2.png"></div>
        <div class="txtw2">
          <p class="pt">关于我们</p>
          <p>联系人：潘精南<br>电　话：1234567890<br>E_mail：123456789@qq.com<br>邮　编：541004<br>地　址： 广西桂林市七星区育才路15号广西师范大学<br>专　业：广西师范大学职业技术师范学院计算机科学与技术</p>
        </div>
        <div class="clear"></div>
      </div>
      <!---------关于寿鹤 结束---------->
        <div class="clear"></div>
      </div>
    </div>
     <!------- 科研成果 结束--------->
     <div class="clear"></div>
     <!------- 中间内容 结束--------->
  </div>
  <!------- 版权信息 开始--------->
  <div class="foot">
    <div class="logo"><img src="../images/logo2.png"></div>
    <div class="txt">版权所有：广西师范大学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="###" target="_blank">后台管理</a><br>王城校区：广西桂林市秀峰区王城1号 邮编：541001<br>育才校区：广西桂林市七星区育才路15号 邮编：541004 雁山校区：广西桂林市雁山区雁中路1号 邮编：541006<br>校长办公室电话：0773-5812081 普通本科招生咨询：5818532 研究生招生咨询：5833630 成教招生咨询：5803853</div>
    <div class="ewm">
      <div class="imgt"><img src="../images/weibo.jpg"></div>
      <div class="txtt">官方微博</div>
    </div>
    <div class="ewm">
      <div class="imgt"><img src="../images/wechat.jpg"></div>
      <div class="txtt">官方微信</div>
    </div>
    <div class="clear"></div>
  </div>
  <!------- 版权信息 开始--------->
</div>
</body>
</html>
