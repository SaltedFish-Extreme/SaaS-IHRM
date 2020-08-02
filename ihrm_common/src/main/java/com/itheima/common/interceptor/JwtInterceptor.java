package com.itheima.common.interceptor;

import com.itheima.common.entity.ResultCode;
import com.itheima.common.exception.CommonException;
import com.itheima.common.utils.JwtUtils;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 自定义拦截器
 */
@Component
public class JwtInterceptor extends HandlerInterceptorAdapter {
    @Autowired
    private JwtUtils jwtUtils;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //通过request获取请求token信息
        String header = request.getHeader("Authorization");
        //判断请求头信息是否为空或是否以Bearer开头
        if (!StringUtils.isEmpty(header) && header.startsWith("Bearer")) {
            //替换头前缀
            String token = header.replace("Bearer ", "");
            //解析token获取claims
            Claims claims = jwtUtils.parseJwt(token);
            //设置request域属性
            if (claims != null) {
                //通过claims获取当前用户的可访问的api权限字符串
                String apis = claims.get("apis").toString();
                //通过handler
                HandlerMethod h = (HandlerMethod) handler;
                //获取接口上的RequestMapping注解
                RequestMapping annotation = h.getMethodAnnotation(RequestMapping.class);
                //获取当前请求接口中的name属性
                String name = annotation.name();
                //判断当前用户是否具有相应的请求权限
                if (apis.contains(name)) {
                    request.setAttribute("user_claims", claims);
                    return true;
                } else {
                    throw new CommonException(ResultCode.UNAUTHORISE);
                }
            }
        }
        throw new CommonException(ResultCode.UNAUTHENTICATED);
    }
}
