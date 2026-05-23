package com.loopyouth.config;

import com.loopyouth.entity.UserInfo;
import com.loopyouth.repository.UserInfoRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class AdminInterceptor implements HandlerInterceptor {

    private final UserInfoRepository userRepo;

    public AdminInterceptor(UserInfoRepository userRepo) {
        this.userRepo = userRepo;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Object userId = session.getAttribute("user_id");

        if (userId == null) {
            response.sendRedirect("/user/login/");
            return false;
        }

        UserInfo user = userRepo.findById((Integer) userId).orElse(null);
        if (user == null || !Boolean.TRUE.equals(user.getIsAdmin())) {
            response.sendRedirect("/");
            return false;
        }

        request.setAttribute("adminUser", user);
        return true;
    }
}
