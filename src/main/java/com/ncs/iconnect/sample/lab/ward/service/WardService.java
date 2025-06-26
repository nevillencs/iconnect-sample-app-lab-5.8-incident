package com.ncs.iconnect.sample.lab.ward.service;

import com.ncs.iconnect.sample.lab.bed.domain.Bed;
import com.ncs.iconnect.sample.lab.bed.domain.BedDTO;
import com.ncs.iconnect.sample.lab.ward.domain.WardDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.ncs.iconnect.sample.lab.ward.domain.Ward;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ncs.iconnect.sample.lab.ward.repository.WardRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.Optional;
import java.util.List;
import javax.persistence.EntityNotFoundException;
import javax.persistence.EntityExistsException;

@Service
@Transactional
public class WardService implements WardServiceInterface{
    private final Logger log = LoggerFactory.getLogger(WardService.class);
    private final WardRepository wardRepository;
    public WardService(WardRepository wardRepository) {
        this.wardRepository = wardRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public Page<WardDTO> findAll(Pageable pageable) {
        Page<Ward> wards = wardRepository.findAll(pageable);
        return wards.map(this::toDto);
    }
    @Override
    public Page<WardDTO> search(String wardName, Pageable pageable) {
        Page<Ward> wards = wardRepository.findByWardName(wardName, pageable);
        return wards.map(this::toDto);
    }
    @Override
    public Ward add(Ward entity) {
        if (entity.getWardReferenceId() == null) {
            return null;
        }
        else if (entity.getWardName() == null) {
            return null;
        }
        if (wardRepository.findByWardReferenceId(entity.getWardReferenceId()).isPresent()) {
            throw new EntityExistsException("Ward Reference ID in use");
        }
        else if (wardRepository.findByWardName(entity.getWardName()).isPresent()) {
            throw new EntityExistsException("Ward Name in use");
        }
        return wardRepository.save(entity);
    }
    @Override
    @Transactional(readOnly = true)
    public Ward find(Long id) {
        Optional<Ward> ward = wardRepository.findById(id);
        if (ward.isPresent()) {
            return ward.get();
        } else {
            throw new EntityNotFoundException("Ward not found with id: " + id);
        }
    }
    @Override
    public Ward update(Ward entity) {
        if (entity.getWardReferenceId() == null) {
            return null;
        }
        else if (entity.getWardName() == null) {
            return null;
        }
        if (wardRepository.findByWardReferenceId(entity.getWardReferenceId()).isPresent()) {
            throw new EntityExistsException("Ward Reference ID in use");
        }
        return wardRepository.save(entity);
    }

    @Override
    public void delete(Long id) {
        Ward ward = wardRepository.getOne(id);
        if (ward != null) {
            wardRepository.delete(ward);
        }
    }
    private BedDTO toBedDto(Bed bed) {
        BedDTO bedDto = new BedDTO();
        bedDto.setId(bed.getId());
        bedDto.setBedReferenceId(bed.getBedReferenceId());
        bedDto.setBedName(bed.getBedName());
        bedDto.setWardAllocationDate(bed.getWardAllocationDate());

        bedDto.setWardName(bed.getWard().getWardName());
        bedDto.setWardClassType(bed.getWard().getWardClassType());
        bedDto.setWardLocation(bed.getWard().getWardLocation());
        return bedDto;
    }
    private WardDTO toDto(Ward ward) {
        WardDTO dto = new WardDTO();
        dto.setId(ward.getId());
        dto.setWardReferenceId(ward.getWardReferenceId());
        dto.setWardName(ward.getWardName());
        dto.setWardClassType(ward.getWardClassType());
        dto.setWardLocation(ward.getWardLocation());
        List<BedDTO> bedDTOs = ward.getBeds().stream()
            .map(this::toBedDto)
            .collect(java.util.stream.Collectors.toList());
        dto.setBeds(bedDTOs);
        return dto;
    }
}
