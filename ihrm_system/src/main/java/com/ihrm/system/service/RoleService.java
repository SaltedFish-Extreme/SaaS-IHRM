package com.ihrm.system.service;


import com.ihrm.domain.system.Permission;
import com.ihrm.domain.system.Role;
import com.ihrm.system.dao.PermissionDao;
import com.ihrm.system.dao.RoleDao;
import com.itheima.common.utils.IdWorker;
import com.itheima.common.utils.PermissionConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class RoleService {
    @Autowired
    IdWorker idWorker;
    @Autowired
    private RoleDao roleDao;
    @Autowired
    private PermissionDao permissionDao;

    //添加角色
    public void save(Role role) {
        //设置主键的值
        String id = idWorker.nextId() + "";
        role.setId(id);
        //调用dao保存角色
        roleDao.save(role);
    }

    //更新角色
    public void update(Role role) {
        //根据id查询角色
        Role target = roleDao.findById(role.getId()).get();
        //设置角色属性
        target.setName(role.getName());
        target.setDescription(role.getDescription());
        //更新角色
        roleDao.save(target);
    }

    //根据id查询角色
    public Role findById(String id) {
        return roleDao.findById(id).get();
    }

    //分页根据企业id查询角色
    public Page<Role> findsearch(String CompanyId, int page, int size) {
        Specification<Role> spec = (Specification<Role>) (root, cq, cb) -> cb.equal(root.get("CompanyId").as(String.class), CompanyId);
        //分页
        return roleDao.findAll(spec, PageRequest.of(page, size));
    }

    //根据id删除角色
    public void delete(String id) {
        roleDao.deleteById(id);
    }

    //分配权限
    public void assignPerms(String roleId, List<String> permIds) {
        //根据id查询角色
        Role role = roleDao.findById(roleId).get();
        //设置角色的权限集合
        Set<Permission> perms = new HashSet<>();
        for (String permId : permIds) {
            Permission permission = permissionDao.findById(permId).get();
            //根据父id和类型查询权限列表
            List<Permission> apiList = permissionDao.findByTypeAndPid(PermissionConstants.PY_API, permission.getId());
            perms.addAll(apiList);//自动赋予api权限
            perms.add(permission);//当前菜单或按钮的权限
        }
        //设置角色和权限集合的关系
        role.setPermissions(perms);
        //更新角色
        roleDao.save(role);
    }
}