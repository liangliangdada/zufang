package com.liang.zufang;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
@MapperScan("com.liang.zufang.mapper")
public class ZufangApplication {

    public static void main(String[] args) {
        SpringApplication.run(ZufangApplication.class, args);
    }

}
