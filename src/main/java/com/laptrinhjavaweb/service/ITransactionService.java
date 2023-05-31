package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.TransactionDTO;
import com.laptrinhjavaweb.dto.request.TransactionRequest;

import java.util.List;
import java.util.Map;

public interface ITransactionService {
    List<TransactionDTO> findAll(Long ID);

    Map<String, String> getTransaction_type();

    void save(TransactionDTO transactionDTO);

    void save(TransactionRequest transactionRequest);
}
