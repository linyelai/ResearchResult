<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
    <%@ page language="java" import="org.apache.taglibs.standard.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
        <li><a href="home.do" target="_self" class="on">网站首页</a></li>
        <li><a href="researchTrend.do" target="_self">科研动态</a></li>
        <li><a href="researchResult.do" target="_self">科研成果</a></li>
        <li><a href="views/contactUs.jsp" target="_self">联系我们</a></li>
      </ul>
    </div>
  </div>
  <!------- Menu 结束--------->
  <div class="clear"></div>
  <!------- 中间内容 开始--------->
  <div class="nav">
     <!------- 焦点图片新闻 开始--------->
    <div class="jdtp">
      <div class="slide">
        <div id="xsXwbd" class="ximgStyle">
        
        <c:forEach items="${resultList}" var="result" varStatus="id" begin="0" end="2">
     
     	<div class="xslideItem" style="display: block;">
            <div class="title_img">
              <a href="#" title="${result.title }" target="_blank">
                <table cellpadding="0" cellspacing="0">
                  <tbody>
                    <tr>
                      <td width="465px" height="300px" align="center" valign="bottom"><img src="${result.imageUrl }" border="0" alt="${result.title }" ></td>
                    </tr>
                  </tbody>
                </table>
              </a>
            </div>
            <div class="titlebg"></div>
            <div class="title_txt">
              <a href="" title="${result.title }" target="_blank">${result.title }</a>
            </div>
          </div>
         
	   </c:forEach> 
        
        
        
        
        
        
        <!-- 
        
          <div class="xslideItem" style="display: block;">
            <div class="title_img">
              <a href="#" title="广西疾控中心与广西师范大学签署在校大学生教学科研实践基地项目书" target="_blank">
                <table cellpadding="0" cellspacing="0">
                  <tbody>
                    <tr>
                      <td width="465px" height="300px" align="center" valign="bottom"><img src="images/news_img1.jpg" border="0" alt="广西疾控中心与广西师范大学签署在校大学生教学科研实践基地项目书" onerror="this.src='images/zwtp.jpg'"></td>
                    </tr>
                  </tbody>
                </table>
              </a>
            </div>
            <div class="titlebg"></div>
            <div class="title_txt">
              <a href="" title="广西疾控中心与广西师范大学签署在校大学生教学科研实践基地项目书" target="_blank">广西疾控中心与广西师范大学签署在校大学生教学科研实践基地项目书</a>
            </div>
          </div>
  
          <div class="xslideItem" style="display: none;">
            <div class="title_img">
              <a href="#" title="广西师大与桂山华星酒店共建“教学科研创作实践基地”" target="_blank">
                <table cellpadding="0" cellspacing="0">
                  <tbody>
                    <tr>
                      <td width="465px" height="300px" align="center" valign="bottom"><img src="images/news_img2.png" border="0" alt="广西师大与桂山华星酒店共建“教学科研创作实践基地”" onerror="this.src='images/zwtp.jpg'"></td>
                    </tr>
                  </tbody>
                </table>
              </a>
            </div>
            <div class="titlebg"></div>
            <div class="title_txt">
              <a href="#" title="广西师大与桂山华星酒店共建“教学科研创作实践基地”" target="_blank">广西师大与桂山华星酒店共建“教学科研创作实践基地”</a>
            </div>
          </div>
  
          <div class="xslideItem" style="display: none;">
            <div class="title_img">
              <a href="#" title="广西师范大学第六次科研工作大会开幕" target="_blank">
                <table cellpadding="0" cellspacing="0">
                  <tbody>
                    <tr>
                      <td width="465px" height="300px" align="center" valign="bottom"><img src="images/news_img3.jpg" border="0" alt="广西师范大学第六次科研工作大会开幕" onerror="this.src='images/zwtp.jpg'"></td>
                    </tr>
                  </tbody>
                </table>
              </a>
            </div>
            <div class="titlebg"></div>
            <div class="title_txt">
              <a href="#" title="广西师范大学第六次科研工作大会开幕" target="_blank">广西师范大学第六次科研工作大会开幕</a>
            </div>
          </div> -->
  
          <div class="xslidePos">
              <ul class="xslideList"></ul>
          </div>
        </div>
        <script src="images/slider.js" type="text/javascript"></script>
        <script type="text/javascript"> new xSliderFun("xsXwbd");</script>
      </div>
    </div>
     <!------- 焦点图片新闻 结束--------->
     <!------- 科研动态 开始--------->
    <div class="kydt">
      <div class="kydt_top">
        <div class="toptxt">科研动态</div>
        <div class="more"><a href="科研动态.html" target="_self">更多+</a></div>
      </div>
      <div class="clear"></div>
      <div class="kydt_cont">
        <ul>
           <c:forEach items="${reportList}" var="report" varStatus="id" begin="0">  
			<li>
				<span>
				<img src="images/icon1.png">
				</span>
				<a href="reportDetail.do?id=${report.id}" target="_self" title="">
					${report.title}
				</a>
				<fmt:formatDate pattern="yyyy-MM-dd"  value="${report.submitDate}" />
            </li>
     	</c:forEach> 
      </div>
    </div>
     <!------- 科研动态 结束--------->
     <div class="clear"></div>
     <!------- 科研成果 开始--------->
    <div class="kycg">
      <div class="kycg_top">
        <div class="toptxt">科研成果</div>
        <div class="more"><a href="科研成果.html" target="_self">更多+</a></div>
      </div>
      <div class="clear"></div>
      <div class="kycg_cont">
      <c:forEach items="${resultList}" var="result" varStatus="id" begin="0">
      <c:choose>
      	<c:when test="${(id.index+1)%4!=0}">
      		 <div class="maximg_l">
	          <div class="minimg"><a href="科研成果——详细内容页.html" target="_self" title=""><img src="${result.imageUrl }"></a></div>
	          <div class="jlje">奖励金额：${result.reward } 元</div><br>	
	          <div class="mintxt"><a href="科研成果——详细内容页.html" target="_self" title="">${result.title }</a></div>
        </div>
      	</c:when>
      	<c:otherwise>
      		 <div class="maximg_r">
	          <div class="minimg"><a href="科研成果——详细内容页.html" target="_self" title=""><img src="${result.imageUrl }"></a></div>
	          <div class="jlje">奖励金额：${result.reward } 元</div><br>	
	          <div class="mintxt"><a href="科研成果——详细内容页.html" target="_self" title="">${result.title }</a></div>
       		 </div>
      	</c:otherwise>
      </c:choose>
      <%-- <c:if test="${(id.index+1)%4!=0}"> 
		       <div class="maximg_l">
	          <div class="minimg"><a href="科研成果——详细内容页.html" target="_self" title=""><img src="${result.imageUrl }"></a></div>
	          <div class="jlje">奖励金额：${result.reward } 元</div><br>	
	          <div class="mintxt"><a href="科研成果——详细内容页.html" target="_self" title="">${result.title }</a></div>
        </div>
        </c:if> --%>
         
	  </c:forEach>  
       <!--  <div class="maximg_l">
          <div class="minimg"><a href="科研成果——详细内容页.html" target="_self" title=""><img src="images/cglb_img1.png"></a></div>
          <div class="jlje">奖励金额：2580.00 元</div><br>
          <div class="mintxt"><a href="科研成果——详细内容页.html" target="_self" title="">广西师范大学第六次科研工作大会开幕</a></div>
        </div>
        <div class="maximg_l">
          <div class="minimg"><a href="科研成果——详细内容页.html" target="_self" title=""><img src="images/cglb_img1.png"></a></div>
          <div class="jlje">奖励金额：2580.00 元</div><br>
          <div class="mintxt"><a href="科研成果——详细内容页.html" target="_self" title="">广西师范大学第六次科研工作大会开幕</a></div>
        </div>
        <div class="maximg_l">
          <div class="minimg"><a href="科研成果——详细内容页.html" target="_self" title=""><img src="images/cglb_img1.png"></a></div>
          <div class="jlje">奖励金额：2580.00 元</div><br>
          <div class="mintxt"><a href="科研成果——详细内容页.html" target="_self" title="">广西师范大学第六次科研工作大会开幕</a></div>
        </div>
        <div class="maximg_r">
          <div class="minimg"><a href="科研成果——详细内容页.html" target="_self" title=""><img src="images/cglb_img1.png"></a></div>
          <div class="jlje">奖励金额：2580.00 元</div><br>
          <div class="mintxt"><a href="科研成果——详细内容页.html" target="_self" title="">广西师范大学第六次科研工作大会开幕</a></div>
        </div> -->
        <div class="clear"></div>
      </div>
    </div>
     <!------- 科研成果 结束--------->
     <div class="clear"></div>
     <!------- 联系我们 开始--------->
     <div class="kycg">
        <div class="kycg_top">
          <div class="toptxt">联系我们</div>
          <div class="more"><a href="联系我们.html" target="_self">更多+</a></div>
        </div>
        <div class="clear"></div>
        <div class="kycg_cont">
          <div class="imgw"><a><img src="images/lxwm.png"></a></div>
          <div class="lxtxt"><p>截至2013年，学校共承担973前期研究专项、863、国家自然科学基金、国家社科基金等国家级项目128项，获得各级各类科技经费总计2.77亿元；获得各类科研成果8502项，其中各类著作344部、SCI等三大索引收录论文897篇。获得省部级以上科研成果奖励169项，其中获国家科技进步二等奖1项（第五完成单位）；获教育部人文社会科学优秀成果奖二等奖1项、三等奖1项，均为“十一五”期间广西高校唯一获奖的成果；获广西科技进步奖15项，其中一等奖1项...&nbsp;<a href="联系我们.html" target="_self"><span>【查看详细】</span></a></p></div>
          <div class="text"><p>联系人：潘精南</p><p>电　话：1234567890</p><p>移动电话：1234567890</p><p>邮　箱：123456789@qq.com</p><p>邮　编：541004</p><p>联系地址：广西桂林市七星区育才路15号</p></div>
        </div>
    </div>
     <!------- 联系我们 结束--------->
     <div class="clear"></div>
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
