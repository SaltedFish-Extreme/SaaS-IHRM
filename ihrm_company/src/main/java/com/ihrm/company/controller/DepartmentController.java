package com.ihrm.company.controller;

import com.ihrm.company.service.CompanyService;
import com.ihrm.company.service.DepartmentService;
import com.ihrm.domain.company.Company;
import com.ihrm.domain.company.Department;
import com.ihrm.domain.company.response.DeptListResult;
import com.itheima.common.controller.BaseController;
import com.itheima.common.entity.Result;
import com.itheima.common.entity.ResultCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/company")
public class DepartmentController extends BaseController {
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private CompanyService companyService;

    //保存部门
    @PostMapping("/department")
    public Result save(@RequestBody Department department) {
        //设置保存的企业id
        department.setCompanyId(companyId);
        //调用service保存企业
        departmentService.save(department);
        //构造返回结果
        return new Result(ResultCode.SUCCESS);
    }

    //查询企业的部门列表
    @GetMapping("/department")
    public Result findAll() {
        //指定企业id
        Company company = companyService.findById(companyId);
        //完成查询
        List<Department> list = departmentService.findAll(companyId);
        //构造返回结果
        DeptListResult deptListResult = new DeptListResult(company, list);
        return new Result(ResultCode.SUCCESS, deptListResult);
    }

    //根据id查询部门
    @GetMapping("/department/{id}")
    public Result findById(@PathVariable String id) {
        Department department = departmentService.findById(id);
        return new Result(ResultCode.SUCCESS, department);
    }

    //修改部门
    @PutMapping("/department/{id}")
    public Result update(@PathVariable String id, @RequestBody Department department) {
        //设置修改的部门id
        department.setId(id);
        //调用service更新
        departmentService.update(department);
        return new Result(ResultCode.SUCCESS);
    }

    //删除部门
    @DeleteMapping("/department/{id}")
    public Result update(@PathVariable String id) {
        departmentService.delete(id);
        return new Result(ResultCode.SUCCESS);
    }
}
