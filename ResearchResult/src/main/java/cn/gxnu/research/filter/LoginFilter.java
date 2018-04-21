package cn.gxnu.research.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException 
	{
		// TODO Auto-generated method stub
		System.out.println("First Filter------doFilter start"); 
		
		//从session里取的用户名信息
		 HttpServletRequest req = (HttpServletRequest) request;
		 HttpServletResponse res = (HttpServletResponse) response;
		 HttpSession session = req.getSession();
	     String username = (String) session.getAttribute("loginUser");
	     String basePath = req.getContextPath();
	     String requestUrl = req.getRequestURI();
	     
	     if(requestUrl!=null&&("/ResearchResult/login.jsp".equals(requestUrl)
	    		 ||"/ResearchResult/logout.do".equals(requestUrl)
	    		 ||"/ResearchResult/login.do".equals(requestUrl)
	    		 ||"/ResearchResult/home.do".equals(requestUrl)
	    		 ||"/ResearchResult/researchTrend.do".equals(requestUrl)
	    		 ||"/ResearchResult/researchResult.do".equals(requestUrl)
	    		 ||"/ResearchResult/views/contactUs.jsp".equals(requestUrl)
	    		 ||"/ResearchResult/findReportByPage.do".equals(requestUrl)
	    		 ||"/ResearchResult/reportDetail.do".equals(requestUrl)
	    		 ||"/ResearchResult/views/contactUs.jsp".equals(requestUrl)
	    		 ||"/ResearchResult/findResultByPage.do".equals(requestUrl)
	    		 ||"/ResearchResult/researchResult.do".equals(requestUrl)
	    		 ||"/ResearchResult/views/uploadImage.do".equals(requestUrl)
	    		 ||"/ResearchResult/uploadEditImage.do".equals(requestUrl)
	    		 ||"/ResearchResult/resultDetail.do".equals(requestUrl)
	    		 ||"/ResearchResult/views/researchTrend.jsp".equals(requestUrl)
	    		 ||"/ResearchResult/views/reportDetail.jsp".equals(requestUrl)
	    		 ||"/ResearchResult/views/resultDetail.jsp".equals(requestUrl)
	    		 ||"/ResearchResult/views/editResult.jsp".equals(requestUrl)
	    		 ||requestUrl.contains("/ResearchResult/js")
	    		 ||requestUrl.contains("/ResearchResult/css")
	    		 ||requestUrl.contains("/ResearchResult/dialogs")
	    		 ||requestUrl.contains("/ResearchResult/image")
	    		 ||requestUrl.contains("/ResearchResult/lang")
	    		 ||requestUrl.contains("/ResearchResult/themes")
	    		 ||requestUrl.contains("/ResearchResult/third-party")
	    		 )
	    		 )
	    		 
	     {
	    	 chain.doFilter(request,response);
	     }
	     else
	     {
			    //判断如果没有取到用户信息,就跳转到登陆页面
			    if (username == null || "".equals(username)) 
			    {
			      //跳转到登陆页面
			    	
			      res.sendRedirect(req.getContextPath()+"/logout.do");
			    }
			    else 
			    {
			      //已经登陆,继续此次请求
			      chain.doFilter(request,response);
			    }
		  
	     }

 
          
        System.out.println("First Filter------doFilter end"); 

	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
