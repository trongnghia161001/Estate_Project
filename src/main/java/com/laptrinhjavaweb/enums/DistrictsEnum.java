package com.laptrinhjavaweb.enums;

public enum DistrictsEnum {
    QUAN_HAI_CHAU("Quận Hải Châu"),
    QUAN_CAM_LE("Quận Cẩm Lệ"),
    QUAN_THANH_KHE("Quận Thanh Khê"),
    QUAN_LIEN_CHIEU("Quận Liên Chiểu"),
    QUAN_NGU_HANH_SON("Quận Ngũ Hành Sơn"),
    QUAN_SON_TRA("Quận Sơn Trà"),
    HUYEN_HOA_VANG("Huyện Hòa Vang");


    public String districtValue;

    DistrictsEnum(String districtValue) {
        this.districtValue = districtValue;
    }

    public String getDistrictValue() {
        return districtValue;
    }
}
