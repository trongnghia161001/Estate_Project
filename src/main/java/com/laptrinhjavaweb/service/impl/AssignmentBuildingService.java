package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.input.AssignmentInput;
import com.laptrinhjavaweb.repository.BuildingRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.IAssignmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
public class AssignmentBuildingService implements IAssignmentBuildingService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BuildingRepository buildingRepository;


    @Override
    @Transactional
    public void assignmentBuilding(AssignmentInput assignmentInput) {
        BuildingEntity buildingEntity = buildingRepository.findOne(assignmentInput.getId());
        Optional<BuildingEntity> building = Optional.ofNullable(buildingEntity);
        if (building.isPresent()) {
            buildingEntity.setUser(userRepository.findAll(assignmentInput.getIds()));
            buildingRepository.save(buildingEntity);
        }
    }
}
