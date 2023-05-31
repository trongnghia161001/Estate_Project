package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.request.CustomerSearchRequest;

import java.util.List;

public interface ICustomerService {
    List<CustomerDTO> findAll(CustomerSearchRequest customerSearchRequest);
    CustomerDTO findOne(Long customerID);
    void delete(Long[] customerId);
    CustomerDTO save(CustomerDTO customerDTO);
}
