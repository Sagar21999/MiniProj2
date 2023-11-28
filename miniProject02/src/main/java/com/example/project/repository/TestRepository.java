package com.example.project.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.project.entity.Test;


public interface TestRepository extends JpaRepository<Test, Integer> {

	Test findByAdhaarAndDateOfTest(Long adhaar,Date dateOfTest);
	
	List<Test> findByDateOfTest(Date dateOfTest);
	
	List<Test> findByStatus(String status);
}
