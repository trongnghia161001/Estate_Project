package com.laptrinhjavaweb.builder;

public class CustomerSearchBuilder {
    private String fullname;
    private Long staffId;
    private String phone;
    private String email;
    private String demand;
    private String status;
    private String companyName;
    private String note;

    public String getFullname() {
        return fullname;
    }

    public Long getStaffId() {
        return staffId;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public String getDemand() {
        return demand;
    }

    public String getStatus() {
        return status;
    }

    public String getCompanyName() {
        return companyName;
    }

    public String getNote() {
        return note;
    }

    private CustomerSearchBuilder(Builder builder) {
        this.fullname = builder.fullname;
        this.staffId = builder.staffId;
        this.phone = builder.phone;
        this.email = builder.email;
        this.demand = builder.demand;
        this.status = builder.status;
        this.companyName = builder.companyName;
        this.note = builder.note;
    }

    public static class Builder {
        private String fullname;
        private Long staffId;
        private String phone;
        private String email;
        private String demand;
        private String status;
        private String companyName;
        private String note;

        public Builder setFullname(String fullname) {
            this.fullname = fullname;
            return this;
        }

        public Builder setStaffName(Long staffId) {
            this.staffId = staffId;
            return this;
        }

        public Builder setPhone(String phone) {
            this.phone = phone;
            return this;
        }

        public Builder setEmail(String email) {
            this.email = email;
            return this;
        }

        public Builder setDemand(String demand) {
            this.demand = demand;
            return this;
        }

        public Builder setStatus(String status) {
            this.status = status;
            return this;
        }

        public Builder setCompanyName(String companyName) {
            this.companyName = companyName;
            return this;
        }

        public Builder setNote(String note) {
            this.note = note;
            return this;
        }

        public CustomerSearchBuilder buil() {
            return new CustomerSearchBuilder(this);
        }
    }
}
