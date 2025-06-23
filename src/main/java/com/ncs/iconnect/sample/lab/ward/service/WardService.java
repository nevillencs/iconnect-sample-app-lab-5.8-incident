package com.ncs.iconnect.sample.lab.ward.service;

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
    public Page<Ward> findAll(Pageable pageable) {
        return null;
    }

    @Override
    public Ward find(Long id) {
        return null;
    }

    @Override
    public Ward add(Ward entity) {
        return null;
    }

    @Override
    public Ward update(Ward entity) {
        return null;
    }

    @Override
    public void delete(Long id) {

    }

    @Override
    public Page<Ward> search(String wardName, Pageable page) {
        return null;
    }
}
