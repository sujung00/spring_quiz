package com.quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson05.bo.WeatherHistoryBO;
import com.quiz.lesson05.model.WeatherHistory;

@RequestMapping("/weather")
@Controller
public class WeatherHistoryController {
	
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;

	// http://localhost:8080/weather/weather_history
	@GetMapping("/weather_history")
	public String weatherHistory(Model model) {
		List<WeatherHistory> history = weatherHistoryBO.getWeatherHistory();
		
		model.addAttribute("history", history);
		
		return "weather/weatherHistory";
	}
	
	// http://localhost:8080/weather/weather_insert_view
	@GetMapping("/weather_insert_view")
	public String weatherInsertView() {
		return "weather/weatherInsert";
	}
	
	// http://localhost:8080/weather/weather_insert
	@PostMapping("/weather_insert")
	public String weatherInsert(
			@RequestParam("date")String date,
			@RequestParam("weather")String weather,
			@RequestParam("microDust")String microDust,
			@RequestParam("temperatures")double temperatures,
			@RequestParam("precipitation")double precipitation,
			@RequestParam("windSpeed")double windSpeed) {
		weatherHistoryBO.addWeatherHistory(date, weather, microDust, temperatures, precipitation, windSpeed);
		
		/*
		 * List<WeatherHistory> history = weatherHistoryBO.getWeatherHistory();
		 * 
		 * model.addAttribute("history", history);
		 */
		
		return "redirect:/weather/weather_history";
	}
}
