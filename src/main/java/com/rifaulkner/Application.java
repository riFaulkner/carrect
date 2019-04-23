package com.rifaulkner;

/**
 * Created by richard on 3/4/17.
 */
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@EnableJpaRepositories("com.rifaulkner.*")
//@ComponentScan(basePackages = { "com.rifaulkner.*" })
@ComponentScan("com.rifaulkner.*")
@EntityScan("com.rifaulkner.*")
@SpringBootApplication
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}