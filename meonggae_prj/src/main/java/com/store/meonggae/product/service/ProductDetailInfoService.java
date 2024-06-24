package com.store.meonggae.product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.meonggae.product.dao.ProductDetailInfoDAO;
import com.store.meonggae.product.vo.SteamVO;

@Service
public class ProductDetailInfoService {

    @Autowired
    private ProductDetailInfoDAO pdiDAO;
    
//	상품의 전체 찜 횟수 조회
    public int countAllSteam(String goodsNum){
    	return pdiDAO.countAllSteam(goodsNum);
    }
//	회원의 찜 여부 조회 찜했으면 1 아니면 0	 
    public boolean checkMemSteam(SteamVO steamVO){
    	int checkResult = pdiDAO.checkMemSteam(steamVO);
        return checkResult == 1;//찜했으면 true 아니면 false
    }
}
