package com.store.meonggae.user.contoller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.store.meonggae.product.domain.ProductDomain;
import com.store.meonggae.product.service.ProductAddService;
import com.store.meonggae.user.login.domain.LoginDomain;

@Controller
public class ProductController {

    @Autowired
    private ProductAddService productAddService;

    @GetMapping("/product_page/product_add.do")
    public String productAdd(Model model, HttpSession session, RedirectAttributes redirectAttributes) {
    	LoginDomain loginUser = (LoginDomain) session.getAttribute("user");
        // 사용자 정보를 세션에서 가져옴

        if (loginUser != null) {
            int memNum = loginUser.getMemNum();
            List<ProductDomain> productList = productAddService.selectProductByUser(memNum);
            System.out.println(productList);
            model.addAttribute("productList", productList);
            model.addAttribute("user", loginUser);
            model.addAttribute("memNum", loginUser.getMemNum());
            return "product_page/product_add";
        } else {
            redirectAttributes.addFlashAttribute("message", "로그인이 필요한 서비스 입니다.");
            return "redirect:/index.do";
        }
    }

    @PostMapping("/product_page/product_add.do")
    public String handleProductAdd(Model model, ProductDomain product, @RequestParam("img") MultipartFile img, HttpSession session) throws IOException {
        // 사용자 정보를 세션에서 가져옴
        LoginDomain loginUser = (LoginDomain) session.getAttribute("user");

        // 상품을 등록한 사용자의 ID 설정
        product.setMemNum(loginUser.getMemNum());
        
        // 서비스를 통해 상품 등록 처리 (이미지 파일 포함)
        productAddService.insertProduct(product, img);

        // 등록된 상품 정보를 모델에 추가 (선택사항)
        model.addAttribute("uploader", loginUser.getNick());
        model.addAttribute("fileName", img.getOriginalFilename());
        model.addAttribute("uploadFlag", true);

        // 등록 성공 메시지 등 다른 로직 처리 후 필요한 페이지로 이동
        return "redirect:/product_page/product_list.do";
    }
}