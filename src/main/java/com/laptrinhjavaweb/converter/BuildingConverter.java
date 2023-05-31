package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.request.BuildingSearchRequest;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.RentAreaEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.enums.DistrictsEnum;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.utils.ValidateUtils;
import org.apache.commons.lang.StringUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;



@Component
public class BuildingConverter {

    @Autowired
    private ModelMapper mapper;

    @Autowired
    private UserRepository userRepository;

    public BuildingDTO convertToDto(BuildingEntity entity) {
        BuildingDTO buildingDTO = mapper.map(entity, BuildingDTO.class);
        for (DistrictsEnum item : DistrictsEnum.values()) {
            if (item.name().equals(entity.getDistrict())) {
                buildingDTO.setAddress(entity.getStreet() + ", " + entity.getWard() + ", " + item.districtValue);
            }
        }
        String buildingType = entity.getBuildingTypes();
        String[] buildingTypes = buildingType.split(",");
        buildingDTO.setBuildingTypes(buildingTypes);

        List<RentAreaEntity> rentAreaEntities = entity.getRentarea();
        List<String> rentArea = new ArrayList<>();
        for (RentAreaEntity item : rentAreaEntities) {
            rentArea.add(String.valueOf(item.getValue()));
        }
        String joinRentArea = String.join(",", rentArea);
        buildingDTO.setRentArea(joinRentArea);
        return buildingDTO;
    }

    public BuildingEntity convertToEntity(BuildingDTO dto) {
        BuildingEntity buildingEntity = mapper.map(dto, BuildingEntity.class);
        List<RentAreaEntity> rentAreaEntities = new ArrayList<>();
        String rentArea = dto.getRentArea();
        if (ValidateUtils.isValid(rentArea)) {
            List<String> convertedRentArea = Arrays.asList(rentArea.split(","));
            for (String item : convertedRentArea) {
                RentAreaEntity rentAreaEntity = new RentAreaEntity();
                rentAreaEntity.setValue(Integer.parseInt(item));
                rentAreaEntity.setBuilding(buildingEntity);
                rentAreaEntities.add(rentAreaEntity);
            }
        }
        buildingEntity.setRentarea(rentAreaEntities);
        String joinedString = StringUtils.join(dto.getBuildingTypes(), ",");
        buildingEntity.setBuildingTypes(joinedString);
        if (dto.getId() != null) {
            List<UserEntity> userEntityList = userRepository.findByBuilding_Id(dto.getId());
            buildingEntity.setUser(userEntityList);
        }
        return buildingEntity;
    }

    public BuildingSearchBuilder convertToBuilder(BuildingSearchRequest buildingSearchRequest) {
        BuildingSearchBuilder builder = new BuildingSearchBuilder.Builder().setName(buildingSearchRequest.getName())
                .setFloorArea(buildingSearchRequest.getFloorArea())
                .setDistrict(buildingSearchRequest.getDistrict())
                .setWard(buildingSearchRequest.getWard())
                .setStreet(buildingSearchRequest.getStreet())
                .setNumberOfBasement(buildingSearchRequest.getNumberOfBasement())
                .setDirection(buildingSearchRequest.getDirection())
                .setLevel(buildingSearchRequest.getLevel())
                .setManagerName(buildingSearchRequest.getManagerName())
                .setManagerPhone(buildingSearchRequest.getManagerPhone())
                .setCostRentFrom(buildingSearchRequest.getCostRentFrom())
                .setCostRentTo(buildingSearchRequest.getCostRentTo())
                .setAreaRentFrom(buildingSearchRequest.getAreaRentFrom())
                .setAreaRentTo(buildingSearchRequest.getAreaRentTo())
                .setStaffId(buildingSearchRequest.getStaffId())
                .setType(buildingSearchRequest.getType())
                .build();
        return builder;
    }
}
