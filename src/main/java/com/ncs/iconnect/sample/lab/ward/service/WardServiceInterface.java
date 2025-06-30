package com.ncs.iconnect.sample.lab.ward.service;
import com.ncs.iconnect.sample.lab.ward.domain.WardDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import com.ncs.iconnect.sample.lab.ward.domain.Ward;
public interface WardServiceInterface {
    public Page<WardDTO> findAll(Pageable pageable);
    public Page<WardDTO> search(String wardName, Pageable page);
    public Ward add(Ward entity);
    public WardDTO find(Long id);
    public Ward update(Ward entity);
    public void delete(Long id);
}
