package com.laptrinhjavaweb.enums;

public enum TransactionTypesEnum {

    CSKH("QÚA TRÌNH CHĂM SÓC KHÁCH HÀNG"),
    DĐX("DẪN ĐI XEM");

    private final String transactionValue;

    TransactionTypesEnum(String transactionValue) {
        this.transactionValue = transactionValue;
    }

    public String getTransactionValue() {
        return transactionValue;
    }
}
