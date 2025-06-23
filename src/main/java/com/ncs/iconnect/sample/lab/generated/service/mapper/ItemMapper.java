package com.ncs.iconnect.sample.lab.generated.service.mapper;


import com.ncs.iconnect.sample.lab.generated.domain.*;
import com.ncs.iconnect.sample.lab.generated.service.dto.ItemDTO;

import org.mapstruct.*;

/**
 * Mapper for the entity {@link Item} and its DTO {@link ItemDTO}.
 */
@Mapper(componentModel = "spring", uses = {IncidentMapper.class})
public interface ItemMapper extends EntityMapper<ItemDTO, Item> {

    @Mapping(source = "incident.id", target = "incidentId")
    @Mapping(source = "incident.incidentName", target = "incidentIncidentName")
    ItemDTO toDto(Item item);

    @Mapping(source = "incidentId", target = "incident")
    Item toEntity(ItemDTO itemDTO);

    default Item fromId(Long id) {
        if (id == null) {
            return null;
        }
        Item item = new Item();
        item.setId(id);
        return item;
    }
}
