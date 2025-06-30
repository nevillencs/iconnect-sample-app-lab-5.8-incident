package com.ncs.iconnect.sample.lab.ward.web.rest;
import com.ncs.iconnect.sample.lab.ward.domain.Ward;
import com.ncs.iconnect.sample.lab.ward.domain.WardDTO;
import com.ncs.iconnect.sample.lab.ward.service.WardService;
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

import javax.persistence.EntityNotFoundException;
import javax.persistence.EntityExistsException;
import javax.validation.Valid;
import java.net.URI;
import java.net.URISyntaxException;

import java.util.List;
import java.util.Map;

/**
 * REST controller for managing Ward.
 */
@RestController
@RequestMapping("/api")
public class WardResource {

    private final Logger log = LoggerFactory.getLogger(WardResource.class);

    private static final String ENTITY_NAME = "ward";

    private final WardService wardService;

    public WardResource(WardService wardService) {
        this.wardService = wardService;
    }

    /**
     * POST  /wards : Create a new ward.
     *
     * @param ward the ward to create
     * @return the ResponseEntity with status 201 (Created) and with body the new ward, or with status 400 (Bad Request) if the ward has already an ID
     * @throws URISyntaxException if the Location URI syntax is incorrect
     */
    @PostMapping("/wards")
    public ResponseEntity<Ward> createWard(@Valid @RequestBody Ward ward) throws URISyntaxException {
        log.debug("REST request to save Ward : {}", ward);
        if (ward.getId() != null) {
            return ResponseEntity.badRequest().headers(HeaderUtil.createFailureAlert(ENTITY_NAME, "idexists", "A new ward cannot already have an ID")).body(null);
        }
        try {
            Ward result = wardService.add(ward);
            return ResponseEntity.created(new URI("/api/wards/" + result.getId()))
                .headers(HeaderUtil.createEntityCreationAlert(ENTITY_NAME, result.getId().toString()))
                .body(result);
        } catch (EntityExistsException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT)
                .headers(HeaderUtil.createFailureAlert(ENTITY_NAME, "entityexists", "Ward Reference ID in use"))
                .body(null);
        }
    }

    /**
     * PUT  /wards : Updates an existing ward.
     *
     * @param ward the ward to update
     * @return the ResponseEntity with status 200 (OK) and with body the updated ward,
     * or with status 400 (Bad Request) if the ward is not valid,
     * or with status 500 (Internal Server Error) if the ward couldn't be updated
     * @throws URISyntaxException if the Location URI syntax is incorrect
     */
    @PutMapping("/wards")
    public ResponseEntity<Ward> updateWard(@Valid @RequestBody Ward ward) throws URISyntaxException {
        log.debug("REST request to update Ward : {}", ward);
        if (ward.getId() == null) {
            return createWard(ward);
        }
        try {
            Ward result = wardService.update(ward);
            return ResponseEntity.ok()
                .headers(HeaderUtil.createEntityUpdateAlert(ENTITY_NAME, ward.getId().toString()))
                .body(result);
        } catch (EntityExistsException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT)
                .headers(HeaderUtil.createFailureAlert(ENTITY_NAME, "entityexists", "Ward Reference ID in use"))
                .body(null);
        }
    }

    /**
     * GET  /wards : get all the wards.
     *
     * @param pageable the pagination information
     * @return the ResponseEntity with status 200 (OK) and the list of wards in body
     */
    @GetMapping("/wards")
    public ResponseEntity<List<WardDTO>> getAllWards(@ApiParam Pageable pageable) {
        log.debug("REST request to get a page of Wards");
        Page<WardDTO> page = wardService.findAll(pageable);
        HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(page, "/api/wards");
        return new ResponseEntity<>(page.getContent(), headers, HttpStatus.OK);
    }

    /**
     * GET  /wards/:id : get the "id" ward.
     *
     * @param id the id of the ward to retrieve
     * @return the ResponseEntity with status 200 (OK) and with body the ward, or with status 404 (Not Found)
     */
    @GetMapping("/wards/{id}")
    public ResponseEntity<WardDTO> getWard(@PathVariable Long id) {
        log.debug("REST request to get Ward : {}", id);
        try {
            WardDTO ward = wardService.find(id);
            return ResponseEntity.ok(ward);
        } catch (EntityNotFoundException ex) {
            return ResponseEntity.notFound().build();
        }
    }

    /**
     * DELETE  /wards/:id : delete the "id" ward.
     *
     * @param id the id of the ward to delete
     * @return the ResponseEntity with status 200 (OK)
 */
    @DeleteMapping("/wards/{id}")
    public ResponseEntity<Void> deleteWard(@PathVariable Long id) {
        log.debug("REST request to delete Ward : {}", id);
        wardService.delete(id);
        return ResponseEntity.ok().headers(HeaderUtil.createEntityDeletionAlert(ENTITY_NAME, id.toString())).build();
    }

    @GetMapping("/wards/search")
    public ResponseEntity<List<WardDTO>> searchWards(@RequestParam String query, @ApiParam Pageable pageable) {
        log.debug("REST request to search for a page of Wards for query {}", query);
        Page<WardDTO> page = wardService.search(query, pageable);
        HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(page, "/wards/search");
        return new ResponseEntity<>(page.getContent(), headers, HttpStatus.OK);
    }
}
