package com.quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.Store;
import com.quiz.lesson05.bo.ReviewBO;
import com.quiz.lesson05.model.Review;

@RequestMapping("/store")
@Controller
public class StoreController {

	@Autowired
	private StoreBO storeBO;
	@Autowired
	private ReviewBO reviewBO;
	
	// http://localhost:8080/store/store_list_view
	@GetMapping("/store_list_view")
	public String storeListView(Model model) {
		List<Store> storeList = storeBO.getStoreList();
		model.addAttribute("storeList", storeList);
		
		return "store/storeListView";
	}
	
	// http://localhost:8080/store/store_review_view?storeId=7&storeName=배달삼겹
	@GetMapping("/store_review_view")
	public String storeReviewView(
			@RequestParam("storeId") int storeId,
			@RequestParam("storeName") String storeName,
			Model model) {
		List<Review> reviews = reviewBO.getReviewByStoreId(storeId);
		
		model.addAttribute("reviews", reviews);
		model.addAttribute("storeName", storeName);
		
		return "store/reviewView";
	}
}
