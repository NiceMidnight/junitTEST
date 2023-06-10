package com.gip.interceptor;

import com.gip.pojo.Employee;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @FileName LoginInterceptor
 * @Description
 * @Author Tiamo_Null
 * @date 2023-06-05
 **/
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        //用于调试
        //HandlerMethod hd=(HandlerMethod)handler;
        //System.out.println("拦截啦...方法："+hd.getMethod().getName()+",请求名："+request.getRequestURI());

        //String requestURL = request.getRequestURI();
        //凡是需要验证的请求(你自己配置来指定)，调用控制器方法前，都会先执行preHandle
        HttpSession session=request.getSession();
        String user=(String) session.getAttribute("Employee");
        if(user!=null && !user.isEmpty())
        {
            return true;
        }
        else {
            session.setAttribute("msg","用户名或密码错误！");
            request.getRequestDispatcher("login").forward(request, response);
            return false;
        }
    }
}
