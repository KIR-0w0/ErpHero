package com.erphero.web.annotaion;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 요청핸들러 메소드의 매개변수에 사용되는 어노테이션이다.<br/>
 * HttpSession에 저장된 로그인된 사원정보를 요청핸들러 메소드의 매개변수로 전달받기 위해서 사용한다.<br />
 * @author KIR
 *
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.PARAMETER)
public @interface LoginedEmp {

}
