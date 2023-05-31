package com.laptrinhjavaweb.service.impl;


import com.laptrinhjavaweb.builder.CustomerSearchBuilder;
import com.laptrinhjavaweb.converter.CustomerConverter;
import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.request.CustomerSearchRequest;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.repository.CustomerRepository;
import com.laptrinhjavaweb.repository.custom.impl.CustomerRepositoryImpl;
import com.laptrinhjavaweb.security.utils.SecurityUtils;
import com.laptrinhjavaweb.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class CustomerService implements ICustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private CustomerConverter customerConverter;

    @Autowired
    private CustomerRepositoryImpl customerRepositoryImp;

    @Override
    public List<CustomerDTO> findAll(CustomerSearchRequest customerSearchRequest) {
        List<CustomerDTO> customerDTOS = new ArrayList<>();
        CustomerSearchBuilder builder = customerConverter.convertToBuilder(customerSearchRequest);
        String role = String.valueOf(SecurityUtils.getPrincipal().getAuthorities());
        String name_role = role.substring(6, role.length() - 1);
        Long staffId = null;
        if (name_role.equals("staff")) {
            staffId = SecurityUtils.getPrincipal().getId();
        }
        List<CustomerEntity> customerEntities = customerRepositoryImp.findAll(builder, staffId);
        customerDTOS = customerEntities.stream().map(item -> customerConverter.convertToDto(item)).collect(Collectors.toList());
        return customerDTOS;
    }

    @Override
    public CustomerDTO findOne(Long customerID) {
        CustomerDTO customerDTO = customerConverter.convertToDto(customerRepository.findOne(customerID));
        return customerDTO;
    }

    @Override
    @Transactional
    public void delete(Long[] customerId) {
        customerRepository.deleteByIdIn(customerId);
    }

    @Override
    public CustomerDTO save(CustomerDTO customerDTO) {
        CustomerEntity customerEntity = customerConverter.convertToEntity(customerDTO);
        CustomerDTO saveCustomer = customerConverter.convertToDto(customerRepository.save(customerEntity));
        return saveCustomer;
    }
}
