package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.TransactionConverter;
import com.laptrinhjavaweb.dto.TransactionDTO;
import com.laptrinhjavaweb.dto.request.TransactionRequest;
import com.laptrinhjavaweb.entity.TransactionEntity;
import com.laptrinhjavaweb.enums.TransactionTypesEnum;
import com.laptrinhjavaweb.repository.TransactionRepository;
import com.laptrinhjavaweb.service.ITransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class TransactionService implements ITransactionService {

    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private TransactionConverter transactionConverter;

    @Override
    public List<TransactionDTO> findAll(Long ID) {
        List<TransactionDTO> transactionDTOS;
        List<TransactionEntity> transactionEntities = transactionRepository.findByCustomer_Id(ID);
        if (transactionEntities.size() > 0) {
            transactionDTOS = transactionEntities.stream().map(item -> transactionConverter.convertToDto(item)).collect(Collectors.toList());
            return transactionDTOS;
        }
        return null;
    }

    @Override
    public Map<String, String> getTransaction_type() {
        Map<String, String> transaction = new HashMap<>();
        for (TransactionTypesEnum item : TransactionTypesEnum.values()) {
            transaction.put(item.toString(), item.getTransactionValue());
        }
        return transaction;
    }

    @Override
    @Transactional
    public void save(TransactionDTO transactionDTO) {
        transactionRepository.save(transactionConverter.convertToEntity(transactionDTO));
    }

    @Override
    @Transactional
    public void save(TransactionRequest transactionRequest) {
        TransactionEntity transactionEntity = transactionConverter.convertToEntity(transactionRequest);
        transactionRepository.save(transactionEntity);
    }
}
