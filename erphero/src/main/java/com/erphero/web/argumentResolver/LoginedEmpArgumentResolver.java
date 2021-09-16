package com.erphero.web.argumentResolver;

import java.util.Objects;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.erphero.web.annotation.LoginedEmp;
import com.erphero.web.utils.SessionUtils;

public class LoginedEmpArgumentResolver implements HandlerMethodArgumentResolver{

	
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		return Objects.nonNull(parameter.getParameterAnnotation(LoginedEmp.class));
	}
	
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		return SessionUtils.getAttribute("LOGINED_EMPLOYEE");
	}
}
