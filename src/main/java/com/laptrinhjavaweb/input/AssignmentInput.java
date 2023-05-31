package com.laptrinhjavaweb.input;

import java.util.List;

public class AssignmentInput {
    private Long Id;
    private List<Long> ids;

    public AssignmentInput(Long Id, List<Long> ids) {
        this.Id = Id;
        this.ids = ids;
    }

    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        Id = id;
    }

    public List<Long> getIds() {
        return ids;
    }

    public void setIds(List<Long> ids) {
        this.ids = ids;
    }
}
