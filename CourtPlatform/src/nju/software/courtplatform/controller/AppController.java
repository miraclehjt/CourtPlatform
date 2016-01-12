package nju.software.courtplatform.controller;

import nju.software.courtplatform.service.MenuService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AppController extends BaseController{
	
	@Autowired
	private MenuService ms; 
	
	@RequestMapping(value = "/app/business")
	public ModelAndView getPage(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("app/business");
		mv.addObject("menuContext", ms.getMenuContext("app/business"));
		return mv;
	}
	
	@RequestMapping(value="/app/{url}",method=RequestMethod.POST)
	public ModelAndView getSubPage(@PathVariable String url){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("app/business");
		mv.addObject("menuContext", ms.getMenuContext(url));
		return mv;
	}

}
