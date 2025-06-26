package com.ncs.iconnect.sample.lab.bed.domain;

import java.time.LocalDate;

public class CreateBedDTO {
    private String bedReferenceId;
    private String bedName;
    private String wardName = null;
    private LocalDate wardAllocationDate;

    public String getBedReferenceId() {
        return bedReferenceId;
    }

    public void setBedReferenceId(String bedReferenceId) {
        this.bedReferenceId = bedReferenceId;
    }

    public String getBedName() {
        return bedName;
    }

    public void setBedName(String bedName) {
        this.bedName = bedName;
    }

    public String getWardName() {
        return wardName;
    }

    public void setWardName(String wardName) {
        this.wardName = wardName;
    }

    public LocalDate getWardAllocationDate() {
        return wardAllocationDate;
    }

    public void setWardAllocationDate(LocalDate wardAllocationDate) {
        this.wardAllocationDate = wardAllocationDate;
    }
}
