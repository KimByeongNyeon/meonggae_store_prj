package com.store.meonggae.product.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.dao.MybatisDAO;
import com.store.meonggae.product.domain.ProductDomain;

@Component
public class ProductAddDAO {

    @Autowired
    private MybatisDAO mbDAO;

    public List<ProductDomain> selectProductByUser(int memNum) throws PersistenceException {
        try (SqlSession ss = mbDAO.getMyBatisHandler(false)) {
            return ss.selectList("com.store.meonggae.product.selectProductByUser", memNum);
        }
    }

    public int insertProduct(ProductDomain product) {
        try (SqlSession ss = mbDAO.getMyBatisHandler(true)) {
            return ss.insert("com.store.meonggae.product.insertProduct", product);
        }
    }

    public int insertProductImg(ProductDomain product) {
        try (SqlSession ss = mbDAO.getMyBatisHandler(true)) {
            return ss.insert("com.store.meonggae.product.insertProductImg", product);
        }
    }

    public int updateProduct(ProductDomain product) {
        try (SqlSession ss = mbDAO.getMyBatisHandler(true)) {
            return ss.update("com.store.meonggae.product.updateProduct", product);
        }
    }
}
