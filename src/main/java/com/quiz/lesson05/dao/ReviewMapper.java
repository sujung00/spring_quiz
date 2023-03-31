package com.quiz.lesson05.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson05.model.Review;

@Repository
public interface ReviewMapper {

	public List<Review> selectReviewByStoreId(int storeId);
}
