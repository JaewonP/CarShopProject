package com.shop.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.service.CarShopService;

import lombok.Setter;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/carshop/*")

public class HomeController {

	@Setter(onMethod_ = @Autowired)
	private CarShopService service;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

//	@RequestMapping({ "/", "index" })
//	public String index(Model model) {
//		model.addAttribute("list", service.index());
//
//		return "carshop/index";
//
//	}

	@RequestMapping("/register")
	public String register() {
		return "carshop/register";

	}

	@RequestMapping("/product")
	public String product() {
		return "carshop/product";
	}

	@RequestMapping("/checkout")
	public String checkout() {
		return "carshop/checkout";
	}
	
	@RequestMapping("/like")
	public String like() {
		return"carshop/like";
	}	
	
	@RequestMapping("/cart")
	public String cart() {
		return"carshop/cart";
	}	
	
	@RequestMapping("/home")
	public String a() {
		return "home";
	}
	
	@GetMapping("/login")
	public String login() {
		return "carshop/login";
	}
	

	@PostMapping("/login") //시큐리티고 뭐고 안된다면 이걸로 쓴다
	public String login_success(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		System.out.println("post2로 들어옴");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		
		System.out.println("id : " + id + " pw : " + pw);

		//service.getAllUser();                            //db연결하면 사용
		
		if(id.equals("admin") && pw.equals("admin")) {     //db없이 test해보기 위함
			session.setAttribute("id" , id);
			session.setAttribute("pw", pw);

			return "/carshop/index";  						 //redirect가 안됨! 해야하나?
			
		} else {
			System.out.println("로그인실패");
			return "/carshop/loginerror";
		}    
	}
	
	@GetMapping("/all")
	public void all() {
		System.out.println("누구나 접근가능");
	}
	
	@GetMapping("/member")
	public void member() {
		System.out.println("회원만 접근가능 ");
	}
	
	@GetMapping("/admin")
	public void admin() {
		System.out.println("관리자만 접근가능 ");
	}
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "carshop/mypage";
	}
	
	@RequestMapping("/mycar")
	public String mycar(Model model) {
		return "carshop/mycar";
	}
	@RequestMapping("/product/details")
	public String detail() {
		return "carshop/productdetails";
	}
	
}
