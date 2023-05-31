package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.input.AssignmentInput;
import com.laptrinhjavaweb.repository.CustomerRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.IAssignmentcustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AssignmentcustomerService implements IAssignmentcustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public void assignmentBuilding(AssignmentInput assignmentInput) {
        CustomerEntity customerEntity = customerRepository.findOne(assignmentInput.getId());
        Optional<CustomerEntity> customer = Optional.ofNullable(customerEntity);
        if (customer.isPresent()) {
            customerEntity.setUser(userRepository.findAll(assignmentInput.getIds()));
            customerRepository.save(customerEntity);
        }
    }
}
