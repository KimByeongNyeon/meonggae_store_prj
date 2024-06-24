package com.store.meonggae.user.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.meonggae.product.service.ProductDetailInfoService;
import com.store.meonggae.product.vo.SteamVO;


@Controller
public class ProductDetailInfoController {
	
	@Autowired
	private ProductDetailInfoService pdiService;

		//찜 등록
		@ResponseBody
		@RequestMapping(value="/insertSteam.do", method=RequestMethod.GET, produces = "text/plain;charset=UTF-8")
		public String insertSteam(@RequestParam("goodsNum") String goodsNum, @RequestParam("memNum") int memNum) {
			int result = pdiService.insertSteam(new SteamVO(goodsNum, memNum));
			return String.valueOf(result);
		}//insertSteam
		
		//찜 삭제
		@ResponseBody
		@RequestMapping(value="/updateSteam.do", method=RequestMethod.GET, produces = "text/plain;charset=UTF-8")
		public String updateSteamToN(@RequestParam("goodsNum") String goodsNum, @RequestParam("memNum") int memNum) {
			int result = pdiService.updateSteamToN(new SteamVO(goodsNum, memNum));
			return String.valueOf(result);
		}//parentCategory
		
	
}//class
