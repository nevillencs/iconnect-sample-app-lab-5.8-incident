package com.ncs.iconnect.sample.lab.bed.web.rest;
import com.ncs.iconnect.sample.lab.bed.domain.Bed;
import com.ncs.iconnect.sample.lab.bed.domain.BedDTO;
import com.ncs.iconnect.sample.lab.bed.domain.CreateBedDTO;
import com.ncs.iconnect.sample.lab.bed.service.BedService;
import com.ncs.iconnect.sample.lab.generated.web.rest.util.HeaderUtil;
import com.ncs.iconnect.sample.lab.generated.web.rest.util.PaginationUtil;
import io.swagger.annotations.ApiParam;
import io.github.jhipster.web.util.ResponseUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityExistsException;
import javax.persistence.EntityNotFoundException;
import javax.validation.Valid;
import java.net.URI;
import java.net.URISyntaxException;

import java.util.List;
import java.util.Optional;

/**
 * REST controller for managing Bed.
 */
@RestController
@RequestMapping("/api")
public class BedResource {

    private final Logger log = LoggerFactory.getLogger(BedResource.class);

    private static final String ENTITY_NAME = "bed";

    private final BedService bedService;

    public BedResource(BedService bedService) {
        this.bedService = bedService;
    }

    /**
     * GET  /beds : get all the beds.
     *
     * @param pageable the pagination information
     * @return the ResponseEntity with status 200 (OK) and the list of beds in body
     */
    @GetMapping("/beds")
    public ResponseEntity<List<BedDTO>> getAllBeds(@ApiParam Pageable pageable) {
        log.debug("REST request to get a page of Beds");
        Page<BedDTO> page = bedService.findAll(pageable);
        HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(page, "/api/beds");
        return new ResponseEntity<>(page.getContent(), headers, HttpStatus.OK);
    }

    /**
     * GET  /beds/:id : get the "id" bed.
     *
     * @param id the id of the bed to retrieve
     * @return the ResponseEntity with status 200 (OK) and with body the bed, or with status 404 (Not Found)
     */
    @GetMapping("/beds/{id}")
    public ResponseEntity<BedDTO> getBed(@PathVariable Long id) {
        log.debug("REST request to get Bed : {}", id);
        try {
            BedDTO bed = bedService.find(id);
            return ResponseEntity.ok(bed);
        } catch (EntityNotFoundException ex) {
            return ResponseEntity.notFound().build();
        }
    }

    /**
     * POST  /beds : Create a new bed.
     *
     * @param bed the bed to create
     * @return the ResponseEntity with status 201 (Created) and with body the new bed, or with status 400 (Bad Request) if the bed has already an ID
     * @throws URISyntaxException if the Location URI syntax is incorrect
     */
    @PostMapping("/beds")
    public ResponseEntity<BedDTO> createBed(@Valid @RequestBody CreateBedDTO bed) throws URISyntaxException {
        log.debug("REST request to save Bed : {}", bed);
        try {
            BedDTO result = bedService.add(bed);
            return ResponseEntity.created(new URI("/api/beds/" + result.getId()))
                .headers(HeaderUtil.createEntityCreationAlert(ENTITY_NAME, result.getId().toString()))
                .body(result);
        }
        catch (EntityExistsException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT)
                .headers(HeaderUtil.createFailureAlert(ENTITY_NAME, "entityexists", e.getMessage()))
                .body(null);
        }
    }

    /**
     * PUT  /beds : Updates an existing bed.
     *
     * @param bed the bed to update
     * @return the ResponseEntity with status 200 (OK) and with body the updated bed,
     * or with status 400 (Bad Request) if the bed is not valid,
     * or with status 500 (Internal Server Error) if the bed couldn't be updated
     * @throws URISyntaxException if the Location URI syntax is incorrect
     */
    @PutMapping("/beds")
    public ResponseEntity<BedDTO> updateBed(@Valid @RequestBody CreateBedDTO bed) throws URISyntaxException {
        log.debug("REST request to update Bed : {}", bed);
        if (bed.getBedReferenceId() == null) {
            return createBed(bed);
        }
        try {
            BedDTO result = bedService.update(bed);
            return ResponseEntity.ok()
                .headers(HeaderUtil.createEntityUpdateAlert(ENTITY_NAME, result.getId().toString()))
                .body(result);
        }
        catch (EntityExistsException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT)
                .headers(HeaderUtil.createFailureAlert(ENTITY_NAME, "entityexists", e.getMessage()))
                .body(null);
        }
    }

    /**
     * DELETE  /beds/:id : delete the "id" bed.
     *
     * @param id the id of the bed to delete
     * @return the ResponseEntity with status 200 (OK)
     */
    @DeleteMapping("/beds/{id}")
    public ResponseEntity<Void> deleteBed(@PathVariable Long id) {
        log.debug("REST request to delete Bed : {}", id);
        bedService.delete(id);
        return ResponseEntity.ok().headers(HeaderUtil.createEntityDeletionAlert(ENTITY_NAME, id.toString())).build();
    }

    @GetMapping("/beds/search")
    public ResponseEntity<List<BedDTO>> searchBeds(@RequestParam String query, @ApiParam Pageable pageable) {
        log.debug("REST request to search for a page of Beds for query {}", query);
        Page<BedDTO> page = bedService.search(query, pageable);
        HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(page, "/beds/search");
        return new ResponseEntity<>(page.getContent(), headers, HttpStatus.OK);
    }
}
