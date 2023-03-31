package com.quiz.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson05.dao.ReviewMapper;
import com.quiz.lesson05.model.Review;

@Service
public class ReviewBO {

	@Autowired
	private ReviewMapper reviewMapper;
	
	public List<Review> getReviewByStoreId(int storeId) {
		return reviewMapper.selectReviewByStoreId(storeId);
	}
}
