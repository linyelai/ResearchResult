package cn.gxnu.research.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class ResearchInterceptor implements HandlerInterceptor {

	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		 System.out.println("===========HandlerInterceptor1 afterCompletion"); 
	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView mv)
			throws Exception 
	{
		// TODO Auto-generated method stub
		mv.setViewName("login");
		 System.out.println("===========HandlerInterceptor1 postHandle");  

	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse arg1, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		String loginUser = (String) request.getSession().getAttribute("loginUser");
		if(loginUser==null)
		{
			return false;
		}
		else
		{
			return true;
		}
		
	}

}
