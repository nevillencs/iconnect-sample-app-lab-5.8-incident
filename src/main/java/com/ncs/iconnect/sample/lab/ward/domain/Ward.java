package com.ncs.iconnect.sample.lab.ward.domain;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.envers.Audited;
import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;

@Entity
@Table(name = "tbl_ward")
@Audited
public class Ward {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="WARD_REFERENCE_ID")
    private String wardReferenceId;
    @Column(name="WARD_NAME")
    private String wardName;
    @Column(name="WARD_CLASS_TYPE")
    private String wardClassType;
    @Column(name="WARD_LOCATION")
    private String wardLocation;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getWardReferenceId() {
        return wardReferenceId;
    }

    public void setWardReferenceId(String wardReferenceId) {
        this.wardReferenceId = wardReferenceId;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Ward ward = (Ward) o;
        if (ward.getId() == null || getId() == null) {
            return false;
        }
        return Objects.equals(getId(), ward.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(getId());
    }

    @Override
    public String toString() {
        return "Ward{" + "id=" + getId() + ", wardReferenceId='" + getWardReferenceId() + "'" + ", wardName=" + getWardName()
            + ", wardClassType=" + getWardClassType() + ", wardLocation='" + getWardLocation() + "}";
    }

}
