package com.liang.zufang.config;

import com.liang.zufang.entity.sys.User;
import com.liang.zufang.service.SysUserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author liuliang
 * @description shiro配置
 * @date 2019/5/7
 **/
public class ShiroRealm extends AuthorizingRealm {

    @Resource
    private SysUserService userService;

    /**
     * 授权
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        User user  = (User)principalCollection.getPrimaryPrincipal();
        List<String> roles = userService.selectRolesByUserId(user.getId());
        List<String> permissions = userService.selectPermissionsByUserId(user.getId());
        authorizationInfo.addRoles(roles);
        authorizationInfo.addStringPermissions(permissions);
        //获取用户角色和授权码
        return authorizationInfo;
    }

    /**
     * 认证
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        if (authenticationToken.getPrincipal() == null) {
            return null;
        }
        //获取用户的输入的账号.
        String username = (String)authenticationToken.getPrincipal();
        //实际项目中，这里可以根据实际情况做缓存，如果不做，Shiro自己也是有时间间隔机制，2分钟内不会重复执行该方法
        User user = userService.selectUserByUserName(username);
        if(user == null){
            return null;
        }
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                user, //设置为当前用户，否则无法获取当前用户
                user.getPassword(), //密码
                getName()  //realm name
        );
        return authenticationInfo;
    }
}
