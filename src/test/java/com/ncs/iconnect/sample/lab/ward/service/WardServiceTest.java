package com.ncs.iconnect.sample.lab.ward.service;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.ArrayList;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import com.ncs.iconnect.sample.lab.ward.domain.Ward;
import com.ncs.iconnect.sample.lab.ward.repository.WardRepository;

public class WardServiceTest {

    WardService wardService;
    WardRepository wardRepository = mock(WardRepository.class);

    @BeforeEach
    public void init() {
        wardService = new WardService(wardRepository);
    }

    @Test
    public void testFindAllWardsExpectSuccess(){
        Pageable page = PageRequest.of(0, 10);
        when(wardRepository.findAll(page)).thenReturn(prepareSearchResults(page));
        Page<Ward> searchResults = wardService.findAll(page);
        verify(wardRepository, times(1)).findAll(page);
    }

    private Ward prepareWard() {
        Ward ward = new Ward();
        ward.setWardReferenceId("WRD001");
        ward.setWardName("Alpha");
        ward.setWardClassType("General");
        ward.setWardLocation("East Wing");
        return ward;
    }

    private Page<Ward> prepareSearchResults(Pageable page) {
        return new PageImpl<Ward>(Arrays.asList(prepareWard()), page, 1);
    }
}
