package com.quiz.lesson06;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookmarkBO;
import com.quiz.lesson06.model.Bookmark;

@RequestMapping("/lesson06/quiz02")
@Controller
public class Lesson06Quiz02Controller {

	@Autowired
	private BookmarkBO bookmarkBO;

	// 중복 url 체크 - AJAX 통신
	@ResponseBody
	@PostMapping("/is_duplication")
	public Map<String, Boolean> isDuplication(
			@RequestParam("url") String url) {
		Map<String, Boolean> result = new HashMap<>();

		Bookmark bookmark = bookmarkBO.getBookmarkByUrl(url);
		if(bookmark != null) {
			result.put("isDuplication", true);			
		} else {
			result.put("isDuplication", false);
		}
		
		return result;
	}

	// id로 url 삭제 - AJAX 통신
	// delete_url?id=13 	X -> post
	// http://localhost:8080/lesson06/quiz02/delete_url?id=30
	@ResponseBody
	@PostMapping("/delete_url")
	public Map<String, Object> deleteUrl(
			@RequestParam("id") int id) {
		Map<String, Object> result = new HashMap<>();
		
		int rowCount = bookmarkBO.deleteBookmarkById(id);
		if(rowCount > 0) {
			result.put("code", 1);
			result.put("reulst", "성공");			
		} else {
			result.put("code", 500);
			result.put("errorMessage", "삭제하는데 실패했습니다.");			
		}
		
		return result;
	}
	 
}
