package web.game.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.AsyncHandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public abstract class HandlerInterceptorAdapter implements AsyncHandlerInterceptor {

    // 在目标方法执行前执行
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	System.out.println("aaaaaaaa1");
        return true;
    }

    // 在目标方法执行后执行，但在请求返回前，我们仍然可以对 ModelAndView进行修改
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) 
                          throws Exception {
    	System.out.println("aaaaaaaa2");
    }

    // 在请求已经返回之后执行
    public void afterCompletion(
            HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
    	System.out.println("aaaaaaaa3");
    }

    // 用来处理异步请求, 当Controller中有异步请求方法的时候会触发该方法
    @Override
    public void afterConcurrentHandlingStarted(
            HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
    	System.out.println("aaaaaaaa4");
    }
}
