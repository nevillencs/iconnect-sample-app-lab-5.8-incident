package com.ncs.iconnect.sample.lab.generated.service.mapper;


import com.ncs.iconnect.sample.lab.generated.domain.*;
import com.ncs.iconnect.sample.lab.generated.service.dto.IncidentDTO;

import org.mapstruct.*;

/**
 * Mapper for the entity {@link Incident} and its DTO {@link IncidentDTO}.
 */
@Mapper(componentModel = "spring", uses = {})
public interface IncidentMapper extends EntityMapper<IncidentDTO, Incident> {


    @Mapping(target = "items", ignore = true)
    @Mapping(target = "removeItem", ignore = true)
    Incident toEntity(IncidentDTO incidentDTO);

    default Incident fromId(Long id) {
        if (id == null) {
            return null;
        }
        Incident incident = new Incident();
        incident.setId(id);
        return incident;
    }
}
