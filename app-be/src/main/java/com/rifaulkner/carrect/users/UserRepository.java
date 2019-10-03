package com.rifaulkner.carrect.users;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Long> {

    List<UserEntity> findByFirstName(String FirstName);
    List<UserEntity> findAll();
}
