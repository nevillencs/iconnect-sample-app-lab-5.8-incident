package com.ncs.iconnect.sample.lab.ward.service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import com.ncs.iconnect.sample.lab.ward.domain.Ward;
public interface WardServiceInterface {
    public Page<Ward> findAll(Pageable pageable);
    public Ward find(Long id);
    public Ward add(Ward entity);
    public Ward update(Ward entity);
    public void delete(Long id);
    public Page<Ward> search(String wardName, Pageable page);
}
