package com.shop.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.controller.HomeController;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class MyPageController {
	//������ ����������
	
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "carshop/mypage";
		
	}

}
