package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.converter.BuildingConverter;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.request.BuildingSearchRequest;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.enums.BuildingTypesEnum;
import com.laptrinhjavaweb.enums.DistrictsEnum;
import com.laptrinhjavaweb.repository.BuildingRepository;
import com.laptrinhjavaweb.repository.RentAreaRepository;
import com.laptrinhjavaweb.repository.custom.impl.BuildingRepositoryImpl;
import com.laptrinhjavaweb.security.utils.SecurityUtils;
import com.laptrinhjavaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class BuildingService implements IBuildingService {
    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private BuildingRepositoryImpl buildingRepositoryImpl;

    @Autowired
    private BuildingConverter buildingConverter;

    @Autowired
    private RentAreaRepository rentAreaRepository;



    @Override
    public List<BuildingDTO> findAll() {
        List<BuildingDTO> buildingDTOS = new ArrayList<>();
        List<BuildingEntity> entities = buildingRepository.findAll();
        buildingDTOS = entities.stream().map(item -> buildingConverter.convertToDto(item)).collect(Collectors.toList());
        return buildingDTOS;
    }

    @Override
    public List<BuildingDTO> findAll(BuildingSearchRequest buildingSearchRequest) {
        List<BuildingDTO> buildingDTOS = new ArrayList<>();
        BuildingSearchBuilder builder = buildingConverter.convertToBuilder(buildingSearchRequest);
        String role = String.valueOf(SecurityUtils.getPrincipal().getAuthorities());
        String name_role = role.substring(6, role.length() - 1);
        Long staffId = null;
        if (name_role.equals("staff")) {
            staffId = SecurityUtils.getPrincipal().getId();
        }
        List<BuildingEntity> buildingEntities = buildingRepositoryImpl.findAll(builder, staffId);
        buildingDTOS = buildingEntities.stream().map(item -> buildingConverter.convertToDto(item)).collect(Collectors.toList());
        return buildingDTOS;
    }

    @Override
    public BuildingDTO findOne(Long id) {
        return buildingConverter.convertToDto(buildingRepository.findOne(id));
    }

    @Override
    public Map<String, String> getDistricts() {
        Map<String, String> districts = new HashMap<>();
        for (DistrictsEnum item : DistrictsEnum.values()) {
            districts.put(item.toString(), item.getDistrictValue());
        }
        return districts;
    }

    @Override
    public Map<String, String> getBuildingTypes() {
        Map<String, String> buildingTypes = new HashMap<>();
        for (BuildingTypesEnum item : BuildingTypesEnum.values()) {
            buildingTypes.put(item.toString(), item.getBuildingTypeValue());
        }
        return buildingTypes;
    }

    @Override
    @Transactional
    public void delete(Long[] buildingId) {
        buildingRepository.deleteByIdIn(buildingId);
    }

    @Override
    @Transactional
    public BuildingDTO save(BuildingDTO buildingDTO) {
        if (buildingDTO.getId() != null) {
            rentAreaRepository.deleteByBuildingId(buildingDTO.getId());
        }
        BuildingEntity buildingEntity = buildingConverter.convertToEntity(buildingDTO);
        BuildingDTO saveBuilding = buildingConverter.convertToDto(buildingRepository.save(buildingEntity));
        return saveBuilding;
    }
}
