package com.bian.spring.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bian.spring.entites.User;

@Component
public class LoginInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		
		User _user = (User) request.getSession().getAttribute("_user");
		System.out.println("此时:"+_user);
		if( _user == null){
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter writer = response.getWriter();
		    writer.write(
				   "<script>alert('对不起你还没有登录!请重新登录!') ;window.parent.location.href='"+request.getContextPath()+"/login.jsp';</script>"  );
		    return false;
		}
		
		return true;
	}
	

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object arg2, ModelAndView arg3)
			throws Exception {
		
	}



}
