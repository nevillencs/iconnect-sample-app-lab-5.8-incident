package com.ncs.iconnect.sample.lab.bed.service;
import com.ncs.iconnect.sample.lab.bed.domain.BedDTO;
import com.ncs.iconnect.sample.lab.bed.domain.CreateBedDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import com.ncs.iconnect.sample.lab.bed.domain.Bed;
public interface BedServiceInterface {
    public Page<BedDTO> findAll(Pageable pageable);
    public Page<BedDTO> search(String wardName, Pageable page);
    public BedDTO add(CreateBedDTO entity);
    public BedDTO find(Long id);
    public BedDTO update(CreateBedDTO entity);
    public void delete(Long id);
}
