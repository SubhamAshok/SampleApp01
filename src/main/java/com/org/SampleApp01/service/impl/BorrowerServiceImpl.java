package com.org.SampleApp01.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.SampleApp01.dao.BorrowerDao;
import com.org.SampleApp01.dto.BorrowerDto;
import com.org.SampleApp01.service.BorrowerService;

@Service
public class BorrowerServiceImpl implements BorrowerService{

	@Autowired
	BorrowerDao borrowerDao;
	
	@Override
	public int addBorrower(BorrowerDto borrower) {
		return borrowerDao.addBorrower(borrower);
	}
}
