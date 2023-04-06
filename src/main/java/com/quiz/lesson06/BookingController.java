package com.quiz.lesson06;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@RequestMapping("/booking")
@Controller
public class BookingController {

	@Autowired
	private BookingBO bookingBO;
	
	// 예약 목록 화면
	// http://localhost:8080/booking/reserv_list_view
	@GetMapping("/reserv_list_view")
	public String reservListView(Model model) {
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		
		return "booking/reservListView";
	}
	
	// 예약 하기 화면
	// http://localhost:8080/booking/reserv_view
	@GetMapping("/reserv_view")
	public String reservView() {
		return "booking/reservView";
	}
	
	@ResponseBody
	@PostMapping("/delete_booking")
	public Map<String, Object> deleteBooking(
			@RequestParam("id") int id){
		Map<String, Object> result = new HashMap<>();
		int rowCount = bookingBO.deleteBookingById(id);
		if(rowCount > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMesage", "삭제에 실패하였습니다.");
		}
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/add_reserv")
	public Map<String, Object> addReserv(
			@RequestParam("name") String name,
			@RequestParam("date") String date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber){
		Map<String, Object> result = new HashMap<>();
		
		int rowCount = bookingBO.addBooking(name, date, day, headcount, phoneNumber);
		
		if(rowCount > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "예약에 실패했습니다.");
		}
		
		return result;
	}
	
	//예약 확인 화면
	// http://localhost:8080/booking/reserv_check_view
	@GetMapping("/reserv_check_view")
	public String reservCheckView() {
		return "booking/reservCheckView";
	}
	
	@ResponseBody
	@PostMapping("/reserv_check")
	public Map<String, Object> reservCheck(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber){
		Map<String, Object> result = new HashMap<>();
		
		Booking booking = bookingBO.getBookingByNamePhoneNumber(name, phoneNumber);
		
		if(booking != null) {
			result.put("code", 1);
			result.put("result", "성공");
			result.put("booking", booking);
		} else {
			result.put("code", 300);
			result.put("message", "예약 내역이 없습니다.");
		}
		
		return result;
	}
}
