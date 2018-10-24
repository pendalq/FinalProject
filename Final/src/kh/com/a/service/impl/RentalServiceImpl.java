package kh.com.a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.RentalDao;
import kh.com.a.service.RentalService;

@Service
public class RentalServiceImpl implements RentalService {
	
	@Autowired
	RentalDao rentalDao;
	
}
