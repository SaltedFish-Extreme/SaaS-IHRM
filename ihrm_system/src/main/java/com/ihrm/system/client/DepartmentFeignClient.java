package com.ihrm.system.client;

import com.itheima.common.entity.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

//声明接口，通过feign调用其他微服务
@FeignClient("ihrm-company")
public interface DepartmentFeignClient {
    //调用微服务接口
    @GetMapping("/company/department/{id}")
    public Result findById(@PathVariable String id);
}
