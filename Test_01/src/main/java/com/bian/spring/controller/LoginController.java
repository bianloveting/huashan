package com.bian.spring.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.bian.spring.entites.User;
import com.bian.spring.service.UserService;
import com.bian.spring.util.JsonMsg;


@SessionAttributes(value={"_user"})
@RequestMapping("/user")
@Controller
public class LoginController {

	@Autowired
	private UserService userService;
	
	/**
	 * 检查用户名是否存在
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/checkUserNameHasExists/{userName}",method=RequestMethod.PUT)
	public JsonMsg checkUserNameHasExists(@PathVariable("userName") String userName){
		System.out.println(userName);
		if(userService.checkUserNameHasExists(userName) != null){
			return JsonMsg.success();
		}
		return JsonMsg.fail();
	}
	
	/**
	 * 注销登录
	 * @param sessionStatus
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/invaliadate")
	public JsonMsg invaliadate(SessionStatus sessionStatus){
		sessionStatus.setComplete();
		return JsonMsg.success();
	}
	
	
	
	/**
	 * 注册信息
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/registerUser",method=RequestMethod.POST)
	public JsonMsg registerUser(User user){
		System.out.println("user"+user);
		int count = userService.RegisterUser(user);
		if(count > 0){
			return JsonMsg.success();
		}
		return JsonMsg.fail();
	}
	
	
	/**
	 * 登录
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/login")
	public JsonMsg loginUser(User user,Map<String, Object> map){
		System.out.println(user);
		map.put("_user", user);
		if(userService.LoginUser(user)!=null){
			return JsonMsg.success();
		}
		return JsonMsg.fail();
	}
	
	/**
	 * 记住个人Cookie
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/rememberMe")
	public JsonMsg rememberCookie(HttpServletRequest request,HttpServletResponse response){
		String username = request.getParameter("userName");
		String password = request.getParameter("pass");
		System.out.println(username+"\t"+password);
		Cookie userName = new Cookie("userName", username);
		Cookie pass = new Cookie("pass",password);
		userName.setMaxAge(60*60*24);
		pass.setMaxAge(60*60*24);
		response.addCookie(userName);
		response.addCookie(pass);
		return JsonMsg.success().addInfo("username", username).addInfo("pass", password);
	}
	
	
	@ResponseBody
	@RequestMapping("/getCookieUserName")
	public JsonMsg getCookieUserName(HttpServletRequest request,HttpServletResponse response){
		Cookie[] cookies = request.getCookies();
		String userName = "";
		String pass = "";
		User _user = (User) request.getSession().getAttribute("_user");
		for(Cookie c : cookies){
			if(c.getName().equals(_user.getUserName())){
				userName = c.getValue();
			}
			if(c.getName().equals(_user.getPass())){
				pass = c.getValue();
			}
		}
		
		if(!pass.equals("") && !userName.equals("")){
			return JsonMsg.success().addInfo("userName", userName).addInfo("pass",pass);
		}
		return JsonMsg.fail();
	}
	
	@RequestMapping("/loginIndex")
	public String index(){
		return "/login";
	}
	
}
