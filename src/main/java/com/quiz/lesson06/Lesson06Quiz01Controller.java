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

import com.quiz.lesson06.bo.BookmarkBO;
import com.quiz.lesson06.model.Bookmark;

@RequestMapping("/lesson06/quiz01")
@Controller
public class Lesson06Quiz01Controller {

	@Autowired
	private BookmarkBO bookmarkBO;
	
	// http://localhost:8080/lesson06/quiz01/add_bookmark_view
	@GetMapping("/add_bookmark_view")
	public String addBookmarkView() {
		return "lesson06/addBookmark";
	}
	
	@PostMapping("/add_bookmark")
	@ResponseBody // AJAX를 통한 요청이기 때문
	public Map<String, Object> addBookmark(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		// {"code":1, "result":"성공"}
		// {"code":500, "errorMessage":"추가하는데 실패했습니다."}
		
		int rowCount = bookmarkBO.addBookmark(name, url);
		
		Map<String, Object> result = new HashMap<>();
		if(rowCount > 0) {
			result.put("code", 1);
			result.put("result", "성공");			
		} else {
			result.put("code", 500);
			result.put("errorMessage", "데이터를 추가하는데 실패했습니다.");
		}
		
		return result; // JSON String으로 응답이 내려감
	}

	// http://localhost:8080/lesson06/quiz01/result_view
	@GetMapping("/result_view")
	public String resultView(Model model) {
		List<Bookmark> bookmarkList = bookmarkBO.getBookmarkList();
		
		model.addAttribute("bookmarks", bookmarkList);
		
		return "lesson06/resultView";
	}
}
