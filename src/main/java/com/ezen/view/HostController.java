package com.ezen.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.biz.service.HostService;

@Controller
@RequestMapping("host")
public class HostController {
	
	@Autowired
	private HostService hostService;
	
}
