package com.ihrm.system.controller;

import com.ihrm.domain.system.Permission;
import com.ihrm.system.service.PermissionService;
import com.itheima.common.controller.BaseController;
import com.itheima.common.entity.Result;
import com.itheima.common.entity.ResultCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@CrossOrigin
@RestController
@RequestMapping("/sys")
public class PermissionController extends BaseController {
    @Autowired
    private PermissionService permissionService;

    //保存权限
    @PostMapping("/promission")
    public Result save(@RequestBody Map<String, Object> map) throws Exception {
        permissionService.save(map);
        return new Result(ResultCode.SUCCESS);
    }

    //修改权限
    @PutMapping("/promission/{id}")
    public Result update(@PathVariable String id, @RequestBody Map<String, Object> map) throws Exception {
        //构造id
        map.put("id", id);
        permissionService.update(map);
        return new Result(ResultCode.SUCCESS);
    }

    //删除权限
    @DeleteMapping("/promission/{id}")
    public Result dalete(@PathVariable String id) throws Exception {
        permissionService.delete(id);
        return new Result(ResultCode.SUCCESS);
    }

    //根据ID获取权限信息
    @GetMapping("/promission/{id}")
    public Result findById(@PathVariable String id) throws Exception {
        Map map = permissionService.findById(id);
        return new Result(ResultCode.SUCCESS, map);
    }

    //查询权限列表
    @GetMapping("/promission")
    public Result findByPage(@RequestParam Map map) {
        List<Permission> list = permissionService.findAll(map);
        return new Result(ResultCode.SUCCESS, list);
    }
}
