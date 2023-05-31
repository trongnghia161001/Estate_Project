package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.builder.CustomerSearchBuilder;
import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.request.CustomerSearchRequest;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.UserRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class CustomerConverter {

    @Autowired
    private ModelMapper mapper;

    @Autowired
    private UserRepository userRepository;

    public CustomerDTO convertToDto(CustomerEntity customerEntity) {
        CustomerDTO customerDTO = mapper.map(customerEntity, CustomerDTO.class);
        return customerDTO;
    }

    public CustomerEntity convertToEntity(CustomerDTO customerDTO) {
        CustomerEntity customerEntity = mapper.map(customerDTO, CustomerEntity.class);
        if (customerDTO.getId() != null) {
            List<UserEntity> userEntities = userRepository.findByCustomer_Id(customerDTO.getId());
            customerEntity.setUser(userEntities);
        }
        return customerEntity;
    }

    public CustomerSearchBuilder convertToBuilder(CustomerSearchRequest customerSearchRequest) {
        CustomerSearchBuilder customerSearchBuilder = new CustomerSearchBuilder.Builder().setFullname(customerSearchRequest.getFullname())
                .setPhone(customerSearchRequest.getPhone())
                .setEmail(customerSearchRequest.getEmail())
                .setStaffName(customerSearchRequest.getStaffId())
                .buil();
        return customerSearchBuilder;
    }
}
