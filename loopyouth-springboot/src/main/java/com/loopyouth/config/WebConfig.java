package com.loopyouth.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Value("${upload.path}")
    private String uploadPath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/media/**")
                .addResourceLocations("file:" + uploadPath);

        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // No paths intercepted by default -- controllers handle login checks inline
        // Uncomment below to enforce login for specific paths via interceptor:
        // registry.addInterceptor(new LoginInterceptor())
        //         .addPathPatterns("/user/info/", "/user/order/**", "/user/site/", "/cart/**", "/order/**")
        //         .excludePathPatterns("/user/login/", "/user/register/", "/static/**");
    }
}
