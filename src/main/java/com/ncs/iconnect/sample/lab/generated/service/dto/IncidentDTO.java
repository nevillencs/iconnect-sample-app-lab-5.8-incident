package com.ncs.iconnect.sample.lab.generated.service.dto;

import java.time.LocalDate;
import javax.validation.constraints.*;
import java.io.Serializable;
import java.util.Objects;
import com.ncs.iconnect.sample.lab.generated.domain.enumeration.IncidentStatus;

/**
 * A DTO for the {@link com.ncs.iconnect.sample.lab.generated.domain.Incident} entity.
 */
public class IncidentDTO implements Serializable {
    
    private Long id;

    @NotNull
    @Size(min = 6, max = 6)
    @Pattern(regexp = "INC_[0-1][0-9]")
    private String incidentReferenceId;

    @NotNull
    @Size(min = 10, max = 20)
    private String incidentName;

    @NotNull
    private IncidentStatus incidentStatus;

    @NotNull
    private LocalDate incidentDate;

    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getIncidentReferenceId() {
        return incidentReferenceId;
    }

    public void setIncidentReferenceId(String incidentReferenceId) {
        this.incidentReferenceId = incidentReferenceId;
    }

    public String getIncidentName() {
        return incidentName;
    }

    public void setIncidentName(String incidentName) {
        this.incidentName = incidentName;
    }

    public IncidentStatus getIncidentStatus() {
        return incidentStatus;
    }

    public void setIncidentStatus(IncidentStatus incidentStatus) {
        this.incidentStatus = incidentStatus;
    }

    public LocalDate getIncidentDate() {
        return incidentDate;
    }

    public void setIncidentDate(LocalDate incidentDate) {
        this.incidentDate = incidentDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        IncidentDTO incidentDTO = (IncidentDTO) o;
        if (incidentDTO.getId() == null || getId() == null) {
            return false;
        }
        return Objects.equals(getId(), incidentDTO.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(getId());
    }

    @Override
    public String toString() {
        return "IncidentDTO{" +
            "id=" + getId() +
            ", incidentReferenceId='" + getIncidentReferenceId() + "'" +
            ", incidentName='" + getIncidentName() + "'" +
            ", incidentStatus='" + getIncidentStatus() + "'" +
            ", incidentDate='" + getIncidentDate() + "'" +
            "}";
    }
}
