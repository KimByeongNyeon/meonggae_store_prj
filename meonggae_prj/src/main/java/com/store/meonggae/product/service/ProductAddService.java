package com.store.meonggae.product.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.store.meonggae.product.dao.ProductAddDAO;
import com.store.meonggae.product.domain.ProductDomain;

@Service
public class ProductAddService {

    @Autowired
    private ProductAddDAO praDAO;

    public List<ProductDomain> selectProductByUser(int memNum) {
        return praDAO.selectProductByUser(memNum);
    }

    public int insertProduct(ProductDomain product, MultipartFile image) throws IOException {
        // 상품 정보를 DB에 저장
        int result = praDAO.insertProduct(product);

        // 이미지 파일 저장
        if (result > 0 && image != null && !image.isEmpty()) {
            String imagePath = saveImage(image);
            product.setImg(imagePath);
            praDAO.insertProductImg(product);
        }

        return result;
    }


    private String saveImage(MultipartFile image) throws IOException {
        // 고유한 파일 이름 생성
        String originalFilename = image.getOriginalFilename();
        String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
        String uniqueFilename = UUID.randomUUID().toString() + extension;

        // 파일 저장 경로 설정 (예: C:/uploads)
        String uploadDir = "C:/Users/user/git/meonggae_store_prj/meonggae_prj/src/main/webapp/products-img";
        File uploadFile = new File(uploadDir + uniqueFilename);

        // 디렉토리가 존재하지 않으면 생성
        if (!uploadFile.exists()) {
            uploadFile.mkdirs();
        }

        // 파일 저장
        image.transferTo(uploadFile);

        return uniqueFilename;
    }
}
