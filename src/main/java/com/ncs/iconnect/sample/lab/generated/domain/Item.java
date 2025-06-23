package com.ncs.iconnect.sample.lab.generated.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import javax.validation.constraints.*;

import java.io.Serializable;
import java.util.Objects;

/**
 * A Item.
 */
@Entity
@Table(name = "tbl_item")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Item implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    @Size(min = 6, max = 6)
    @Pattern(regexp = "ITM_[0-1][0-9]")
    @Column(name = "item_reference_id", length = 6, nullable = false)
    private String itemReferenceId;

    @Size(max = 20)
    @Column(name = "item_name", length = 20)
    private String itemName;

    @ManyToOne
    @JsonIgnoreProperties("items")
    private Incident incident;

    // jhipster-needle-entity-add-field - JHipster will add fields here, do not remove
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getItemReferenceId() {
        return itemReferenceId;
    }

    public Item itemReferenceId(String itemReferenceId) {
        this.itemReferenceId = itemReferenceId;
        return this;
    }

    public void setItemReferenceId(String itemReferenceId) {
        this.itemReferenceId = itemReferenceId;
    }

    public String getItemName() {
        return itemName;
    }

    public Item itemName(String itemName) {
        this.itemName = itemName;
        return this;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public Incident getIncident() {
        return incident;
    }

    public Item incident(Incident incident) {
        this.incident = incident;
        return this;
    }

    public void setIncident(Incident incident) {
        this.incident = incident;
    }
    // jhipster-needle-entity-add-getters-setters - JHipster will add getters and setters here, do not remove

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof Item)) {
            return false;
        }
        return id != null && id.equals(((Item) o).id);
    }

    @Override
    public int hashCode() {
        return 31;
    }

    @Override
    public String toString() {
        return "Item{" +
            "id=" + getId() +
            ", itemReferenceId='" + getItemReferenceId() + "'" +
            ", itemName='" + getItemName() + "'" +
            "}";
    }
}
