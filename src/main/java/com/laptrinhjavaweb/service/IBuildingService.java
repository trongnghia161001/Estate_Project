package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.request.BuildingSearchRequest;

import java.util.List;
import java.util.Map;

public interface IBuildingService {
    List<BuildingDTO> findAll();
    List<BuildingDTO> findAll(BuildingSearchRequest buildingSearchRequest);
    BuildingDTO save(BuildingDTO buildingDTO);
    Map<String, String> getDistricts();
    Map<String, String> getBuildingTypes();
    void delete(Long[] buildingId);
    BuildingDTO findOne(Long id);
}
