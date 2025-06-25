package com.ncs.iconnect.sample.lab.ward.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.ncs.iconnect.sample.lab.ward.domain.Ward;
import java.util.Optional;

/**
 * Spring Data JPA repository for the Ward entity.
 */
@SuppressWarnings("unused")
@Repository
public interface WardRepository extends JpaRepository<Ward, Long> {
    @Query("FROM Ward t  WHERE " + "LOWER(t.wardName) LIKE LOWER(CONCAT('%',:wardName, '%'))")
    public Page<Ward> findByWardName(@Param("wardName") String wardName, Pageable page);
    Optional<Ward> findByWardReferenceId(String wardReferenceId);
    Optional<Ward> findByWardName(String wardReferenceId);
}
