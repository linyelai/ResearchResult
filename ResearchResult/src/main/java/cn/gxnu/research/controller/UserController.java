package cn.gxnu.research.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.gxnu.research.mapper.UserInfoMapper;
import cn.gxnu.research.model.UserInfo;

@Controller

public class UserController {

	@Autowired
	private UserInfoMapper userInfoMapper;
	private List<UserInfo> users;
	 
	@RequestMapping(value="/login")
	public String login(String username,String password,HttpSession httpSession)
	{
		
		if(username!=null&&password!=null)
		{
			UserInfo user = new UserInfo();
			user.setUsername(username);
			List<UserInfo> userList = userInfoMapper.findUser(user);
			String passHex = DigestUtils.md5Hex(password);
			if(userList!=null&&userList.size()>0)
			{
				UserInfo loginUser = userList.get(0);
				if(passHex.equals(loginUser.getPassword()))
				{
					//����¼���û���ӵ�session��
					httpSession.setAttribute("loginUser", username);
					
				}
				else
				{
					return "login";
				}
			}
		}
		else
		{
			return "login";
		}
		
		return "index";
	}
	
	@RequestMapping(value="index")
	public String index()
	{
		return "index";
	}
	
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession httpSession)
	{
		//如果已经有用户登录，n那么需要将用户信息清理
		String loginUser = (String) httpSession.getAttribute("loginUser");
		if(loginUser!=null)
		{
			httpSession.removeAttribute("loginUser");
		}
		return "login";
	}
	
	//�������������û���Ϣ
	@RequestMapping(value="findUsers")
	@ResponseBody
	public  Map<String, Object> findUsers(String username,int rows,Integer page)
	{
		users = new ArrayList<UserInfo>();
		Map<String,Object> result = new HashMap<String,Object>();
		Integer total =0;
		
			Map param = new HashMap();
			param.put("username", username);
			param.put("begin", (page-1)*rows);
			param.put("end", page*rows);
			users.addAll(userInfoMapper.findUserByPage(param));
			if(users.size()>0)
			{
				List<UserInfo> totalUsers = userInfoMapper.findUserByName(param);
				if(totalUsers!=null)
				{
					total = totalUsers.size();
				}
			}
		result.put("rows", users);
		result.put("total", total);
		return result;
	}

	@RequestMapping(value="addUser")
	@ResponseBody
	public Map addUser(String newName,String password,Integer type)
	{
		Map result = new HashMap();
		if(newName!=null&&password!=null&&type!=null)
		{
			UserInfo newUser = new UserInfo();
			newUser.setUsername(newName);
			
			//���Ȳ����Ƿ��и��û������ڣ���������򷵻ض�Ӧ�Ĵ�����
			List<UserInfo> userList = userInfoMapper.findUser(newUser);
			if(userList!=null&&userList.size()>0)
			{
				result.put("msg", "该用户名已经存在，不能重复添加");
			}
			else
			{
				newUser.setPassword( DigestUtils.md5Hex(password));
				newUser.setType(type);
				userInfoMapper.saveUser(newUser);
				result.put("msg", "添加成功");
			}
		}
		else
		{
			result.put("msg", "添加失败");
		}
		
		return result;
	}
	
	//ɾ���û�
	@RequestMapping(value="removeUser")
	@ResponseBody
	public Map removeUser(Integer id)
	{
		Map result = new HashMap();
		//
		int count = userInfoMapper.removeUser(id);
		if(count>0)
		{
			result.put("msg", "删除成功");
		}
		else
		{
			result.put("msg", "删除失败");
		}
		
		return result;
	}
	//����ɾ���û�
	@RequestMapping(value="removeUsers")
	@ResponseBody
	public Map removeUsers(String  usernames)
	{
		Map result = new HashMap();
		//
		String [] usernameArray = usernames.split(",");
		List<String> usernameList = new ArrayList<String>();
		
		if(usernameArray!=null&&usernameArray.length>0)
		{
			for(String username:usernameArray)
			{
				usernameList.add(username);
			}
		}
		if(usernameList.contains("admin"))
		{
			result.put("msg", "不能删除admin用户");
		}
		else
		{
			int count = userInfoMapper.removeUsers(usernameList);
			if(count>0)
			{
				result.put("msg", "删除成功");
			}
			else
			{
				result.put("msg", "删除失败");
			}
		}
		return result;
	}
	
	@RequestMapping(value="updateUser")
	@ResponseBody
	public Map updateUser(Integer id,String newName,String pass,Integer type,Integer enable)
	{
		Map result = new HashMap();
		//
		Integer userId = id;
		UserInfo queryUser = userInfoMapper.findUserById(userId);
		if(queryUser!=null)
		{
			if(pass!=null)
			{
				queryUser.setPassword(DigestUtils.md5Hex(pass));
			}
			if(type!=null)
			{
				queryUser.setType(type);
			}
			if(enable!=null)
			{
				queryUser.setEnable(enable);
			}
			int count = userInfoMapper.updateUser(queryUser);
			if(count>0)
			{
				result.put("msg", "修改成功");
			}
			else
			{
				result.put("msg", "修改失败");
			}
		}
		else
		{
			result.put("msg", "不存在该用户");
		}
		
		
		return result;
	}
	
	public List<UserInfo> getUsers() 
	{
		return users;
	}
	
}
