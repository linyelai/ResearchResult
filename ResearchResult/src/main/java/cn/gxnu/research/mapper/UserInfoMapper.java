package cn.gxnu.research.mapper;

import java.util.List;
import java.util.Map;

import cn.gxnu.research.model.UserInfo;

public interface UserInfoMapper 
{
   List<UserInfo> findUser(UserInfo user);
   List<UserInfo> findUserByPage(Map param);
   List<UserInfo> findUserByName(Map param);
   int saveUser(UserInfo user);
   int removeUser(Integer id);
   int removeUsers(List<String> usernames);
   int updateUser(UserInfo user);
   UserInfo findUserById(Integer id);
}
