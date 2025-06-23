package com.ncs.iconnect.sample.lab.generated.repository;

import com.ncs.iconnect.sample.lab.generated.domain.Item;

import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;

/**
 * Spring Data  repository for the Item entity.
 */
@SuppressWarnings("unused")
@Repository
public interface ItemRepository extends JpaRepository<Item, Long>, JpaSpecificationExecutor<Item> {
}
