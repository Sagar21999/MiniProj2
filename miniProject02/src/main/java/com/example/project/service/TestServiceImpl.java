package com.example.project.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.entity.Test;
import com.example.project.repository.TestRepository;

@Service
public class TestServiceImpl implements TestService {


	@Autowired
	TestRepository testRepository;
	
	@Override
	public Test addTest(Test test) {
		Test test2=testRepository.save(test);
		
		return test2;
	}

	@Override
	public int findTestByAdhaarAndDate(Long adhaar, Date date) {
		Test test2=testRepository.findByAdhaarAndDateOfTest(adhaar,date);
		if(test2!=null) {
			return -1;
		}
		return 0;
	}

	@Override
	public Integer[] generateCompleteReport(Date date) {
		List<Test> testingList=testRepository.findAll();
		Integer []result=new Integer[12];
		for(Integer i=0;i<result.length;i++) {
			result[i]=0;
		}
		
		
		for(Test t: testingList) {
			System.out.println(t.getDateOfTest());
			if((t.getDateOfTest().getMonth()==date.getMonth())&&(t.getDateOfTest().getYear()==date.getYear())&&(t.getDateOfTest().getDate()==date.getDate())) {
				result[0]++;
				
				if(t.getStatus().equalsIgnoreCase("positive")) {
					result[3]++;
				}
				else if(t.getStatus().equalsIgnoreCase("negative")) {
					result[6]++;
				}else {
					result[9]++;
				}
				
			}
			if((t.getDateOfTest().getMonth()==date.getMonth())&&(t.getDateOfTest().getYear()==date.getYear())) {
				result[1]++;
				
				if(t.getStatus().equalsIgnoreCase("positive")) {
					result[4]++;
				}
				else if(t.getStatus().equalsIgnoreCase("negative")) {
					result[7]++;
				}else {
					result[10]++;
				}
			}
			
			result[2]++;
			if(t.getStatus().equalsIgnoreCase("positive")) {
				result[5]++;
			}
			else if(t.getStatus().equalsIgnoreCase("negative")) {
				result[8]++;
			}else {
				result[11]++;
			}
			
		}
		
		
		return result;
	}

	@Override
	public List<Test> getAll() {
		List<Test> testList=testRepository.findAll();
		return testList;
	}

	@Override
	public List<Test> getDailyByCategory(String category, Date date) {
		List<Test> testList=testRepository.findByDateOfTest(date);
		List<Test> testList2=new ArrayList<>();
		if(category.equalsIgnoreCase("All")) {
			return testList;
		}else if(category.equalsIgnoreCase("Positive")) {
			for(Test t:testList) {
				if(t.getStatus().equalsIgnoreCase("positive")) {
					testList2.add(t);
				}
			}
		}else if(category.equalsIgnoreCase("Negative")) {
			
			for(Test t:testList) {
				if(t.getStatus().equalsIgnoreCase("negative")) {
					testList2.add(t);
				}
			}
		}else if(category.equalsIgnoreCase("Testing")) {
			
			for(Test t:testList) {
				if(t.getStatus().equalsIgnoreCase("testing")) {
					testList2.add(t);
				}
		}
		}
		
		return testList2;
	}

	@Override
	public Integer[] getDailyCount(Date date) {
		List<Test> testList=testRepository.findByDateOfTest(date);
		Integer[] count=new Integer[4];
		for(Integer i=0;i<count.length;i++) {
			count[i]=0;
		}
		
		for(Test t:testList) {
			count[0]++;
			if(t.getStatus().equalsIgnoreCase("positive")) {
				count[1]++;
			}
			else if(t.getStatus().equalsIgnoreCase("negative")) {
				count[2]++;
			}
			else {
				count[3]++;
			}
		}
				return count;
	}

	@Override
	public List<Test> getByStatus(String status) {
		List<Test> testList=testRepository.findByStatus(status);
		
		return testList;
	}

	@Override
	public Optional<Test> findById(Integer id) {
		Optional<Test> t=testRepository.findById(id);
		
		return t;
	}

	@Override
	public Test update(Test test) {
		Test save = testRepository.save(test);
		
		return save;
	}

}




















