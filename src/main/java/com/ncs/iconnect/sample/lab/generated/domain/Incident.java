package com.ncs.iconnect.sample.lab.generated.domain;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import javax.validation.constraints.*;

import java.io.Serializable;
import java.util.Objects;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

import com.ncs.iconnect.sample.lab.generated.domain.enumeration.IncidentStatus;

/**
 * A Incident.
 */
@Entity
@Table(name = "tbl_incident")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Incident implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    @Size(min = 6, max = 6)
    @Pattern(regexp = "INC_[0-1][0-9]")
    @Column(name = "incident_reference_id", length = 6, nullable = false)
    private String incidentReferenceId;

    @NotNull
    @Size(min = 10, max = 20)
    @Column(name = "incident_name", length = 20, nullable = false)
    private String incidentName;

    @NotNull
    @Enumerated(EnumType.STRING)
    @Column(name = "incident_status", nullable = false)
    private IncidentStatus incidentStatus;

    @NotNull
    @Column(name = "incident_date", nullable = false)
    private LocalDate incidentDate;

    @OneToMany(mappedBy = "incident")
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    private Set<Item> items = new HashSet<>();

    // jhipster-needle-entity-add-field - JHipster will add fields here, do not remove
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getIncidentReferenceId() {
        return incidentReferenceId;
    }

    public Incident incidentReferenceId(String incidentReferenceId) {
        this.incidentReferenceId = incidentReferenceId;
        return this;
    }

    public void setIncidentReferenceId(String incidentReferenceId) {
        this.incidentReferenceId = incidentReferenceId;
    }

    public String getIncidentName() {
        return incidentName;
    }

    public Incident incidentName(String incidentName) {
        this.incidentName = incidentName;
        return this;
    }

    public void setIncidentName(String incidentName) {
        this.incidentName = incidentName;
    }

    public IncidentStatus getIncidentStatus() {
        return incidentStatus;
    }

    public Incident incidentStatus(IncidentStatus incidentStatus) {
        this.incidentStatus = incidentStatus;
        return this;
    }

    public void setIncidentStatus(IncidentStatus incidentStatus) {
        this.incidentStatus = incidentStatus;
    }

    public LocalDate getIncidentDate() {
        return incidentDate;
    }

    public Incident incidentDate(LocalDate incidentDate) {
        this.incidentDate = incidentDate;
        return this;
    }

    public void setIncidentDate(LocalDate incidentDate) {
        this.incidentDate = incidentDate;
    }

    public Set<Item> getItems() {
        return items;
    }

    public Incident items(Set<Item> items) {
        this.items = items;
        return this;
    }

    public Incident addItem(Item item) {
        this.items.add(item);
        item.setIncident(this);
        return this;
    }

    public Incident removeItem(Item item) {
        this.items.remove(item);
        item.setIncident(null);
        return this;
    }

    public void setItems(Set<Item> items) {
        this.items = items;
    }
    // jhipster-needle-entity-add-getters-setters - JHipster will add getters and setters here, do not remove

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof Incident)) {
            return false;
        }
        return id != null && id.equals(((Incident) o).id);
    }

    @Override
    public int hashCode() {
        return 31;
    }

    @Override
    public String toString() {
        return "Incident{" +
            "id=" + getId() +
            ", incidentReferenceId='" + getIncidentReferenceId() + "'" +
            ", incidentName='" + getIncidentName() + "'" +
            ", incidentStatus='" + getIncidentStatus() + "'" +
            ", incidentDate='" + getIncidentDate() + "'" +
            "}";
    }
}
