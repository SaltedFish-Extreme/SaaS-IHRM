package com.ihrm.domain.system.response;

import com.ihrm.domain.system.Permission;
import com.ihrm.domain.system.Role;
import com.ihrm.domain.system.User;
import lombok.Data;

import java.util.*;

@Data
public class ProfileResult {
    private String mobile;
    private String username;
    private String company;
    private Map<String, Object> roles = new HashMap<>();

    public ProfileResult(User user, List<Permission> list) {
        this.mobile = user.getMobile();
        this.username = user.getUsername();
        this.company = user.getCompanyName();

        Set<String> menus = new HashSet<>();
        Set<String> points = new HashSet<>();
        Set<String> apis = new HashSet<>();

        for (Permission prem : list) {
            String code = prem.getCode();
            if (prem.getType() == 1) {
                menus.add(code);
            } else if (prem.getType() == 2) {
                points.add(code);
            } else {
                apis.add(code);
            }
        }
        this.roles.put("menus", menus);
        this.roles.put("points", points);
        this.roles.put("apis", apis);
    }

    public ProfileResult(User user) {
        this.mobile = user.getMobile();
        this.username = user.getUsername();
        this.company = user.getCompanyName();

        Set<Role> roles = user.getRoles();
        Set<String> menus = new HashSet<>();
        Set<String> points = new HashSet<>();
        Set<String> apis = new HashSet<>();

        for (Role role : roles) {
            Set<Permission> prems = role.getPermissions();
            for (Permission prem : prems) {
                String code = prem.getCode();
                if (prem.getType() == 1) {
                    menus.add(code);
                } else if (prem.getType() == 2) {
                    points.add(code);
                } else {
                    apis.add(code);
                }
            }
        }

        this.roles.put("menus", menus);
        this.roles.put("points", points);
        this.roles.put("apis", apis);
    }
}
