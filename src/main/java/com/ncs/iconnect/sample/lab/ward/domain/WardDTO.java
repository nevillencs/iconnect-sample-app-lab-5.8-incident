package com.ncs.iconnect.sample.lab.ward.domain;
import com.ncs.iconnect.sample.lab.bed.domain.Bed;
import java.util.List;

public class WardDTO {
    private Long id;
    private String wardReferenceId;
    private String wardName;
    private String wardClassType;
    private String wardLocation;
    private List<Bed> beds;

    // Getters and setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getWardReferenceId() { return wardReferenceId; }
    public void setWardReferenceId(String wardReferenceId) { this.wardReferenceId = wardReferenceId; }

    public String getWardName() { return wardName; }
    public void setWardName(String wardName) { this.wardName = wardName; }

    public String getWardClassType() { return wardClassType; }
    public void setWardClassType(String wardClassType) { this.wardClassType = wardClassType; }

    public String getWardLocation() { return wardLocation; }
    public void setWardLocation(String wardLocation) { this.wardLocation = wardLocation; }

    public List<Bed> getBeds() { return beds; }
    public void setBeds(List<Bed> beds) { this.beds = beds; }
}
