package com.ncs.iconnect.sample.lab.generated.web.rest;

import com.ncs.iconnect.sample.lab.generated.IconnectSampleAppLabApp;
import com.ncs.iconnect.sample.lab.generated.domain.Incident;
import com.ncs.iconnect.sample.lab.generated.domain.Item;
import com.ncs.iconnect.sample.lab.generated.repository.IncidentRepository;
import com.ncs.iconnect.sample.lab.generated.service.IncidentService;
import com.ncs.iconnect.sample.lab.generated.service.dto.IncidentDTO;
import com.ncs.iconnect.sample.lab.generated.service.mapper.IncidentMapper;
import com.ncs.iconnect.sample.lab.generated.service.dto.IncidentCriteria;
import com.ncs.iconnect.sample.lab.generated.service.IncidentQueryService;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;
import javax.persistence.EntityManager;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import com.ncs.iconnect.sample.lab.generated.domain.enumeration.IncidentStatus;
/**
 * Integration tests for the {@link IncidentResource} REST controller.
 */
@SpringBootTest(classes = IconnectSampleAppLabApp.class)

@AutoConfigureMockMvc
@WithMockUser
public class IncidentResourceIT {

    private static final String DEFAULT_INCIDENT_REFERENCE_ID = "INC_04";
    private static final String UPDATED_INCIDENT_REFERENCE_ID = "INC_01";

    private static final String DEFAULT_INCIDENT_NAME = "AAAAAAAAAA";
    private static final String UPDATED_INCIDENT_NAME = "BBBBBBBBBB";

    private static final IncidentStatus DEFAULT_INCIDENT_STATUS = IncidentStatus.Pending;
    private static final IncidentStatus UPDATED_INCIDENT_STATUS = IncidentStatus.Active;

    private static final LocalDate DEFAULT_INCIDENT_DATE = LocalDate.ofEpochDay(0L);
    private static final LocalDate UPDATED_INCIDENT_DATE = LocalDate.now(ZoneId.systemDefault());
    private static final LocalDate SMALLER_INCIDENT_DATE = LocalDate.ofEpochDay(-1L);

    @Autowired
    private IncidentRepository incidentRepository;

    @Autowired
    private IncidentMapper incidentMapper;

    @Autowired
    private IncidentService incidentService;

    @Autowired
    private IncidentQueryService incidentQueryService;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restIncidentMockMvc;

    private Incident incident;

    /**
     * Create an entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static Incident createEntity(EntityManager em) {
        Incident incident = new Incident()
            .incidentReferenceId(DEFAULT_INCIDENT_REFERENCE_ID)
            .incidentName(DEFAULT_INCIDENT_NAME)
            .incidentStatus(DEFAULT_INCIDENT_STATUS)
            .incidentDate(DEFAULT_INCIDENT_DATE);
        return incident;
    }
    /**
     * Create an updated entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static Incident createUpdatedEntity(EntityManager em) {
        Incident incident = new Incident()
            .incidentReferenceId(UPDATED_INCIDENT_REFERENCE_ID)
            .incidentName(UPDATED_INCIDENT_NAME)
            .incidentStatus(UPDATED_INCIDENT_STATUS)
            .incidentDate(UPDATED_INCIDENT_DATE);
        return incident;
    }

    @BeforeEach
    public void initTest() {
        incident = createEntity(em);
    }

    @Test
    @Transactional
    public void createIncident() throws Exception {
        int databaseSizeBeforeCreate = incidentRepository.findAll().size();

        // Create the Incident
        IncidentDTO incidentDTO = incidentMapper.toDto(incident);
        restIncidentMockMvc.perform(post("/api/incidents")
            .contentType(MediaType.APPLICATION_JSON)
            .content(TestUtil.convertObjectToJsonBytes(incidentDTO)))
            .andExpect(status().isCreated());

        // Validate the Incident in the database
        List<Incident> incidentList = incidentRepository.findAll();
        assertThat(incidentList).hasSize(databaseSizeBeforeCreate + 1);
        Incident testIncident = incidentList.get(incidentList.size() - 1);
        assertThat(testIncident.getIncidentReferenceId()).isEqualTo(DEFAULT_INCIDENT_REFERENCE_ID);
        assertThat(testIncident.getIncidentName()).isEqualTo(DEFAULT_INCIDENT_NAME);
        assertThat(testIncident.getIncidentStatus()).isEqualTo(DEFAULT_INCIDENT_STATUS);
        assertThat(testIncident.getIncidentDate()).isEqualTo(DEFAULT_INCIDENT_DATE);
    }

    @Test
    @Transactional
    public void createIncidentWithExistingId() throws Exception {
        int databaseSizeBeforeCreate = incidentRepository.findAll().size();

        // Create the Incident with an existing ID
        incident.setId(1L);
        IncidentDTO incidentDTO = incidentMapper.toDto(incident);

        // An entity with an existing ID cannot be created, so this API call must fail
        restIncidentMockMvc.perform(post("/api/incidents")
            .contentType(MediaType.APPLICATION_JSON)
            .content(TestUtil.convertObjectToJsonBytes(incidentDTO)))
            .andExpect(status().isBadRequest());

        // Validate the Incident in the database
        List<Incident> incidentList = incidentRepository.findAll();
        assertThat(incidentList).hasSize(databaseSizeBeforeCreate);
    }


    @Test
    @Transactional
    public void checkIncidentReferenceIdIsRequired() throws Exception {
        int databaseSizeBeforeTest = incidentRepository.findAll().size();
        // set the field null
        incident.setIncidentReferenceId(null);

        // Create the Incident, which fails.
        IncidentDTO incidentDTO = incidentMapper.toDto(incident);

        restIncidentMockMvc.perform(post("/api/incidents")
            .contentType(MediaType.APPLICATION_JSON)
            .content(TestUtil.convertObjectToJsonBytes(incidentDTO)))
            .andExpect(status().isBadRequest());

        List<Incident> incidentList = incidentRepository.findAll();
        assertThat(incidentList).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    public void checkIncidentNameIsRequired() throws Exception {
        int databaseSizeBeforeTest = incidentRepository.findAll().size();
        // set the field null
        incident.setIncidentName(null);

        // Create the Incident, which fails.
        IncidentDTO incidentDTO = incidentMapper.toDto(incident);

        restIncidentMockMvc.perform(post("/api/incidents")
            .contentType(MediaType.APPLICATION_JSON)
            .content(TestUtil.convertObjectToJsonBytes(incidentDTO)))
            .andExpect(status().isBadRequest());

        List<Incident> incidentList = incidentRepository.findAll();
        assertThat(incidentList).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    public void checkIncidentStatusIsRequired() throws Exception {
        int databaseSizeBeforeTest = incidentRepository.findAll().size();
        // set the field null
        incident.setIncidentStatus(null);

        // Create the Incident, which fails.
        IncidentDTO incidentDTO = incidentMapper.toDto(incident);

        restIncidentMockMvc.perform(post("/api/incidents")
            .contentType(MediaType.APPLICATION_JSON)
            .content(TestUtil.convertObjectToJsonBytes(incidentDTO)))
            .andExpect(status().isBadRequest());

        List<Incident> incidentList = incidentRepository.findAll();
        assertThat(incidentList).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    public void checkIncidentDateIsRequired() throws Exception {
        int databaseSizeBeforeTest = incidentRepository.findAll().size();
        // set the field null
        incident.setIncidentDate(null);

        // Create the Incident, which fails.
        IncidentDTO incidentDTO = incidentMapper.toDto(incident);

        restIncidentMockMvc.perform(post("/api/incidents")
            .contentType(MediaType.APPLICATION_JSON)
            .content(TestUtil.convertObjectToJsonBytes(incidentDTO)))
            .andExpect(status().isBadRequest());

        List<Incident> incidentList = incidentRepository.findAll();
        assertThat(incidentList).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    public void getAllIncidents() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList
        restIncidentMockMvc.perform(get("/api/incidents?sort=id,desc"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(incident.getId().intValue())))
            .andExpect(jsonPath("$.[*].incidentReferenceId").value(hasItem(DEFAULT_INCIDENT_REFERENCE_ID)))
            .andExpect(jsonPath("$.[*].incidentName").value(hasItem(DEFAULT_INCIDENT_NAME)))
            .andExpect(jsonPath("$.[*].incidentStatus").value(hasItem(DEFAULT_INCIDENT_STATUS.toString())))
            .andExpect(jsonPath("$.[*].incidentDate").value(hasItem(DEFAULT_INCIDENT_DATE.toString())));
    }
    
    @Test
    @Transactional
    public void getIncident() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get the incident
        restIncidentMockMvc.perform(get("/api/incidents/{id}", incident.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.id").value(incident.getId().intValue()))
            .andExpect(jsonPath("$.incidentReferenceId").value(DEFAULT_INCIDENT_REFERENCE_ID))
            .andExpect(jsonPath("$.incidentName").value(DEFAULT_INCIDENT_NAME))
            .andExpect(jsonPath("$.incidentStatus").value(DEFAULT_INCIDENT_STATUS.toString()))
            .andExpect(jsonPath("$.incidentDate").value(DEFAULT_INCIDENT_DATE.toString()));
    }


    @Test
    @Transactional
    public void getIncidentsByIdFiltering() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        Long id = incident.getId();

        defaultIncidentShouldBeFound("id.equals=" + id);
        defaultIncidentShouldNotBeFound("id.notEquals=" + id);

        defaultIncidentShouldBeFound("id.greaterThanOrEqual=" + id);
        defaultIncidentShouldNotBeFound("id.greaterThan=" + id);

        defaultIncidentShouldBeFound("id.lessThanOrEqual=" + id);
        defaultIncidentShouldNotBeFound("id.lessThan=" + id);
    }


    @Test
    @Transactional
    public void getAllIncidentsByIncidentReferenceIdIsEqualToSomething() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentReferenceId equals to DEFAULT_INCIDENT_REFERENCE_ID
        defaultIncidentShouldBeFound("incidentReferenceId.equals=" + DEFAULT_INCIDENT_REFERENCE_ID);

        // Get all the incidentList where incidentReferenceId equals to UPDATED_INCIDENT_REFERENCE_ID
        defaultIncidentShouldNotBeFound("incidentReferenceId.equals=" + UPDATED_INCIDENT_REFERENCE_ID);
    }

    @Test
    @Transactional
    public void getAllIncidentsByIncidentReferenceIdIsNotEqualToSomething() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentReferenceId not equals to DEFAULT_INCIDENT_REFERENCE_ID
        defaultIncidentShouldNotBeFound("incidentReferenceId.notEquals=" + DEFAULT_INCIDENT_REFERENCE_ID);

        // Get all the incidentList where incidentReferenceId not equals to UPDATED_INCIDENT_REFERENCE_ID
        defaultIncidentShouldBeFound("incidentReferenceId.notEquals=" + UPDATED_INCIDENT_REFERENCE_ID);
    }

    @Test
    @Transactional
    public void getAllIncidentsByIncidentReferenceIdIsInShouldWork() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentReferenceId in DEFAULT_INCIDENT_REFERENCE_ID or UPDATED_INCIDENT_REFERENCE_ID
        defaultIncidentShouldBeFound("incidentReferenceId.in=" + DEFAULT_INCIDENT_REFERENCE_ID + "," + UPDATED_INCIDENT_REFERENCE_ID);

        // Get all the incidentList where incidentReferenceId equals to UPDATED_INCIDENT_REFERENCE_ID
        defaultIncidentShouldNotBeFound("incidentReferenceId.in=" + UPDATED_INCIDENT_REFERENCE_ID);
    }

    @Test
    @Transactional
    public void getAllIncidentsByIncidentReferenceIdIsNullOrNotNull() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentReferenceId is not null
        defaultIncidentShouldBeFound("incidentReferenceId.specified=true");

        // Get all the incidentList where incidentReferenceId is null
        defaultIncidentShouldNotBeFound("incidentReferenceId.specified=false");
    }
                @Test
    @Transactional
    public void getAllIncidentsByIncidentReferenceIdContainsSomething() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentReferenceId contains DEFAULT_INCIDENT_REFERENCE_ID
        defaultIncidentShouldBeFound("incidentReferenceId.contains=" + DEFAULT_INCIDENT_REFERENCE_ID);

        // Get all the incidentList where incidentReferenceId contains UPDATED_INCIDENT_REFERENCE_ID
        defaultIncidentShouldNotBeFound("incidentReferenceId.contains=" + UPDATED_INCIDENT_REFERENCE_ID);
    }

    @Test
    @Transactional
    public void getAllIncidentsByIncidentReferenceIdNotContainsSomething() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentReferenceId does not contain DEFAULT_INCIDENT_REFERENCE_ID
        defaultIncidentShouldNotBeFound("incidentReferenceId.doesNotContain=" + DEFAULT_INCIDENT_REFERENCE_ID);

        // Get all the incidentList where incidentReferenceId does not contain UPDATED_INCIDENT_REFERENCE_ID
        defaultIncidentShouldBeFound("incidentReferenceId.doesNotContain=" + UPDATED_INCIDENT_REFERENCE_ID);
    }


    @Test
    @Transactional
    public void getAllIncidentsByIncidentNameIsEqualToSomething() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentName equals to DEFAULT_INCIDENT_NAME
        defaultIncidentShouldBeFound("incidentName.equals=" + DEFAULT_INCIDENT_NAME);

        // Get all the incidentList where incidentName equals to UPDATED_INCIDENT_NAME
        defaultIncidentShouldNotBeFound("incidentName.equals=" + UPDATED_INCIDENT_NAME);
    }

    @Test
    @Transactional
    public void getAllIncidentsByIncidentNameIsNotEqualToSomething() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentName not equals to DEFAULT_INCIDENT_NAME
        defaultIncidentShouldNotBeFound("incidentName.notEquals=" + DEFAULT_INCIDENT_NAME);

        // Get all the incidentList where incidentName not equals to UPDATED_INCIDENT_NAME
        defaultIncidentShouldBeFound("incidentName.notEquals=" + UPDATED_INCIDENT_NAME);
    }

    @Test
    @Transactional
    public void getAllIncidentsByIncidentNameIsInShouldWork() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentName in DEFAULT_INCIDENT_NAME or UPDATED_INCIDENT_NAME
        defaultIncidentShouldBeFound("incidentName.in=" + DEFAULT_INCIDENT_NAME + "," + UPDATED_INCIDENT_NAME);

        // Get all the incidentList where incidentName equals to UPDATED_INCIDENT_NAME
        defaultIncidentShouldNotBeFound("incidentName.in=" + UPDATED_INCIDENT_NAME);
    }

    @Test
    @Transactional
    public void getAllIncidentsByIncidentNameIsNullOrNotNull() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentName is not null
        defaultIncidentShouldBeFound("incidentName.specified=true");

        // Get all the incidentList where incidentName is null
        defaultIncidentShouldNotBeFound("incidentName.specified=false");
    }
                @Test
    @Transactional
    public void getAllIncidentsByIncidentNameContainsSomething() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentName contains DEFAULT_INCIDENT_NAME
        defaultIncidentShouldBeFound("incidentName.contains=" + DEFAULT_INCIDENT_NAME);

        // Get all the incidentList where incidentName contains UPDATED_INCIDENT_NAME
        defaultIncidentShouldNotBeFound("incidentName.contains=" + UPDATED_INCIDENT_NAME);
    }

    @Test
    @Transactional
    public void getAllIncidentsByIncidentNameNotContainsSomething() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentName does not contain DEFAULT_INCIDENT_NAME
        defaultIncidentShouldNotBeFound("incidentName.doesNotContain=" + DEFAULT_INCIDENT_NAME);

        // Get all the incidentList where incidentName does not contain UPDATED_INCIDENT_NAME
        defaultIncidentShouldBeFound("incidentName.doesNotContain=" + UPDATED_INCIDENT_NAME);
    }


    @Test
    @Transactional
    public void getAllIncidentsByIncidentStatusIsEqualToSomething() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentStatus equals to DEFAULT_INCIDENT_STATUS
        defaultIncidentShouldBeFound("incidentStatus.equals=" + DEFAULT_INCIDENT_STATUS);

        // Get all the incidentList where incidentStatus equals to UPDATED_INCIDENT_STATUS
        defaultIncidentShouldNotBeFound("incidentStatus.equals=" + UPDATED_INCIDENT_STATUS);
    }

    @Test
    @Transactional
    public void getAllIncidentsByIncidentStatusIsNotEqualToSomething() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentStatus not equals to DEFAULT_INCIDENT_STATUS
        defaultIncidentShouldNotBeFound("incidentStatus.notEquals=" + DEFAULT_INCIDENT_STATUS);

        // Get all the incidentList where incidentStatus not equals to UPDATED_INCIDENT_STATUS
        defaultIncidentShouldBeFound("incidentStatus.notEquals=" + UPDATED_INCIDENT_STATUS);
    }

    @Test
    @Transactional
    public void getAllIncidentsByIncidentStatusIsInShouldWork() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentStatus in DEFAULT_INCIDENT_STATUS or UPDATED_INCIDENT_STATUS
        defaultIncidentShouldBeFound("incidentStatus.in=" + DEFAULT_INCIDENT_STATUS + "," + UPDATED_INCIDENT_STATUS);

        // Get all the incidentList where incidentStatus equals to UPDATED_INCIDENT_STATUS
        defaultIncidentShouldNotBeFound("incidentStatus.in=" + UPDATED_INCIDENT_STATUS);
    }

    @Test
    @Transactional
    public void getAllIncidentsByIncidentStatusIsNullOrNotNull() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentStatus is not null
        defaultIncidentShouldBeFound("incidentStatus.specified=true");

        // Get all the incidentList where incidentStatus is null
        defaultIncidentShouldNotBeFound("incidentStatus.specified=false");
    }

    @Test
    @Transactional
    public void getAllIncidentsByIncidentDateIsEqualToSomething() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentDate equals to DEFAULT_INCIDENT_DATE
        defaultIncidentShouldBeFound("incidentDate.equals=" + DEFAULT_INCIDENT_DATE);

        // Get all the incidentList where incidentDate equals to UPDATED_INCIDENT_DATE
        defaultIncidentShouldNotBeFound("incidentDate.equals=" + UPDATED_INCIDENT_DATE);
    }

    @Test
    @Transactional
    public void getAllIncidentsByIncidentDateIsNotEqualToSomething() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentDate not equals to DEFAULT_INCIDENT_DATE
        defaultIncidentShouldNotBeFound("incidentDate.notEquals=" + DEFAULT_INCIDENT_DATE);

        // Get all the incidentList where incidentDate not equals to UPDATED_INCIDENT_DATE
        defaultIncidentShouldBeFound("incidentDate.notEquals=" + UPDATED_INCIDENT_DATE);
    }

    @Test
    @Transactional
    public void getAllIncidentsByIncidentDateIsInShouldWork() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentDate in DEFAULT_INCIDENT_DATE or UPDATED_INCIDENT_DATE
        defaultIncidentShouldBeFound("incidentDate.in=" + DEFAULT_INCIDENT_DATE + "," + UPDATED_INCIDENT_DATE);

        // Get all the incidentList where incidentDate equals to UPDATED_INCIDENT_DATE
        defaultIncidentShouldNotBeFound("incidentDate.in=" + UPDATED_INCIDENT_DATE);
    }

    @Test
    @Transactional
    public void getAllIncidentsByIncidentDateIsNullOrNotNull() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentDate is not null
        defaultIncidentShouldBeFound("incidentDate.specified=true");

        // Get all the incidentList where incidentDate is null
        defaultIncidentShouldNotBeFound("incidentDate.specified=false");
    }

    @Test
    @Transactional
    public void getAllIncidentsByIncidentDateIsGreaterThanOrEqualToSomething() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentDate is greater than or equal to DEFAULT_INCIDENT_DATE
        defaultIncidentShouldBeFound("incidentDate.greaterThanOrEqual=" + DEFAULT_INCIDENT_DATE);

        // Get all the incidentList where incidentDate is greater than or equal to UPDATED_INCIDENT_DATE
        defaultIncidentShouldNotBeFound("incidentDate.greaterThanOrEqual=" + UPDATED_INCIDENT_DATE);
    }

    @Test
    @Transactional
    public void getAllIncidentsByIncidentDateIsLessThanOrEqualToSomething() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentDate is less than or equal to DEFAULT_INCIDENT_DATE
        defaultIncidentShouldBeFound("incidentDate.lessThanOrEqual=" + DEFAULT_INCIDENT_DATE);

        // Get all the incidentList where incidentDate is less than or equal to SMALLER_INCIDENT_DATE
        defaultIncidentShouldNotBeFound("incidentDate.lessThanOrEqual=" + SMALLER_INCIDENT_DATE);
    }

    @Test
    @Transactional
    public void getAllIncidentsByIncidentDateIsLessThanSomething() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentDate is less than DEFAULT_INCIDENT_DATE
        defaultIncidentShouldNotBeFound("incidentDate.lessThan=" + DEFAULT_INCIDENT_DATE);

        // Get all the incidentList where incidentDate is less than UPDATED_INCIDENT_DATE
        defaultIncidentShouldBeFound("incidentDate.lessThan=" + UPDATED_INCIDENT_DATE);
    }

    @Test
    @Transactional
    public void getAllIncidentsByIncidentDateIsGreaterThanSomething() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        // Get all the incidentList where incidentDate is greater than DEFAULT_INCIDENT_DATE
        defaultIncidentShouldNotBeFound("incidentDate.greaterThan=" + DEFAULT_INCIDENT_DATE);

        // Get all the incidentList where incidentDate is greater than SMALLER_INCIDENT_DATE
        defaultIncidentShouldBeFound("incidentDate.greaterThan=" + SMALLER_INCIDENT_DATE);
    }


    @Test
    @Transactional
    public void getAllIncidentsByItemIsEqualToSomething() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);
        Item item = ItemResourceIT.createEntity(em);
        em.persist(item);
        em.flush();
        incident.addItem(item);
        incidentRepository.saveAndFlush(incident);
        Long itemId = item.getId();

        // Get all the incidentList where item equals to itemId
        defaultIncidentShouldBeFound("itemId.equals=" + itemId);

        // Get all the incidentList where item equals to itemId + 1
        defaultIncidentShouldNotBeFound("itemId.equals=" + (itemId + 1));
    }

    /**
     * Executes the search, and checks that the default entity is returned.
     */
    private void defaultIncidentShouldBeFound(String filter) throws Exception {
        restIncidentMockMvc.perform(get("/api/incidents?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(incident.getId().intValue())))
            .andExpect(jsonPath("$.[*].incidentReferenceId").value(hasItem(DEFAULT_INCIDENT_REFERENCE_ID)))
            .andExpect(jsonPath("$.[*].incidentName").value(hasItem(DEFAULT_INCIDENT_NAME)))
            .andExpect(jsonPath("$.[*].incidentStatus").value(hasItem(DEFAULT_INCIDENT_STATUS.toString())))
            .andExpect(jsonPath("$.[*].incidentDate").value(hasItem(DEFAULT_INCIDENT_DATE.toString())));

        // Check, that the count call also returns 1
        restIncidentMockMvc.perform(get("/api/incidents/count?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(content().string("1"));
    }

    /**
     * Executes the search, and checks that the default entity is not returned.
     */
    private void defaultIncidentShouldNotBeFound(String filter) throws Exception {
        restIncidentMockMvc.perform(get("/api/incidents?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$").isArray())
            .andExpect(jsonPath("$").isEmpty());

        // Check, that the count call also returns 0
        restIncidentMockMvc.perform(get("/api/incidents/count?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(content().string("0"));
    }


    @Test
    @Transactional
    public void getNonExistingIncident() throws Exception {
        // Get the incident
        restIncidentMockMvc.perform(get("/api/incidents/{id}", Long.MAX_VALUE))
            .andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    public void updateIncident() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        int databaseSizeBeforeUpdate = incidentRepository.findAll().size();

        // Update the incident
        Incident updatedIncident = incidentRepository.findById(incident.getId()).get();
        // Disconnect from session so that the updates on updatedIncident are not directly saved in db
        em.detach(updatedIncident);
        updatedIncident
            .incidentReferenceId(UPDATED_INCIDENT_REFERENCE_ID)
            .incidentName(UPDATED_INCIDENT_NAME)
            .incidentStatus(UPDATED_INCIDENT_STATUS)
            .incidentDate(UPDATED_INCIDENT_DATE);
        IncidentDTO incidentDTO = incidentMapper.toDto(updatedIncident);

        restIncidentMockMvc.perform(put("/api/incidents")
            .contentType(MediaType.APPLICATION_JSON)
            .content(TestUtil.convertObjectToJsonBytes(incidentDTO)))
            .andExpect(status().isOk());

        // Validate the Incident in the database
        List<Incident> incidentList = incidentRepository.findAll();
        assertThat(incidentList).hasSize(databaseSizeBeforeUpdate);
        Incident testIncident = incidentList.get(incidentList.size() - 1);
        assertThat(testIncident.getIncidentReferenceId()).isEqualTo(UPDATED_INCIDENT_REFERENCE_ID);
        assertThat(testIncident.getIncidentName()).isEqualTo(UPDATED_INCIDENT_NAME);
        assertThat(testIncident.getIncidentStatus()).isEqualTo(UPDATED_INCIDENT_STATUS);
        assertThat(testIncident.getIncidentDate()).isEqualTo(UPDATED_INCIDENT_DATE);
    }

    @Test
    @Transactional
    public void updateNonExistingIncident() throws Exception {
        int databaseSizeBeforeUpdate = incidentRepository.findAll().size();

        // Create the Incident
        IncidentDTO incidentDTO = incidentMapper.toDto(incident);

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restIncidentMockMvc.perform(put("/api/incidents")
            .contentType(MediaType.APPLICATION_JSON)
            .content(TestUtil.convertObjectToJsonBytes(incidentDTO)))
            .andExpect(status().isBadRequest());

        // Validate the Incident in the database
        List<Incident> incidentList = incidentRepository.findAll();
        assertThat(incidentList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    public void deleteIncident() throws Exception {
        // Initialize the database
        incidentRepository.saveAndFlush(incident);

        int databaseSizeBeforeDelete = incidentRepository.findAll().size();

        // Delete the incident
        restIncidentMockMvc.perform(delete("/api/incidents/{id}", incident.getId())
            .accept(MediaType.APPLICATION_JSON))
            .andExpect(status().isNoContent());

        // Validate the database contains one less item
        List<Incident> incidentList = incidentRepository.findAll();
        assertThat(incidentList).hasSize(databaseSizeBeforeDelete - 1);
    }
}
