package com.ncs.iconnect.sample.lab.generated.service;

import java.util.List;

import javax.persistence.criteria.JoinType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import io.github.jhipster.service.QueryService;

import com.ncs.iconnect.sample.lab.generated.domain.Incident;
import com.ncs.iconnect.sample.lab.generated.domain.*; // for static metamodels
import com.ncs.iconnect.sample.lab.generated.repository.IncidentRepository;
import com.ncs.iconnect.sample.lab.generated.service.dto.IncidentCriteria;
import com.ncs.iconnect.sample.lab.generated.service.dto.IncidentDTO;
import com.ncs.iconnect.sample.lab.generated.service.mapper.IncidentMapper;

/**
 * Service for executing complex queries for {@link Incident} entities in the database.
 * The main input is a {@link IncidentCriteria} which gets converted to {@link Specification},
 * in a way that all the filters must apply.
 * It returns a {@link List} of {@link IncidentDTO} or a {@link Page} of {@link IncidentDTO} which fulfills the criteria.
 */
@Service
@Transactional(readOnly = true)
public class IncidentQueryService extends QueryService<Incident> {

    private final Logger log = LoggerFactory.getLogger(IncidentQueryService.class);

    private final IncidentRepository incidentRepository;

    private final IncidentMapper incidentMapper;

    public IncidentQueryService(IncidentRepository incidentRepository, IncidentMapper incidentMapper) {
        this.incidentRepository = incidentRepository;
        this.incidentMapper = incidentMapper;
    }

    /**
     * Return a {@link List} of {@link IncidentDTO} which matches the criteria from the database.
     * @param criteria The object which holds all the filters, which the entities should match.
     * @return the matching entities.
     */
    @Transactional(readOnly = true)
    public List<IncidentDTO> findByCriteria(IncidentCriteria criteria) {
        log.debug("find by criteria : {}", criteria);
        final Specification<Incident> specification = createSpecification(criteria);
        return incidentMapper.toDto(incidentRepository.findAll(specification));
    }

    /**
     * Return a {@link Page} of {@link IncidentDTO} which matches the criteria from the database.
     * @param criteria The object which holds all the filters, which the entities should match.
     * @param page The page, which should be returned.
     * @return the matching entities.
     */
    @Transactional(readOnly = true)
    public Page<IncidentDTO> findByCriteria(IncidentCriteria criteria, Pageable page) {
        log.debug("find by criteria : {}, page: {}", criteria, page);
        final Specification<Incident> specification = createSpecification(criteria);
        return incidentRepository.findAll(specification, page)
            .map(incidentMapper::toDto);
    }

    /**
     * Return the number of matching entities in the database.
     * @param criteria The object which holds all the filters, which the entities should match.
     * @return the number of matching entities.
     */
    @Transactional(readOnly = true)
    public long countByCriteria(IncidentCriteria criteria) {
        log.debug("count by criteria : {}", criteria);
        final Specification<Incident> specification = createSpecification(criteria);
        return incidentRepository.count(specification);
    }

    /**
     * Function to convert {@link IncidentCriteria} to a {@link Specification}
     * @param criteria The object which holds all the filters, which the entities should match.
     * @return the matching {@link Specification} of the entity.
     */
    protected Specification<Incident> createSpecification(IncidentCriteria criteria) {
        Specification<Incident> specification = Specification.where(null);
        if (criteria != null) {
            if (criteria.getId() != null) {
                specification = specification.and(buildRangeSpecification(criteria.getId(), Incident_.id));
            }
            if (criteria.getIncidentReferenceId() != null) {
                specification = specification.and(buildStringSpecification(criteria.getIncidentReferenceId(), Incident_.incidentReferenceId));
            }
            if (criteria.getIncidentName() != null) {
                specification = specification.and(buildStringSpecification(criteria.getIncidentName(), Incident_.incidentName));
            }
            if (criteria.getIncidentStatus() != null) {
                specification = specification.and(buildSpecification(criteria.getIncidentStatus(), Incident_.incidentStatus));
            }
            if (criteria.getIncidentDate() != null) {
                specification = specification.and(buildRangeSpecification(criteria.getIncidentDate(), Incident_.incidentDate));
            }
            if (criteria.getItemId() != null) {
                specification = specification.and(buildSpecification(criteria.getItemId(),
                    root -> root.join(Incident_.items, JoinType.LEFT).get(Item_.id)));
            }
        }
        return specification;
    }
}
