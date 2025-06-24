package com.ncs.iconnect.sample.lab.bed.service;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.ArrayList;

import com.ncs.iconnect.sample.lab.ward.domain.Ward;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import com.ncs.iconnect.sample.lab.bed.domain.Bed;
import com.ncs.iconnect.sample.lab.bed.repository.BedRepository;

import static org.mockito.Mockito.*;

public class BedServiceTest {

    BedService bedService;
    BedRepository bedRepository = mock(BedRepository.class);

    @BeforeEach
    public void init() {
        bedService = new BedService(bedRepository);
    }

    @Test
    public void testFindAllCallsRepository(){
        Pageable page = PageRequest.of(0, 10);
        when(bedRepository.findAll(page)).thenReturn(prepareSearchResults(page));
        Page<Bed> searchResults = bedService.findAll(page);
        verify(bedRepository, times(1)).findAll(page);
    }

    @Test
    public void testSearchCallsRepository(){
        Pageable page = PageRequest.of(0, 10);
        String bedNameQuery = "Alp";
        when(bedRepository.findByBedName(bedNameQuery, page)).thenReturn(prepareSearchResults(page));
        Page<Bed> searchResults = bedService.search(bedNameQuery, page);
        verify(bedRepository, times(1)).findByBedName(bedNameQuery, page);
    }

    @Test
    public void testAddCallsRepository(){
        Bed bed = prepareBed();
        when(bedRepository.save(bed)).thenReturn(bed);
        Bed bedResult = bedService.add(bed);
        verify(bedRepository, times(1)).save(bed);
    }
    @Test
    public void testUpdateCallsRepository(){
        Bed bed = prepareBed();
        when(bedRepository.save(bed)).thenReturn(bed);
        Bed bedResult = bedService.update(bed);
        verify(bedRepository, times(1)).save(bed);
    }
    @Test
    public void testDeleteCallsRepository(){
        Bed bed = prepareBed();
        when(bedRepository.getOne(bed.getId())).thenReturn(bed);
        bedService.delete(bed.getId());
        verify(bedRepository, times(1)).delete(bed);
    }
    @Test
    public void testDeleteNullCallsRepository(){
        Bed bed = prepareBed();
        when(bedRepository.getOne(bed.getId())).thenReturn(null);
        assertDoesNotThrow(() -> bedService.delete(bed.getId()));
        verify(bedRepository, times(1)).getOne(bed.getId());
        verify(bedRepository, never()).delete(any(Bed.class));
        verifyNoMoreInteractions(bedRepository);
    }
    private Bed prepareBed() {
        Ward ward = new Ward();
        ward.setWardReferenceId("WRD001");
        ward.setWardName("Alpha");
        ward.setWardClassType("General");
        ward.setWardLocation("East Wing");

        Bed bed = new Bed();
        bed.setBedReferenceId("WRD001");
        bed.setBedName("Alpha");
        bed.setWard(ward);
        bed.setWardAllocationDate(LocalDate.now());
        return bed;
    }

    private Page<Bed> prepareSearchResults(Pageable page) {
        return new PageImpl<Bed>(Arrays.asList(prepareBed()), page, 1);
    }
}
