package com.loopyouth.controller;

import com.loopyouth.entity.GoodsContent;
import com.loopyouth.entity.GoodsInfo;
import com.loopyouth.entity.OrderInfo;
import com.loopyouth.entity.UserInfo;
import com.loopyouth.service.AdminService;
import jakarta.servlet.http.HttpSession;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final AdminService adminService;

    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }

    @GetMapping({"", "/"})
    public String dashboard(Model model) {
        Map<String, Object> stats = adminService.getDashboardStats();
        model.addAttribute("title", "管理后台");
        model.addAttribute("stats", stats);
        return "admin/dashboard";
    }

    @GetMapping("/users")
    public String users(@RequestParam(defaultValue = "0") int page,
                        @RequestParam(required = false) String q,
                        Model model) {
        Page<UserInfo> users = adminService.getUsers(page, 15, q);
        model.addAttribute("title", "用户管理");
        model.addAttribute("users", users);
        model.addAttribute("q", q);
        return "admin/users";
    }

    @PostMapping("/users/{id}/toggleBan")
    @ResponseBody
    public Map<String, Object> toggleBan(@PathVariable Integer id) {
        adminService.toggleUserBan(id);
        return Map.of("ok", true);
    }

    @PostMapping("/users/{id}/toggleVerify")
    @ResponseBody
    public Map<String, Object> toggleVerify(@PathVariable Integer id) {
        adminService.toggleUserVerify(id);
        return Map.of("ok", true);
    }

    @PostMapping("/users/{id}/delete")
    @ResponseBody
    public Map<String, Object> deleteUser(@PathVariable Integer id) {
        adminService.deleteUser(id);
        return Map.of("ok", true);
    }

    @GetMapping("/goods")
    public String goods(@RequestParam(defaultValue = "0") int page,
                        @RequestParam(required = false) String q,
                        Model model) {
        Page<GoodsInfo> goods = adminService.getGoods(page, 15, q);
        model.addAttribute("title", "商品管理");
        model.addAttribute("goods", goods);
        model.addAttribute("q", q);
        return "admin/goods";
    }

    @PostMapping("/goods/{id}/delete")
    @ResponseBody
    public Map<String, Object> deleteGoods(@PathVariable Integer id) {
        adminService.deleteGoods(id);
        return Map.of("ok", true);
    }

    @GetMapping("/orders")
    public String orders(@RequestParam(defaultValue = "0") int page,
                         Model model) {
        Page<OrderInfo> orders = adminService.getOrders(page, 15);
        model.addAttribute("title", "订单管理");
        model.addAttribute("orders", orders);
        return "admin/orders";
    }

    @GetMapping("/comments")
    public String comments(@RequestParam(defaultValue = "0") int page,
                           Model model) {
        Page<GoodsContent> comments = adminService.getComments(page, 15);
        model.addAttribute("title", "评论管理");
        model.addAttribute("comments", comments);
        return "admin/comments";
    }

    @PostMapping("/comments/{id}/delete")
    @ResponseBody
    public Map<String, Object> deleteComment(@PathVariable Integer id) {
        adminService.deleteComment(id);
        return Map.of("ok", true);
    }
}
