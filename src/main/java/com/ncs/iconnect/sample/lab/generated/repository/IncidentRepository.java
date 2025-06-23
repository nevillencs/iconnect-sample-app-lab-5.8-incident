package com.ncs.iconnect.sample.lab.generated.repository;

import com.ncs.iconnect.sample.lab.generated.domain.Incident;

import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;

/**
 * Spring Data  repository for the Incident entity.
 */
@SuppressWarnings("unused")
@Repository
public interface IncidentRepository extends JpaRepository<Incident, Long>, JpaSpecificationExecutor<Incident> {
}
