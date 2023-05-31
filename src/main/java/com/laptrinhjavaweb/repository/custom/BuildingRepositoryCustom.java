package com.laptrinhjavaweb.repository.custom;

import com.laptrinhjavaweb.builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.entity.BuildingEntity;

import java.util.List;
import java.util.Map;

public interface BuildingRepositoryCustom {
    List<BuildingEntity> findAll(Map<String, Object> validParams, List<String> types);
    List<BuildingEntity> findAll(BuildingSearchBuilder builder, Long staffId);
}
