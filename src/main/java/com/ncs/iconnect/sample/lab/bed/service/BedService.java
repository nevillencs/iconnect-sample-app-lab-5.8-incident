package com.ncs.iconnect.sample.lab.bed.service;
import com.ncs.iconnect.sample.lab.bed.repository.BedRepository;
import com.ncs.iconnect.sample.lab.ward.repository.WardRepository;
import com.ncs.iconnect.sample.lab.bed.service.BedService;
import com.ncs.iconnect.sample.lab.ward.domain.Ward;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import com.ncs.iconnect.sample.lab.bed.domain.Bed;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    public Page<Bed> findAll(Pageable pageable) {
        return bedRepository.findAll(pageable);
    }

    @Override
    public Page<Bed> search(String bedName, Pageable page) {
        return bedRepository.findByBedName(bedName, page);
    }

    @Override
    public Bed add(Bed entity) {
        if (entity.getBedReferenceId() == null) {
            return null;
        }
        else if (entity.getBedName() == null) {
            return null;
        }
        Ward ward = entity.getWard();
        if (ward == null) {
            throw new EntityNotFoundException("Ward does not exist.");
        }
        return bedRepository.save(entity);
    }

    @Override
    @Transactional(readOnly = true)
    public Bed find(Long id) {
        Optional<Bed> bed = bedRepository.findById(id);
        if (bed.isPresent()) {
            return bed.get();
        } else {
            throw new EntityNotFoundException("Bed not found with id: " + id);
        }
    }
    @Override
    public Bed update(Bed entity) {
        if (entity.getBedReferenceId() == null) {
            return null;
        }
        else if (entity.getBedName() == null) {
            return null;
        }
        return bedRepository.save(entity);
    }

    @Override
    public void delete(Long id) {
        Bed bed = bedRepository.getOne(id);
        if (bed != null) {
            bedRepository.delete(bed);
        }
    }
}
