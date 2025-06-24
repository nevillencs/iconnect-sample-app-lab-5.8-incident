package com.ncs.iconnect.sample.lab.bed.domain;
import com.ncs.iconnect.sample.lab.ward.domain.Ward;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.envers.Audited;
import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;

@Entity
@Table(name = "tbl_bed")
@Audited
public class Bed {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="BED_REFERENCE_ID")
    private String bedReferenceId;
    @Column(name="BED_NAME")
    private String bedName;
    @ManyToOne
    @JoinColumn(name="WARD_ID")
    private Ward ward;
    @Column(name="WARD_ALLOCATION_DATE")
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

    public Ward getWard() {
        return ward;
    }

    public void setWard(Ward ward) {
        this.ward = ward;
    }

    public LocalDate getWardAllocationDate() {
        return wardAllocationDate;
    }

    public void setWardAllocationDate(LocalDate wardAllocationDate) {
        this.wardAllocationDate = wardAllocationDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Bed bed = (Bed) o;
        if (bed.getId() == null || getId() == null) {
            return false;
        }
        return Objects.equals(getId(), bed.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(getId());
    }

    @Override
    public String toString() {
        return "Bed{" + "id=" + getId() + ", bedReferenceId='" + getBedReferenceId() + "'" + ", bedName=" + getBedName()
            + ", wardId=" + getWard().getId() + ", wardAllocationDate='" + getWardAllocationDate() + "}";
    }
}
