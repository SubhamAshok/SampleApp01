package com.org.SampleApp01.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.org.SampleApp01.dto.BorrowerDto;
import com.org.SampleApp01.service.BorrowerService;

@RestController
@RequestMapping("/borrower")
public class BorrowerController {
 
	@Autowired
	BorrowerService borrowerService;
	
	@PostMapping(value = "/add", consumes = MediaType.APPLICATION_JSON_VALUE)
	public String addBorrower(@RequestBody BorrowerDto borrower) {
		return borrowerService.addBorrower(borrower) + " added";
	}
}
