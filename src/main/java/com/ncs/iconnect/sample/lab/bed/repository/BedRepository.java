package com.ncs.iconnect.sample.lab.bed.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ncs.iconnect.sample.lab.bed.domain.Bed;

import java.util.Optional;

/**
 * Spring Data JPA repository for the Ward entity.
 */
@SuppressWarnings("unused")
@Repository
public interface BedRepository extends JpaRepository<Bed, Long> {
    @Query("FROM Bed t  WHERE " + "LOWER(t.bedName) LIKE LOWER(CONCAT('%',:bedName, '%'))")
    public Page<Bed> findByBedName(@Param("bedName") String bedName, Pageable page);
    Optional<Bed> findByBedReferenceId(String bedReferenceId);
    Optional<Bed> findByBedName(String bedName);
}
