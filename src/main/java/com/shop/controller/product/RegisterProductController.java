package com.shop.controller.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.controller.HomeController;
import com.shop.service.CarShopService;
import com.shop.vo.Prod_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class RegisterProductController {

	//�¿��� ��ǰ���
	
	@Setter(onMethod_ = @Autowired)
	private CarShopService service;

	
	@GetMapping("/productForm")
	public String productForm(Model model) {
		System.out.println("productForm ����");
		model.addAttribute("cateParent",service.cateParent());
		model.addAttribute("category", service.category());
		return "carshop/productForm";
	}

	//action ���� post ������� ���� �� �Է� �� 
	@PostMapping("/productForm")
	public String register(Prod_Tbl product) {
		log.info("��Ʋ�ѷ����� ��� " + product);
		service.productForm(product);
		return "redirect:/carshop/index";
	}

	
}
