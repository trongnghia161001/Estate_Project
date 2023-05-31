package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.dto.response.ResponseDTO;
import com.laptrinhjavaweb.dto.response.StaffResponseDTO;
import com.laptrinhjavaweb.input.AssignmentInput;
import com.laptrinhjavaweb.service.impl.AssignmentBuildingService;
import com.laptrinhjavaweb.service.impl.BuildingService;
import com.laptrinhjavaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "buildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {

    @Autowired
    private BuildingService buildingService;

    @Autowired
    private AssignmentBuildingService assignmentBuildingService;

    @Autowired
    private UserService userService;

    @GetMapping("/{buildingId}/staffs")
    public ResponseDTO loadStaff(@PathVariable("buildingId") Long buildingId) {
        ResponseDTO responseDTO = new ResponseDTO();
        List<StaffResponseDTO> staffResponseDTOS = userService.findBuildingId(buildingId);
        responseDTO.setData(staffResponseDTOS);
        return responseDTO;
    }

    @DeleteMapping
    public ResponseEntity<Void> deleteBuildings(@RequestBody Long[] idList) {
        if (idList.length > 0) {
            buildingService.delete(idList);
        }
        return ResponseEntity.noContent().build();
    }

    @PostMapping
    public ResponseEntity<BuildingDTO> addBuilding(@RequestBody BuildingDTO buildingDTO) {
        return ResponseEntity.ok(buildingService.save(buildingDTO));
    }

    @PutMapping("/{buildingId}/staffs")
    public void updateAssignment(@PathVariable("buildingId") Long buildingId, @RequestBody List<Long> idList) {
        AssignmentInput assignmentInput = new AssignmentInput(buildingId, idList);
        assignmentBuildingService.assignmentBuilding(assignmentInput);
    }
}

