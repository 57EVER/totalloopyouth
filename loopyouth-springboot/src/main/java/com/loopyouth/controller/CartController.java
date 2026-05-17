package com.loopyouth.controller;

import com.loopyouth.entity.CartInfo;
import com.loopyouth.entity.UserInfo;
import com.loopyouth.service.CartService;
import com.loopyouth.service.UserService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartController {

    private final CartService cartService;
    private final UserService userService;

    @GetMapping({"", "/"})
    public Object userCart(Model model, HttpSession session,
                           @RequestHeader(value = "x-requested-with", required = false) String xRequestedWith) {
        Integer uid = (Integer) session.getAttribute("user_id");
        if (uid == null) return "redirect:/user/login/";

        if ("XMLHttpRequest".equals(xRequestedWith)) {
            Map<String, Long> result = new HashMap<>();
            result.put("count", cartService.countByUserId(uid));
            return result;
        }

        String username = (String) session.getAttribute("user_name");
        UserInfo user = userService.findByUname(username);
        List<CartInfo> carts = cartService.findByUserId(uid);
        long cartNum = cartService.countByUserId(uid);

        model.addAttribute("title", "购物车");
        model.addAttribute("page_name", 1);
        model.addAttribute("guest_cart", 1);
        model.addAttribute("carts", carts);
        model.addAttribute("cart_num", cartNum);
        model.addAttribute("user", user);

        return "df_cart/cart";
    }

    @GetMapping("/add{gid}_{count}/")
    public String add(@PathVariable("gid") Integer gid,
                      @PathVariable("count") Integer count,
                      HttpSession session) {
        Integer uid = (Integer) session.getAttribute("user_id");
        if (uid == null) return "redirect:/user/login/";

        cartService.addToCart(uid, gid, count);
        return "redirect:/cart/";
    }

    @GetMapping("/edit{cartId}_{count}/")
    @ResponseBody
    public Map<String, Integer> edit(@PathVariable("cartId") Integer cartId,
                                     @PathVariable("count") Integer count) {
        Map<String, Integer> data = new HashMap<>();
        try {
            cartService.editCartCount(cartId, count);
            data.put("count", 0);
        } catch (Exception e) {
            data.put("count", count);
        }
        return data;
    }

    @GetMapping("/delete{cartId}/")
    @ResponseBody
    public Map<String, Integer> delete(@PathVariable("cartId") Integer cartId) {
        Map<String, Integer> data = new HashMap<>();
        data.put("ok", cartService.deleteCart(cartId) ? 1 : 0);
        return data;
    }
}
