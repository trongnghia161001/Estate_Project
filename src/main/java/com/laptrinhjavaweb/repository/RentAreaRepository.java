package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.RentAreaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RentAreaRepository extends JpaRepository<RentAreaEntity, Long> {
    void deleteByBuildingIdIn(Long id);
    void deleteByBuildingId(Long id);
    List<RentAreaEntity> findByBuildingIdIn(Long id);
}
