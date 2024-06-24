package com.store.meonggae.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.meonggae.product.dao.ProductAddDAO;
import com.store.meonggae.product.domain.ProductDomain;
import com.store.meonggae.product.vo.ProductAddVO;
import com.store.meonggae.user.login.domain.LoginDomain;

@Service
public class ProductAddService {

	@Autowired
	private ProductAddDAO praDAO;

	public List<ProductDomain> selectProductByUser(int memNum) {
		return praDAO.selectProductByUser(memNum);
	}
	

	/*
	 * public int inserctProduct(ProductAddVO pdaVO) { return
	 * praDAO.inserctProduct(pdaVO); }
	 * 
	 * public int updateProudct(ProductAddVO pdaVO) { return
	 * praDAO.inserctProduct(pdaVO); }
	 */
}
