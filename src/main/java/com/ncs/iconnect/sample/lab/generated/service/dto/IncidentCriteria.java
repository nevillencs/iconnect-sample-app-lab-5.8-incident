package com.ncs.iconnect.sample.lab.generated.service.dto;

import java.io.Serializable;
import java.util.Objects;
import io.github.jhipster.service.Criteria;
import com.ncs.iconnect.sample.lab.generated.domain.enumeration.IncidentStatus;
import io.github.jhipster.service.filter.BooleanFilter;
import io.github.jhipster.service.filter.DoubleFilter;
import io.github.jhipster.service.filter.Filter;
import io.github.jhipster.service.filter.FloatFilter;
import io.github.jhipster.service.filter.IntegerFilter;
import io.github.jhipster.service.filter.LongFilter;
import io.github.jhipster.service.filter.StringFilter;
import io.github.jhipster.service.filter.LocalDateFilter;

/**
 * Criteria class for the {@link com.ncs.iconnect.sample.lab.generated.domain.Incident} entity. This class is used
 * in {@link com.ncs.iconnect.sample.lab.generated.web.rest.IncidentResource} to receive all the possible filtering options from
 * the Http GET request parameters.
 * For example the following could be a valid request:
 * {@code /incidents?id.greaterThan=5&attr1.contains=something&attr2.specified=false}
 * As Spring is unable to properly convert the types, unless specific {@link Filter} class are used, we need to use
 * fix type specific filters.
 */
public class IncidentCriteria implements Serializable, Criteria {
    /**
     * Class for filtering IncidentStatus
     */
    public static class IncidentStatusFilter extends Filter<IncidentStatus> {

        public IncidentStatusFilter() {
        }

        public IncidentStatusFilter(IncidentStatusFilter filter) {
            super(filter);
        }

        @Override
        public IncidentStatusFilter copy() {
            return new IncidentStatusFilter(this);
        }

    }

    private static final long serialVersionUID = 1L;

    private LongFilter id;

    private StringFilter incidentReferenceId;

    private StringFilter incidentName;

    private IncidentStatusFilter incidentStatus;

    private LocalDateFilter incidentDate;

    private LongFilter itemId;

    public IncidentCriteria() {
    }

    public IncidentCriteria(IncidentCriteria other) {
        this.id = other.id == null ? null : other.id.copy();
        this.incidentReferenceId = other.incidentReferenceId == null ? null : other.incidentReferenceId.copy();
        this.incidentName = other.incidentName == null ? null : other.incidentName.copy();
        this.incidentStatus = other.incidentStatus == null ? null : other.incidentStatus.copy();
        this.incidentDate = other.incidentDate == null ? null : other.incidentDate.copy();
        this.itemId = other.itemId == null ? null : other.itemId.copy();
    }

    @Override
    public IncidentCriteria copy() {
        return new IncidentCriteria(this);
    }

    public LongFilter getId() {
        return id;
    }

    public void setId(LongFilter id) {
        this.id = id;
    }

    public StringFilter getIncidentReferenceId() {
        return incidentReferenceId;
    }

    public void setIncidentReferenceId(StringFilter incidentReferenceId) {
        this.incidentReferenceId = incidentReferenceId;
    }

    public StringFilter getIncidentName() {
        return incidentName;
    }

    public void setIncidentName(StringFilter incidentName) {
        this.incidentName = incidentName;
    }

    public IncidentStatusFilter getIncidentStatus() {
        return incidentStatus;
    }

    public void setIncidentStatus(IncidentStatusFilter incidentStatus) {
        this.incidentStatus = incidentStatus;
    }

    public LocalDateFilter getIncidentDate() {
        return incidentDate;
    }

    public void setIncidentDate(LocalDateFilter incidentDate) {
        this.incidentDate = incidentDate;
    }

    public LongFilter getItemId() {
        return itemId;
    }

    public void setItemId(LongFilter itemId) {
        this.itemId = itemId;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        final IncidentCriteria that = (IncidentCriteria) o;
        return
            Objects.equals(id, that.id) &&
            Objects.equals(incidentReferenceId, that.incidentReferenceId) &&
            Objects.equals(incidentName, that.incidentName) &&
            Objects.equals(incidentStatus, that.incidentStatus) &&
            Objects.equals(incidentDate, that.incidentDate) &&
            Objects.equals(itemId, that.itemId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(
        id,
        incidentReferenceId,
        incidentName,
        incidentStatus,
        incidentDate,
        itemId
        );
    }

    @Override
    public String toString() {
        return "IncidentCriteria{" +
                (id != null ? "id=" + id + ", " : "") +
                (incidentReferenceId != null ? "incidentReferenceId=" + incidentReferenceId + ", " : "") +
                (incidentName != null ? "incidentName=" + incidentName + ", " : "") +
                (incidentStatus != null ? "incidentStatus=" + incidentStatus + ", " : "") +
                (incidentDate != null ? "incidentDate=" + incidentDate + ", " : "") +
                (itemId != null ? "itemId=" + itemId + ", " : "") +
            "}";
    }

}
