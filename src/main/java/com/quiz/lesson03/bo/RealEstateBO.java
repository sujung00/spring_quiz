package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateMapper;
import com.quiz.lesson03.model.RealEstate;

@Service
public class RealEstateBO {

	@Autowired
	private RealEstateMapper realEstateMapper;
	
	public RealEstate getRealEstateById(int id) {
		return realEstateMapper.selectRealEstateById(id);
	}
	
	public List<RealEstate> getRealEstateByRentPrice(int rent_price){
		return realEstateMapper.selectRealEstateByRentPrice(rent_price);
	}
	
	public List<RealEstate> getRealEstateByAreaAndPrice(int area, int price){
		return realEstateMapper.getRealEstateByAreaAndPrice(area, price);
	}
}
