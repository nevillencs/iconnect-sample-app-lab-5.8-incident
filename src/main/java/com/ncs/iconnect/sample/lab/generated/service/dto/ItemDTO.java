package com.ncs.iconnect.sample.lab.generated.service.dto;

import javax.validation.constraints.*;
import java.io.Serializable;
import java.util.Objects;

/**
 * A DTO for the {@link com.ncs.iconnect.sample.lab.generated.domain.Item} entity.
 */
public class ItemDTO implements Serializable {
    
    private Long id;

    @NotNull
    @Size(min = 6, max = 6)
    @Pattern(regexp = "ITM_[0-1][0-9]")
    private String itemReferenceId;

    @Size(max = 20)
    private String itemName;


    private Long incidentId;

    private String incidentIncidentName;
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getItemReferenceId() {
        return itemReferenceId;
    }

    public void setItemReferenceId(String itemReferenceId) {
        this.itemReferenceId = itemReferenceId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public Long getIncidentId() {
        return incidentId;
    }

    public void setIncidentId(Long incidentId) {
        this.incidentId = incidentId;
    }

    public String getIncidentIncidentName() {
        return incidentIncidentName;
    }

    public void setIncidentIncidentName(String incidentIncidentName) {
        this.incidentIncidentName = incidentIncidentName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        ItemDTO itemDTO = (ItemDTO) o;
        if (itemDTO.getId() == null || getId() == null) {
            return false;
        }
        return Objects.equals(getId(), itemDTO.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(getId());
    }

    @Override
    public String toString() {
        return "ItemDTO{" +
            "id=" + getId() +
            ", itemReferenceId='" + getItemReferenceId() + "'" +
            ", itemName='" + getItemName() + "'" +
            ", incidentId=" + getIncidentId() +
            ", incidentIncidentName='" + getIncidentIncidentName() + "'" +
            "}";
    }
}
