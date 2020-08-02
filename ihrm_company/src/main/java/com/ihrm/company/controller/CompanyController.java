package com.ihrm.company.controller;

import com.ihrm.company.service.CompanyService;
import com.ihrm.domain.company.Company;
import com.itheima.common.entity.Result;
import com.itheima.common.entity.ResultCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/company")
public class CompanyController {
    @Autowired
    private CompanyService companyService;

    //保存企业
    @PostMapping("/")
    public Result save(@RequestBody Company company) {
        //业务操作
        companyService.add(company);
        return new Result(ResultCode.SUCCESS);
    }

    //更新企业
    @PutMapping("/{id}")
    public Result update(@PathVariable String id, @RequestBody Company company) {
        //业务操作
        company.setId(id);
        companyService.update(company);
        return new Result(ResultCode.SUCCESS);
    }

    //删除企业
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable String id) {
        //业务操作
        companyService.delete(id);
        return new Result(ResultCode.SUCCESS);
    }

    //根据id查询企业
    @GetMapping("/{id}")
    public Result findById(@PathVariable String id) {
        //业务操作
        Company company = companyService.findById(id);
        Result result = new Result(ResultCode.SUCCESS);
        result.setData(company);
        return result;
    }

    //查询所有企业
    @GetMapping("/")
    public Result findAll() {
        //业务操作
        List<Company> all = companyService.findAll();
        Result result = new Result(ResultCode.SUCCESS);
        result.setData(all);
        return result;
    }
}
