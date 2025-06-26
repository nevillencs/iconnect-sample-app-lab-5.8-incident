package com.ncs.iconnect.sample.lab.bed.domain;
import java.time.LocalDate;
import com.ncs.iconnect.sample.lab.ward.domain.WardDTO;

public class BedDTO {
    private Long id;
    private String bedReferenceId;
    private String bedName;
    private String wardName = null;
    private String wardClassType = null;
    private String wardLocation = null;
    private LocalDate wardAllocationDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

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

    public String getWardClassType() {
        return wardClassType;
    }

    public void setWardClassType(String wardClassType) {
        this.wardClassType = wardClassType;
    }

    public String getWardLocation() {
        return wardLocation;
    }

    public void setWardLocation(String wardLocation) {
        this.wardLocation = wardLocation;
    }

    public LocalDate getWardAllocationDate() {
        return wardAllocationDate;
    }

    public void setWardAllocationDate(LocalDate wardAllocationDate) {
        this.wardAllocationDate = wardAllocationDate;
    }
}
