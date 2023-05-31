package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.dto.response.StaffResponseDTO;
import com.laptrinhjavaweb.entity.UserEntity;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserConverter {

    @Autowired
    private ModelMapper modelMapper;

    public UserDTO convertToDto(UserEntity entity) {
        UserDTO result = modelMapper.map(entity, UserDTO.class);
        return result;
    }

    public UserEntity convertToEntity(UserDTO dto) {
        UserEntity result = modelMapper.map(dto, UserEntity.class);
        return result;
    }

    public StaffResponseDTO convertToDTO1(UserEntity userEntity) {
        StaffResponseDTO staffOutput = modelMapper.map(userEntity, StaffResponseDTO.class);
        staffOutput.setStaffId(userEntity.getId());
        staffOutput.setFullName(userEntity.getFullName());
        staffOutput.setChecked("Checked");
        return staffOutput;
    }

    public StaffResponseDTO convertToDTO2(UserEntity userEntity) {
        StaffResponseDTO staffOutput = modelMapper.map(userEntity, StaffResponseDTO.class);
        staffOutput.setStaffId(userEntity.getId());
        staffOutput.setFullName(userEntity.getFullName());
        staffOutput.setChecked("");
        return staffOutput;
    }
}
