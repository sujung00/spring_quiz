package com.quiz.lesson06.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.BookingMapper;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {
	
	@Autowired
	private BookingMapper bookingMapper;

	public List<Booking> getBookingList(){
		return bookingMapper.selectBookingList();
	}
	
	public int deleteBookingById(int id) {
		return bookingMapper.deleteBookingById(id);
	}
	
	public int addBooking(String name, String date,
			int day, int headcount, String phoneNumber) {
		return bookingMapper.insertBooking(name, date, day, headcount, phoneNumber);
	}
	
	public Booking getBookingByNamePhoneNumber(String name, String phoneNumber) {
		return bookingMapper.selectBookingByNamePhoneNumber(name, phoneNumber);
	}
}
