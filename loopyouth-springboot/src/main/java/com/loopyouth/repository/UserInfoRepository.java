package com.loopyouth.repository;

import com.loopyouth.entity.UserInfo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserInfoRepository extends JpaRepository<UserInfo, Integer> {

    Optional<UserInfo> findByUname(String uname);

    Optional<UserInfo> findByUemail(String uemail);

    long countByUname(String uname);

    long countByUemail(String uemail);
}
