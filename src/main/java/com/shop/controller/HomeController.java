package com.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.CarShopService;
import com.shop.vo.Prod_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class HomeController {

	@Setter(onMethod_ = @Autowired)
	private CarShopService service;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping({ "/", "index" })
	public String index(Model model) {
		model.addAttribute("list", service.index());

		return "carshop/index";

	}

	@RequestMapping("/register")
	public String register() {
		return "carshop/register";

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
	
	
	@RequestMapping("/fake")
	public String fake() {
		return "carshop/fake";
	}

	@RequestMapping("/home")
	public String a() {
		return "home";
	}

	@RequestMapping("/mypage")
	public String mypage() {
		return "carshop/mypage";
		
	}

	@GetMapping("/productForm")
	public String productForm(Model model) {
		System.out.println("productForm 들어옴");
		model.addAttribute("cateParent",service.cateParent());
		model.addAttribute("category", service.category());
		return "carshop/productForm";
	}

	// action 
	@PostMapping("/productForm")
	public String register(Prod_Tbl product) {
		log.info("컨틀롤러에서 등록 " + product);
		service.productForm(product);
		return "redirect:/carshop/index";
	}

	@RequestMapping("/product/details")
	public String detail() {
		return "carshop/productdetails";
	}
	

	@RequestMapping("/confirmation")
	public String confirmation() {
		return "carshop/confirmation";
	}

}
