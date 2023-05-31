package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.TransactionDTO;
import com.laptrinhjavaweb.dto.request.TransactionRequest;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.entity.TransactionEntity;
import com.laptrinhjavaweb.enums.TransactionTypesEnum;
import com.laptrinhjavaweb.repository.CustomerRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class TransactionConverter {

    @Autowired
    private ModelMapper mapper;

    @Autowired
    private CustomerRepository customerRepository;

    public TransactionDTO convertToDto(TransactionEntity transactionEntity) {
        TransactionDTO transactionDTO = mapper.map(transactionEntity, TransactionDTO.class);
        for (TransactionTypesEnum item : TransactionTypesEnum.values()) {
            if (item.name().equals(transactionEntity.getCode())) {
                transactionDTO.setCode(item.getTransactionValue());
            }
        }
        transactionDTO.setDateAdd(transactionEntity.getModifiedDate());
        return transactionDTO;
    }

    public TransactionEntity convertToEntity(TransactionDTO transactionDTO) {
        TransactionEntity transactionEntity = mapper.map(transactionDTO, TransactionEntity.class);
        return transactionEntity;
    }

    public TransactionEntity convertToEntity(TransactionRequest transactionRequest) {
        TransactionEntity transactionEntity = mapper.map(transactionRequest, TransactionEntity.class);
        CustomerEntity customerEntity = customerRepository.findOne(transactionRequest.getCustomerId());
        transactionEntity.setCustomer(customerEntity);
        return transactionEntity;
    }
}
