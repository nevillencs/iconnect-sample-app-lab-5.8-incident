package com.ncs.iconnect.sample.lab.bed.service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import com.ncs.iconnect.sample.lab.bed.domain.Bed;
public interface BedServiceInterface {
    public Page<Bed> findAll(Pageable pageable);
    public Page<Bed> search(String wardName, Pageable page);
    public Bed add(Bed entity);
    public Bed find(Long id);
    public Bed update(Bed entity);
    public void delete(Long id);

}
