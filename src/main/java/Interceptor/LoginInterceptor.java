package Interceptor;

import entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    /**
     * 请求之前调用
     *
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
//        System.out.println("preHandle :" + user);
        if (user != null)
            return true;
        request.getSession().setAttribute("msg","您还没有登录,请先登录!,将在3秒后跳转到登录界面");
        request.getRequestDispatcher("login.jsp").forward(request,response);
        return false;
    }

    /**
     * 在controller后,视图返回前调用
     *
     * @param request
     * @param response
     * @param handler
     * @param modelAndView
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
//        System.out.println("postHandle :" + user);
    }

    /**
     * 在视图返回后调用
     *
     * @param request
     * @param response
     * @param handler
     * @param ex
     * @throws Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
//        System.out.println("afterCompletion :" + user);
    }
}
