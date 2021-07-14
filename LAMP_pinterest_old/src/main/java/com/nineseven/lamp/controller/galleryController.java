package com.nineseven.lamp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nineseven.lamp.service.galleryService;
import com.nineseven.lamp.vo.galleryVO;

@Controller
public class galleryController {
	
	private static final Logger logger = LoggerFactory.getLogger(galleryController.class);
	
	@Autowired
	private galleryService service;
	
	@RequestMapping(value="/galleryWrite", method = RequestMethod.GET)
	public String galleryWrite(galleryVO gallery, Model model) {
		logger.info("gallery : {}", gallery);
		service.galleryInsert(gallery);
		logger.info("gallery : {}", gallery);
		logger.info("도착");
		
		ArrayList<galleryVO> result = service.gallerySelectAll();
		model.addAttribute("galleryList", result);
		logger.info("안되겠지ㅠㅠ");
		
		return "home";
	}
	
	@ResponseBody
	@RequestMapping(value="/galleryDB", method = RequestMethod.POST)
	public List<Map<String, Object>> galleryDB(@RequestBody String str) {
		
		logger.info(str);
		logger.info("DB 불러오는 컨트롤러 도착");
		
		ArrayList<galleryVO> result = service.gallerySelectAll();
		
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();	
		//list.put("도착", "성공");
		
		for (int i = 0; i < result.size(); i++) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("id", result.get(i).getId());
			map.put("pin_no", result.get(i).getPin_no());
			map.put("pin_title", result.get(i).getPin_title());
			map.put("pin_description", result.get(i).getPin_description());
			map.put("upload_img", result.get(i).getUpload_img());
			map.put("pin_size", result.get(i).getPin_size());
			
			list.add(map);
		}

		
		return list;
	}
	
	/*
	 * @RequestMapping(value="/toGallery", method=RequestMethod.GET) public String
	 * toGallary(Model model) { ArrayList<galleryVO> result =
	 * service.gallerySelectAll(); model.addAttribute("galleryList", result);
	 * logger.info("안되겠지ㅠㅠ"); return "home"; }
	 */
}
