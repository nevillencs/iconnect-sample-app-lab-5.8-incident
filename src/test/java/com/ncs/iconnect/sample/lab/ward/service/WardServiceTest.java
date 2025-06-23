package com.ncs.iconnect.sample.lab.ward.service;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.ArrayList;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import com.ncs.iconnect.sample.lab.ward.domain.Ward;
import com.ncs.iconnect.sample.lab.ward.repository.WardRepository;

import static org.mockito.Mockito.*;

public class WardServiceTest {

    WardService wardService;
    WardRepository wardRepository = mock(WardRepository.class);

    @BeforeEach
    public void init() {
        wardService = new WardService(wardRepository);
    }

    @Test
    public void testFindAllCallsRepository(){
        Pageable page = PageRequest.of(0, 10);
        when(wardRepository.findAll(page)).thenReturn(prepareSearchResults(page));
        Page<Ward> searchResults = wardService.findAll(page);
        verify(wardRepository, times(1)).findAll(page);
    }

    @Test
    public void testSearchCallsRepository(){
        Pageable page = PageRequest.of(0, 10);
        String wardNameQuery = "Alp";
        when(wardRepository.findByWardName(wardNameQuery, page)).thenReturn(prepareSearchResults(page));
        Page<Ward> searchResults = wardService.search(wardNameQuery, page);
        verify(wardRepository, times(1)).findByWardName(wardNameQuery, page);
    }

   @Test
   public void testAddCallsRepository(){
        Ward ward = prepareWard();
        when(wardRepository.save(ward)).thenReturn(ward);
        Ward wardResult = wardService.add(ward);
        verify(wardRepository, times(1)).save(ward);
   }
    @Test
    public void testUpdateCallsRepository(){
        Ward ward = prepareWard();
        when(wardRepository.save(ward)).thenReturn(ward);
        Ward wardResult = wardService.update(ward);
        verify(wardRepository, times(1)).save(ward);
    }
    @Test
    public void testDeleteCallsRepository(){
        Ward ward = prepareWard();
        when(wardRepository.getOne(ward.getId())).thenReturn(ward);
        wardService.delete(ward.getId());
        verify(wardRepository, times(1)).delete(ward);
    }
    @Test
    public void testDeleteNullCallsRepository(){
        Ward ward = prepareWard();
        when(wardRepository.getOne(ward.getId())).thenReturn(null);
        assertDoesNotThrow(() -> wardService.delete(ward.getId()));
        verify(wardRepository, times(1)).getOne(ward.getId());
        verify(wardRepository, never()).delete(any(Ward.class));
        verifyNoMoreInteractions(wardRepository);
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
