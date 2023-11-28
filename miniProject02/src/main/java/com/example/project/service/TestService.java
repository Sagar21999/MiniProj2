package com.example.project.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.project.entity.Test;

@Service
public interface TestService {

	public Test addTest(Test test);
	
	public int findTestByAdhaarAndDate(Long adhaar,Date date);
	
	public Integer[] generateCompleteReport(Date date);
	
	public List<Test> getAll();
	
	public List<Test> getDailyByCategory(String category,Date date);
	
	public Integer[] getDailyCount(Date date);
	
	public List<Test> getByStatus(String status);
	
	public Optional<Test> findById(Integer id);
	
	public Test update(Test test);
}
