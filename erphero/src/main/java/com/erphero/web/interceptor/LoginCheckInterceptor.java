package com.erphero.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.erphero.web.utils.SessionUtils;


public class LoginCheckInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if (SessionUtils.getAttribute("LOGINED_EMPLOYEE") == null) {
			
			response.sendRedirect("/login?error=deny");	
			return false;
		}
		return true;
	}
}
