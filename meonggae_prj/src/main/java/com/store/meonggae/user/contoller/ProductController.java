package com.store.meonggae.user.contoller;

import java.io.IOException;
import java.util.List;

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
        // 사용자 정보를 세션에서 가져옴
        LoginDomain loginUser = (LoginDomain) session.getAttribute("user");

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
    public String handleProductAdd(@RequestParam("product-name") String productName,
                                   @RequestParam("product-price") int productPrice,
                                   @RequestParam("description") String productDescription,
                                   @RequestParam("category") String category,
                                   @RequestParam("condition") String condition,
                                   @RequestParam("trade-addr") String tradeAddr,
                                   @RequestParam("image") MultipartFile image,
                                   HttpSession session,
                                   RedirectAttributes redirectAttributes) {
        // 사용자 정보를 세션에서 가져옴
        LoginDomain loginUser = (LoginDomain) session.getAttribute("user");

        if (loginUser != null) {
            // 상품 등록 로직 수행
            ProductDomain product = new ProductDomain();
            product.setMemNum(loginUser.getMemNum());
            product.setName(productName);
            product.setPrice(productPrice);
            product.setDetail(productDescription);
            product.setCategory_num(category);
            product.setQuality_code(condition);
            product.setLocation(tradeAddr);

            try {
                productAddService.insertProduct(product, image);
            } catch (IOException e) {
                e.printStackTrace();
                redirectAttributes.addFlashAttribute("message", "상품 등록 중 오류가 발생했습니다.");
                return "redirect:/product_page/product_add.do";
            }

            return "redirect:/product_page/product_list.do";
        } else {
            redirectAttributes.addFlashAttribute("message", "로그인이 필요합니다.");
            return "redirect:/index.do";
        }
    }
}
