package com.ihrm.system.controller;

import com.ihrm.domain.system.Permission;
import com.ihrm.domain.system.Role;
import com.ihrm.domain.system.User;
import com.ihrm.domain.system.response.ProfileResult;
import com.ihrm.domain.system.response.UserResult;
import com.ihrm.system.client.DepartmentFeignClient;
import com.ihrm.system.service.PermissionService;
import com.ihrm.system.service.UserService;
import com.itheima.common.controller.BaseController;
import com.itheima.common.entity.PageResult;
import com.itheima.common.entity.Result;
import com.itheima.common.entity.ResultCode;
import com.itheima.common.utils.JwtUtils;
import com.itheima.common.utils.PermissionConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@CrossOrigin
@RestController
@RequestMapping("/sys")
public class UserController extends BaseController {
    @Autowired
    private UserService userService;
    @Autowired
    private JwtUtils jwtUtils;
    @Autowired
    private PermissionService permissionService;
    @Autowired
    private DepartmentFeignClient departmentFeignClient;

    //测试feign组件
    //调用系统微服务的test接口传递部门id，通过feign调用部门微服务获取部门信息
    @GetMapping("/test/{id}")
    public Result testFeign(@PathVariable String id) {
        Result result = departmentFeignClient.findById(id);
        return result;
    }

    //保存用户
    @PostMapping("/user")
    public Result save(@RequestBody User user) {
        //设置保存的企业id
        user.setCompanyId(companyId);
        //设置保存的企业名称
        user.setCompanyName(companyName);
        //调用service保存用户
        userService.save(user);
        //构造返回结果
        return new Result(ResultCode.SUCCESS);
    }

    //分页查询所有用户
    @GetMapping("/user")
    public Result findAll(int page, int size, @RequestParam Map map) {
        //完成查询
        Page<User> pageUser = userService.findAll(map, page, size);
        //构造返回结果
        PageResult<User> pageResult = new PageResult(pageUser.getTotalElements(), pageUser.getContent());
        return new Result(ResultCode.SUCCESS, pageResult);
    }

    //根据id查询用户
    @GetMapping("/user/{id}")
    public Result findById(@PathVariable String id) {
        //添加roleIds(用户已经具有的角色id数组)
        User user = userService.findById(id);
        UserResult userResult = new UserResult(user);
        return new Result(ResultCode.SUCCESS, userResult);
    }

    //修改用户
    @PutMapping("/user/{id}")
    public Result update(@PathVariable String id, @RequestBody User user) {
        //设置修改的用户id
        user.setId(id);
        //调用service更新
        userService.update(user);
        return new Result(ResultCode.SUCCESS);
    }

    //删除用户
    @DeleteMapping("/user/{id}")
    public Result update(@PathVariable String id) {
        userService.delete(id);
        return new Result(ResultCode.SUCCESS);
    }

    //分配角色
    @PutMapping("/user/assignRoles")
    public Result save(@RequestBody Map<String, Object> map) {
        //获取被分配的用户id
        String userId = (String) map.get("id");
        //获取到角色的id列表
        List<String> roleIds = (List<String>) map.get("roleIds");
        //调用service完成角色分配
        userService.assignRoles(userId, roleIds);
        return new Result(ResultCode.SUCCESS);
    }

    //登录
    @PutMapping("/login")
    public Result login(@RequestBody Map<String, String> loginMap) {
        String mobile = loginMap.get("mobile");
        String password = loginMap.get("password");
        //通过service根据mobile查询用户
        User user = userService.findByMobile(mobile);
        //比较用户名和密码
        //登录失败
        if (user == null || !user.getPassword().equals(password)) {
            return new Result(ResultCode.MOBILE_ERROR_PASSWORD_ERROR);
        } else {
            //登录成功
            //api权限字符串
            StringBuilder sb = new StringBuilder();
            //获取所有可访问的api权限
            for (Role role : user.getRoles()) {
                for (Permission perm : role.getPermissions()) {
                    if (perm.getType() == PermissionConstants.PY_API) {
                        sb.append(perm.getCode()).append(",");
                    }
                }
            }
            //生成jwt信息
            Map<String, Object> map = new HashMap<>();
            map.put("apis", sb.toString());//可访问的api权限字符串
            map.put("companyId", user.getCompanyId());
            map.put("companyName", user.getCompanyName());
            String token = jwtUtils.createJwt(user.getId(), user.getUsername(), map);
            return new Result(ResultCode.SUCCESS, token);
        }
    }

    //获取用户信息
    @PutMapping("/profile")
    public Result profile() {
        String userid = claims.getId();
        //根据用户id获取用户信息
        User user = userService.findById(userid);
        //根据不同的用户级别获取权限
        ProfileResult result;
        if ("user".equals(user.getLevel())) {
            result = new ProfileResult(user);
        } else {
            Map map = new HashMap();
            if ("coAdmin".equals(user.getLevel())) {
                map.put("enVisible", "1");
            }
            List<Permission> list = permissionService.findAll(map);
            result = new ProfileResult(user, list);
        }
        return new Result(ResultCode.SUCCESS, result);
    }
}
