package com.ihrm.system.controller;

import com.ihrm.domain.system.Role;
import com.ihrm.domain.system.response.RoleResult;
import com.ihrm.system.service.RoleService;
import com.itheima.common.controller.BaseController;
import com.itheima.common.entity.PageResult;
import com.itheima.common.entity.Result;
import com.itheima.common.entity.ResultCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@CrossOrigin
@RestController
@RequestMapping("/sys")
public class RoleController extends BaseController {
    @Autowired
    private RoleService roleService;

    //保存角色
    @PostMapping("/role")
    public Result save(@RequestBody Role role) {
        //设置保存的企业id
        role.setCompanyId(companyId);
        //调用service保存角色
        roleService.save(role);
        //构造返回结果
        return new Result(ResultCode.SUCCESS);
    }

    //修改角色
    @PutMapping("/role/{id}")
    public Result update(@PathVariable String id, @RequestBody Role role) {
        //设置修改的角色id
        role.setId(id);
        //调用service更新
        roleService.update(role);
        return new Result(ResultCode.SUCCESS);
    }

    //删除角色
    @DeleteMapping("/role/{id}")
    public Result dalete(@PathVariable String id) {
        roleService.delete(id);
        return new Result(ResultCode.SUCCESS);
    }

    //根据ID获取角色信息
    @GetMapping("/role/{id}")
    public Result findById(@PathVariable String id) {
        Role role = roleService.findById(id);
        RoleResult roleResult = new RoleResult(role);
        return new Result(ResultCode.SUCCESS, roleResult);
    }

    //分页查询角色
    @GetMapping("/role")
    public Result findByPage(int page, int size, Role role) {
        //完成查询
        Page<Role> rolePage = roleService.findsearch(role.getCompanyId(), page, size);
        //构造返回结果
        PageResult<Role> pageResult = new PageResult(rolePage.getTotalElements(), rolePage.getContent());
        return new Result(ResultCode.SUCCESS, pageResult);
    }

    //分配权限
    @PutMapping("/role/assignRoles")
    public Result save(@RequestBody Map<String, Object> map) {
        //获取被分配的角色id
        String roleId = (String) map.get("id");
        //获取到权限的id列表
        List<String> PermIds = (List<String>) map.get("roleIds");
        //调用service完成角色分配
        roleService.assignPerms(roleId, PermIds);
        return new Result(ResultCode.SUCCESS);
    }
}
