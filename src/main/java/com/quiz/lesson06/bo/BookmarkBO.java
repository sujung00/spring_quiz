package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.BookmarkMapper;
import com.quiz.lesson06.model.Bookmark;

@Service
public class BookmarkBO {
	
	@Autowired
	private BookmarkMapper bookmarkMapper;

	public int addBookmark(String name, String url) {
		return bookmarkMapper.insertBookmark(name, url);
	}
	
	public List<Bookmark> getBookmarkList(){
		return bookmarkMapper.selectBookmarkList();
	}
	
	public Bookmark getBookmarkByUrl(String url) {
		return bookmarkMapper.selectBookmarkByUrl(url);
	}
	
	public int deleteBookmarkById(int id) {
		return bookmarkMapper.deleteBookmarkById(id);
	}
}
