package com.shop.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class CheckOutController {

	//����� ����ȭ�� ������
	
	@RequestMapping("/checkout")
	public String checkout() {
		return "carshop/checkout";
	}
}
