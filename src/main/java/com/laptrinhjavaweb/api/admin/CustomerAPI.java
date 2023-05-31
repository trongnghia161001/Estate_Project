package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.request.TransactionRequest;
import com.laptrinhjavaweb.dto.response.ResponseDTO;
import com.laptrinhjavaweb.dto.response.StaffResponseDTO;
import com.laptrinhjavaweb.input.AssignmentInput;
import com.laptrinhjavaweb.service.impl.AssignmentcustomerService;
import com.laptrinhjavaweb.service.impl.CustomerService;
import com.laptrinhjavaweb.service.impl.TransactionService;
import com.laptrinhjavaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "customerAPIOfAdmin")
@RequestMapping("/api/customer")
public class CustomerAPI {

    @Autowired
    private UserService userService;

    @Autowired
    private AssignmentcustomerService assignmentBuilding;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private TransactionService transactionService;

    @GetMapping("/{customerID}/staffs")
    public ResponseDTO loadStaff(@PathVariable("customerID") Long customerId) {
        ResponseDTO responseDTO = new ResponseDTO();
        List<StaffResponseDTO> staffResponseDTOS = userService.findCustomerId(customerId);
        responseDTO.setData(staffResponseDTOS);
        return responseDTO;
    }

    @PutMapping("/{customerID}/staffs")
    public void updateAssignment(@PathVariable("customerID") Long customerId, @RequestBody List<Long> idList) {
        AssignmentInput assignmentInput = new AssignmentInput(customerId, idList);
        assignmentBuilding.assignmentBuilding(assignmentInput);
    }

    @DeleteMapping
    public ResponseEntity<Void> deleteCustomers(@RequestBody Long[] idList) {
        if (idList.length > 0) {
            customerService.delete(idList);
        }
        return ResponseEntity.noContent().build();
    }

    @PostMapping
    public ResponseEntity<CustomerDTO> addCustomer(@RequestBody CustomerDTO customerDTO) {
        return ResponseEntity.ok(customerService.save(customerDTO));
    }

    @PostMapping("/transaction")
    public void updateTransaction(@RequestBody TransactionRequest transactionRequest) {
        transactionService.save(transactionRequest);
    }
}
