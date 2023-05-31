package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.RentAreaEntity;
import com.laptrinhjavaweb.utils.ValidateUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Component
public class RentAreaConverter {

    @Autowired
    private ModelMapper mapper;

    public List<RentAreaEntity> convertToEntity(BuildingDTO dto, Long id) {
        List<RentAreaEntity> rentAreaEntities = new ArrayList<>();
        String rentArea = dto.getRentArea();
        if (ValidateUtils.isValid(rentArea)) {
            RentAreaEntity rentAreaEntity = new RentAreaEntity();
            List<String> convertedRentArea = Arrays.asList(rentArea.split(","));
            for (String item : convertedRentArea) {
                rentAreaEntity.setId(id);
                rentAreaEntity.setValue(Integer.parseInt(item));
                rentAreaEntity.setBuilding(mapper.map(dto, BuildingEntity.class));
                rentAreaEntities.add(rentAreaEntity);
            }
        }
        return rentAreaEntities;
    }

    public List<RentAreaEntity> convertToEntity(BuildingDTO dto) {
        List<RentAreaEntity> rentAreaEntities = new ArrayList<>();
        String rentArea = dto.getRentArea();
        if (ValidateUtils.isValid(rentArea)) {
            RentAreaEntity rentAreaEntity = new RentAreaEntity();
            List<String> convertedRentArea = Arrays.asList(rentArea.split(","));
            for (String item : convertedRentArea) {
                rentAreaEntity.setValue(Integer.parseInt(item));
                rentAreaEntity.setBuilding(mapper.map(dto, BuildingEntity.class));
                rentAreaEntities.add(rentAreaEntity);
            }
        }
        return rentAreaEntities;
    }
}
