package com.org.SampleApp01.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Repository;

import com.org.SampleApp01.dao.BorrowerDao;
import com.org.SampleApp01.dto.BorrowerDto;
import com.org.SampleApp01.entity.BorrowerEntity;

@Repository
public class BorrowerDaoImpl implements BorrowerDao{
	
	@PersistenceContext
	EntityManager em;
	
	@Override
	@Transactional
	public int addBorrower(BorrowerDto borrowerDto) {
		BorrowerEntity borrowerEntity=new BorrowerEntity();
		BeanUtils.copyProperties(borrowerDto, borrowerEntity);
		em.persist(borrowerEntity);
		return borrowerEntity.getBorrowerId();
	}
}
