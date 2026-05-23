package com.loopyouth.service.impl;

import com.loopyouth.entity.*;
import com.loopyouth.repository.*;
import com.loopyouth.service.AdminService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

@Service
public class AdminServiceImpl implements AdminService {

    private final UserInfoRepository userRepo;
    private final GoodsInfoRepository goodsRepo;
    private final OrderInfoRepository orderRepo;
    private final GoodsContentRepository commentRepo;
    private final OrderDetailInfoRepository orderDetailRepo;

    public AdminServiceImpl(UserInfoRepository userRepo,
                            GoodsInfoRepository goodsRepo,
                            OrderInfoRepository orderRepo,
                            GoodsContentRepository commentRepo,
                            OrderDetailInfoRepository orderDetailRepo) {
        this.userRepo = userRepo;
        this.goodsRepo = goodsRepo;
        this.orderRepo = orderRepo;
        this.commentRepo = commentRepo;
        this.orderDetailRepo = orderDetailRepo;
    }

    @Override
    public Map<String, Object> getDashboardStats() {
        Map<String, Object> stats = new HashMap<>();
        stats.put("userCount", userRepo.count());
        stats.put("goodsCount", goodsRepo.count());
        stats.put("orderCount", orderRepo.count());
        stats.put("commentCount", commentRepo.count());
        return stats;
    }

    @Override
    public Page<UserInfo> getUsers(int page, int size, String keyword) {
        Pageable pageable = PageRequest.of(page, size);
        if (keyword != null && !keyword.isBlank()) {
            return userRepo.adminSearch(keyword.trim(), pageable);
        }
        return userRepo.findAllByOrderByIdDesc(pageable);
    }

    @Override
    @Transactional
    public void toggleUserBan(Integer userId) {
        UserInfo user = userRepo.findById(userId).orElseThrow();
        user.setUnamePassOrfail(!user.getUnamePassOrfail());
        userRepo.save(user);
    }

    @Override
    @Transactional
    public void toggleUserVerify(Integer userId) {
        UserInfo user = userRepo.findById(userId).orElseThrow();
        user.setUcheckPassOrfail(!user.getUcheckPassOrfail());
        userRepo.save(user);
    }

    @Override
    @Transactional
    public void deleteUser(Integer userId) {
        userRepo.deleteById(userId);
    }

    @Override
    public Page<GoodsInfo> getGoods(int page, int size, String keyword) {
        Pageable pageable = PageRequest.of(page, size);
        if (keyword != null && !keyword.isBlank()) {
            return goodsRepo.adminSearch(keyword.trim(), pageable);
        }
        return goodsRepo.findAllByOrderByIdDesc(pageable);
    }

    @Override
    @Transactional
    public void deleteGoods(Integer goodsId) {
        GoodsInfo goods = goodsRepo.findById(goodsId).orElseThrow();
        goods.setIsDelete(true);
        goodsRepo.save(goods);
    }

    @Override
    public Page<OrderInfo> getOrders(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return orderRepo.findAllByOrderByOdateDesc(pageable);
    }

    @Override
    public Page<GoodsContent> getComments(int page, int size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(Sort.Direction.DESC, "datePublish"));
        return commentRepo.findAll(pageable);
    }

    @Override
    @Transactional
    public void deleteComment(Integer commentId) {
        GoodsContent comment = commentRepo.findById(commentId).orElseThrow();
        comment.setIsDelete(true);
        commentRepo.save(comment);
    }
}
