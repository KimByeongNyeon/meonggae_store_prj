package com.store.meonggae.product.dao;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.dao.MybatisDAO;
import com.store.meonggae.product.vo.SteamVO;


@Component
public class ProductDetailInfoDAO {
	
	@Autowired
	private MybatisDAO mbDAO;
	
//	상품의 전체 찜 횟수 조회
	public int countAllSteam(String goodsNum)throws PersistenceException {
		try (SqlSession ss = mbDAO.getMyBatisHandler(false)) {
			return ss.selectOne("com.store.meonggae.product.ProductDetailInfoMapper.countAllSteam", goodsNum);
		}
	};//countAllSteam
	
//	회원의 찜 여부 조회 찜했으면 1 아니면 0
	public int checkMemSteam(SteamVO steamVO)throws PersistenceException {
		try (SqlSession ss = mbDAO.getMyBatisHandler(false)) {
			return ss.selectOne("com.store.meonggae.product.ProductDetailInfoMapper.checkMemSteam", steamVO);
		}
	};//checkMemSteam
	
}