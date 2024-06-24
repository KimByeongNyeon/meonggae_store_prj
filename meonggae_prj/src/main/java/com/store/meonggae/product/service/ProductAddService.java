package com.store.meonggae.product.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.store.meonggae.product.dao.ProductAddDAO;
import com.store.meonggae.product.domain.ProductDomain;
import com.store.meonggae.product.vo.ProductAddVO;

@Service
public class ProductAddService {

    @Autowired
    private ProductAddDAO praDAO;

    private static String UPLOAD_DIR = "C:/Users/user/git/meonggae_store_prj/meonggae_prj/src/main/webapp/products-img"; // 파일을 저장할 경로를 지정하세요

    public List<ProductDomain> selectProductByUser(int memNum) {
        return praDAO.selectProductByUser(memNum);
    }

    public int inserctProduct(ProductDomain pdo) {
        return praDAO.insertProduct(pdo);
    }

    public void insertProduct(ProductDomain product, MultipartFile image) throws IOException {
        // 파일 업로드 처리
        if (!image.isEmpty()) {
            String originalFilename = image.getOriginalFilename();
            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
            String storedFilename = UUID.randomUUID().toString() + fileExtension;
            Path filePath = Paths.get(UPLOAD_DIR, storedFilename);

            // 디렉토리가 없으면 생성
            if (!Files.exists(filePath.getParent())) {
                Files.createDirectories(filePath.getParent());
            }

            // 파일 저장
            image.transferTo(filePath.toFile());

            // DB에 저장할 파일 경로 설정
            product.setImg(storedFilename);
        }

        // 상품 정보를 DB에 저장
        praDAO.insertProduct(product);

        // 상품 이미지 정보를 DB에 저장
        praDAO.insertProductImg(product);
    }
}
