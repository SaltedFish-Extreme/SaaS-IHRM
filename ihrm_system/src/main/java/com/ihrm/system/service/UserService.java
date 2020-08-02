package com.ihrm.system.service;


import com.ihrm.domain.system.Role;
import com.ihrm.domain.system.User;
import com.ihrm.system.dao.RoleDao;
import com.ihrm.system.dao.UserDao;
import com.itheima.common.utils.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.*;

@Service
public class UserService {
    @Autowired
    IdWorker idWorker;
    @Autowired
    private UserDao userDao;
    @Autowired
    private RoleDao roleDao;

    //保存用户
    public void save(User user) {
        //设置主键的值
        String id = idWorker.nextId() + "";
        user.setId(id);
        user.setPassword("123456");//设置初始密码
        user.setEnableState(1);
        //调用dao保存用户
        userDao.save(user);
    }

    //更新用户
    public void update(User user) {
        //根据id查询用户
        User target = userDao.findById(user.getId()).get();
        //设置用户属性
        target.setUsername(user.getUsername());
        target.setPassword(user.getPassword());
        target.setDepartmentId(user.getDepartmentId());
        target.setDepartmentName(user.getDepartmentName());
        //更新用户
        userDao.save(target);
    }

    //根据id查询用户
    public User findById(String id) {
        return userDao.findById(id).get();
    }

    /**
     * 分页查询全部用户列表
     * 参数：map集合的形式
     * hasDept
     * departmentId
     * companyId
     */
    public Page<User> findAll(Map<String, Object> map, int page, int size) {
        Specification<User> spec = new Specification<User>() {
            /**
             * 动态拼接查询条件
             */
            @Override
            public Predicate toPredicate(Root<User> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                List<Predicate> list = new ArrayList<>();
                //根据请求的companyId是否为空构造查询条件
                if (!StringUtils.isEmpty(map.get("companyId"))) {
                    list.add(cb.equal(root.get("companyId").as(String.class), map.get("companyId")));
                }
                //根据请求的部门id构造查询条件
                if (!StringUtils.isEmpty(map.get("departmentId"))) {
                    list.add(cb.equal(root.get("departmentId").as(String.class), map.get("departmentId")));
                }
                if (!StringUtils.isEmpty(map.get("hasDept"))) {
                    //根据请求的hasDept判断 是否分配部门 0未分配(departmentId=null),1已分配(departmentId!=null)
                    if ("0".equals(map.get("hasDept"))) {
                        list.add(cb.isNull(root.get("departmentId")));
                    } else {
                        list.add(cb.isNotNull(root.get("departmentId")));
                    }
                }
                return cb.and(list.toArray(new Predicate[list.size()]));
            }
        };
        //分页
        return userDao.findAll(spec, PageRequest.of(page, size));
    }

    //根据id删除用户
    public void delete(String id) {
        userDao.deleteById(id);
    }

    //分配角色
    public void assignRoles(String userId, List<String> roleIds) {
        //根据id查询用户
        User user = userDao.findById(userId).get();
        //设置用户的角色集合
        Set<Role> roles = new HashSet<>();
        for (String roleId : roleIds) {
            Role role = roleDao.findById(roleId).get();
            roles.add(role);
        }
        //设置用户和角色集合的关系
        user.setRoles(roles);
        //更新用户
        userDao.save(user);
    }

    //根据mobile查询用户
    public User findByMobile(String mobile) {
        return userDao.findByMobile(mobile);
    }
}
