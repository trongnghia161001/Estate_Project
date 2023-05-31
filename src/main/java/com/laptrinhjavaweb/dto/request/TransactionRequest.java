package com.laptrinhjavaweb.dto.request;

import java.util.Date;

public class TransactionRequest {
    private Long customerId;
    private String code;
    private String note;
    private Date createdDate;

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public String toString() {
        return "TransactionRequest{" +
                "customerId=" + customerId +
                ", code='" + code + '\'' +
                ", note='" + note + '\'' +
                '}';
    }
}
