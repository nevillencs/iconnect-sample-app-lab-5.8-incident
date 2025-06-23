package com.ncs.iconnect.sample.lab.generated.service.dto;

import java.io.Serializable;
import java.util.Objects;
import io.github.jhipster.service.Criteria;
import io.github.jhipster.service.filter.BooleanFilter;
import io.github.jhipster.service.filter.DoubleFilter;
import io.github.jhipster.service.filter.Filter;
import io.github.jhipster.service.filter.FloatFilter;
import io.github.jhipster.service.filter.IntegerFilter;
import io.github.jhipster.service.filter.LongFilter;
import io.github.jhipster.service.filter.StringFilter;

/**
 * Criteria class for the {@link com.ncs.iconnect.sample.lab.generated.domain.Item} entity. This class is used
 * in {@link com.ncs.iconnect.sample.lab.generated.web.rest.ItemResource} to receive all the possible filtering options from
 * the Http GET request parameters.
 * For example the following could be a valid request:
 * {@code /items?id.greaterThan=5&attr1.contains=something&attr2.specified=false}
 * As Spring is unable to properly convert the types, unless specific {@link Filter} class are used, we need to use
 * fix type specific filters.
 */
public class ItemCriteria implements Serializable, Criteria {

    private static final long serialVersionUID = 1L;

    private LongFilter id;

    private StringFilter itemReferenceId;

    private StringFilter itemName;

    private LongFilter incidentId;

    public ItemCriteria() {
    }

    public ItemCriteria(ItemCriteria other) {
        this.id = other.id == null ? null : other.id.copy();
        this.itemReferenceId = other.itemReferenceId == null ? null : other.itemReferenceId.copy();
        this.itemName = other.itemName == null ? null : other.itemName.copy();
        this.incidentId = other.incidentId == null ? null : other.incidentId.copy();
    }

    @Override
    public ItemCriteria copy() {
        return new ItemCriteria(this);
    }

    public LongFilter getId() {
        return id;
    }

    public void setId(LongFilter id) {
        this.id = id;
    }

    public StringFilter getItemReferenceId() {
        return itemReferenceId;
    }

    public void setItemReferenceId(StringFilter itemReferenceId) {
        this.itemReferenceId = itemReferenceId;
    }

    public StringFilter getItemName() {
        return itemName;
    }

    public void setItemName(StringFilter itemName) {
        this.itemName = itemName;
    }

    public LongFilter getIncidentId() {
        return incidentId;
    }

    public void setIncidentId(LongFilter incidentId) {
        this.incidentId = incidentId;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        final ItemCriteria that = (ItemCriteria) o;
        return
            Objects.equals(id, that.id) &&
            Objects.equals(itemReferenceId, that.itemReferenceId) &&
            Objects.equals(itemName, that.itemName) &&
            Objects.equals(incidentId, that.incidentId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(
        id,
        itemReferenceId,
        itemName,
        incidentId
        );
    }

    @Override
    public String toString() {
        return "ItemCriteria{" +
                (id != null ? "id=" + id + ", " : "") +
                (itemReferenceId != null ? "itemReferenceId=" + itemReferenceId + ", " : "") +
                (itemName != null ? "itemName=" + itemName + ", " : "") +
                (incidentId != null ? "incidentId=" + incidentId + ", " : "") +
            "}";
    }

}
