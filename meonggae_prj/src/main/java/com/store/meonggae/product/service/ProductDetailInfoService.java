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
    
    //찜 등록
    public int insertSteam(SteamVO steamVO) {
    	int insertSteam = 0;
    	//있다가 삭제되었던 값이 있는지 확인. 있으면 다시찜. 없으면 첫찜.
    	int checkResult = pdiDAO.checkFirstSteam(steamVO);
    	//첫 찜
    	if(checkResult == 0) {
    		insertSteam = pdiDAO.insertSteam(steamVO);
    	}else if(checkResult == 1){
    	//삭제했다가 다시 찜.
    		insertSteam = pdiDAO.updateSteamToY(steamVO);
    	}
    	return insertSteam;
    }
    
    //찜 삭제
    public int updateSteamToN(SteamVO steamVO) {
    	return pdiDAO.updateSteamToN(steamVO);
    }
    
}
