package com.quiz.lesson06;

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
	
	// http://localhost:8080/booking/reserv_list_view
	@GetMapping("/reserv_list_view")
	public String reservListView(Model model) {
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		
		return "booking/reservListView";
	}
	
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
	
}
