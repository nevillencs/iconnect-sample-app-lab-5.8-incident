package com.ncs.iconnect.sample.lab.bed.service;
import com.ncs.iconnect.sample.lab.bed.domain.CreateBedDTO;
import com.ncs.iconnect.sample.lab.bed.repository.BedRepository;
import com.ncs.iconnect.sample.lab.ward.repository.WardRepository;
import com.ncs.iconnect.sample.lab.bed.service.BedService;
import com.ncs.iconnect.sample.lab.ward.domain.Ward;
import com.ncs.iconnect.sample.lab.ward.domain.WardDTO;
import org.checkerframework.checker.nullness.Opt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import com.ncs.iconnect.sample.lab.bed.domain.Bed;
import com.ncs.iconnect.sample.lab.bed.domain.BedDTO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityExistsException;
import javax.persistence.EntityNotFoundException;
import java.util.Optional;

@Service
@Transactional
public class BedService implements BedServiceInterface {

    private final Logger log = LoggerFactory.getLogger(BedService.class);
    private final BedRepository bedRepository;
    private final WardRepository wardRepository;
    public BedService(BedRepository bedRepository, WardRepository wardRepository) {
        this.bedRepository = bedRepository;
        this.wardRepository = wardRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public Page<BedDTO> findAll(Pageable pageable) {
        return bedRepository.findAll(pageable).map(this::toDto);
    }

    @Override
    public Page<BedDTO> search(String bedName, Pageable pageable) {
        return bedRepository.findByBedName(bedName, pageable).map(this::toDto);
    }

    @Override
    public BedDTO add(CreateBedDTO bedDto) {
        Ward ward = wardRepository.findByWardName(bedDto.getWardName())
            .orElseThrow(() -> new EntityNotFoundException("Ward not found. Check upstream ward names validation."));

        Optional<Bed> existingBed = bedRepository.findByBedReferenceId(bedDto.getBedReferenceId());
        if (existingBed.isPresent()) {
            throw new EntityExistsException(String.format(
                "Bed Reference ID in use for '%s' '%s'",
                existingBed.get().getWard().getWardReferenceId(),
                existingBed.get().getWard().getWardName()));
        }
        existingBed = bedRepository.findByBedName(bedDto.getBedName());
        if (bedRepository.findByBedName(bedDto.getBedName()).isPresent()) {
            throw new EntityExistsException(String.format(
                "Bed Name in use for '%s' '%s'",
                existingBed.get().getWard().getWardReferenceId(),
                existingBed.get().getWard().getWardName()));
        }
        Bed entity = toEntity(bedDto);
        return toDto(bedRepository.save(entity));
    }

    @Override
    public BedDTO update(CreateBedDTO bedDto) {
        Ward ward = wardRepository.findByWardName(bedDto.getWardName())
            .orElseThrow(() -> new EntityNotFoundException("Ward not found. Check upstream ward names validation."));

        Bed oldBed = bedRepository.findById(bedDto.getId())
            .orElseThrow(() -> new EntityNotFoundException("Bed not found with id: " + bedDto.getId()));

        Optional<Bed> duplicateBed = bedRepository.findByBedReferenceId(bedDto.getBedReferenceId());
        if (duplicateBed.isPresent() && !duplicateBed.get().getId().equals(bedDto.getId())) {
            throw new EntityExistsException(String.format(
                "Bed Reference ID in use for '%s' '%s'",
                duplicateBed.get().getWard().getWardReferenceId(),
                duplicateBed.get().getWard().getWardName()));
        }
        duplicateBed = bedRepository.findByBedName(bedDto.getBedName());
        if (duplicateBed.isPresent() && !duplicateBed.get().getId().equals(bedDto.getId())) {
            throw new EntityExistsException(String.format(
                "Bed Name in use for '%s' '%s'",
                duplicateBed.get().getWard().getWardReferenceId(),
                duplicateBed.get().getWard().getWardName()));
        }
        oldBed.setBedName(bedDto.getBedName());
        oldBed.setWardAllocationDate(bedDto.getWardAllocationDate());
        oldBed.setWard(ward);
        return toDto(bedRepository.save(oldBed));
    }

    @Override
    @Transactional(readOnly = true)
    public BedDTO find(Long id) {
        Optional<Bed> bed = bedRepository.findById(id);
        if (bed.isPresent()) {
            return toDto(bed.get());
        } else {
            throw new EntityNotFoundException("Bed not found with id: " + id);
        }
    }

    @Override
    @Transactional
    public void delete(Long id) {
        Bed bed = bedRepository.findById(id)
            .orElseThrow(() -> new EntityNotFoundException(String.format("Bed with ID %s does not exist", id)));
        Ward ward = bed.getWard();
        if (ward != null) {
            ward.getBeds().remove(bed);
        }
        bedRepository.delete(bed);
    }

    private BedDTO toDto(Bed bed) {
        BedDTO dto = new BedDTO();
        dto.setId(bed.getId());
        dto.setBedReferenceId(bed.getBedReferenceId());
        dto.setBedName(bed.getBedName());
        dto.setWardAllocationDate(bed.getWardAllocationDate());
        if (bed.getWard() != null) {
            dto.setWardName(bed.getWard().getWardName());
            dto.setWardClassType(bed.getWard().getWardClassType());
            dto.setWardLocation(bed.getWard().getWardLocation());
        }
        return dto;
    }
    private Bed toEntity(CreateBedDTO dto) {
        Bed bed = new Bed();
        bed.setBedReferenceId(dto.getBedReferenceId());
        bed.setBedName(dto.getBedName());
        bed.setWardAllocationDate(dto.getWardAllocationDate());
        if (dto.getWardName() != null) {
            Optional<Ward> wardOpt = wardRepository.findByWardName(dto.getWardName());
            wardOpt.ifPresent(bed::setWard);
        }
        return bed;
    }
}
