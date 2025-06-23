package com.ncs.iconnect.sample.lab.generated.web.rest;

import com.ncs.iconnect.sample.lab.generated.IconnectSampleAppLabApp;
import com.ncs.iconnect.sample.lab.generated.domain.Item;
import com.ncs.iconnect.sample.lab.generated.domain.Incident;
import com.ncs.iconnect.sample.lab.generated.repository.ItemRepository;
import com.ncs.iconnect.sample.lab.generated.service.ItemService;
import com.ncs.iconnect.sample.lab.generated.service.dto.ItemDTO;
import com.ncs.iconnect.sample.lab.generated.service.mapper.ItemMapper;
import com.ncs.iconnect.sample.lab.generated.service.dto.ItemCriteria;
import com.ncs.iconnect.sample.lab.generated.service.ItemQueryService;

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
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Integration tests for the {@link ItemResource} REST controller.
 */
@SpringBootTest(classes = IconnectSampleAppLabApp.class)

@AutoConfigureMockMvc
@WithMockUser
public class ItemResourceIT {

    private static final String DEFAULT_ITEM_REFERENCE_ID = "ITM_12";
    private static final String UPDATED_ITEM_REFERENCE_ID = "ITM_06";

    private static final String DEFAULT_ITEM_NAME = "AAAAAAAAAA";
    private static final String UPDATED_ITEM_NAME = "BBBBBBBBBB";

    @Autowired
    private ItemRepository itemRepository;

    @Autowired
    private ItemMapper itemMapper;

    @Autowired
    private ItemService itemService;

    @Autowired
    private ItemQueryService itemQueryService;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restItemMockMvc;

    private Item item;

    /**
     * Create an entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static Item createEntity(EntityManager em) {
        Item item = new Item()
            .itemReferenceId(DEFAULT_ITEM_REFERENCE_ID)
            .itemName(DEFAULT_ITEM_NAME);
        return item;
    }
    /**
     * Create an updated entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static Item createUpdatedEntity(EntityManager em) {
        Item item = new Item()
            .itemReferenceId(UPDATED_ITEM_REFERENCE_ID)
            .itemName(UPDATED_ITEM_NAME);
        return item;
    }

    @BeforeEach
    public void initTest() {
        item = createEntity(em);
    }

    @Test
    @Transactional
    public void createItem() throws Exception {
        int databaseSizeBeforeCreate = itemRepository.findAll().size();

        // Create the Item
        ItemDTO itemDTO = itemMapper.toDto(item);
        restItemMockMvc.perform(post("/api/items")
            .contentType(MediaType.APPLICATION_JSON)
            .content(TestUtil.convertObjectToJsonBytes(itemDTO)))
            .andExpect(status().isCreated());

        // Validate the Item in the database
        List<Item> itemList = itemRepository.findAll();
        assertThat(itemList).hasSize(databaseSizeBeforeCreate + 1);
        Item testItem = itemList.get(itemList.size() - 1);
        assertThat(testItem.getItemReferenceId()).isEqualTo(DEFAULT_ITEM_REFERENCE_ID);
        assertThat(testItem.getItemName()).isEqualTo(DEFAULT_ITEM_NAME);
    }

    @Test
    @Transactional
    public void createItemWithExistingId() throws Exception {
        int databaseSizeBeforeCreate = itemRepository.findAll().size();

        // Create the Item with an existing ID
        item.setId(1L);
        ItemDTO itemDTO = itemMapper.toDto(item);

        // An entity with an existing ID cannot be created, so this API call must fail
        restItemMockMvc.perform(post("/api/items")
            .contentType(MediaType.APPLICATION_JSON)
            .content(TestUtil.convertObjectToJsonBytes(itemDTO)))
            .andExpect(status().isBadRequest());

        // Validate the Item in the database
        List<Item> itemList = itemRepository.findAll();
        assertThat(itemList).hasSize(databaseSizeBeforeCreate);
    }


    @Test
    @Transactional
    public void checkItemReferenceIdIsRequired() throws Exception {
        int databaseSizeBeforeTest = itemRepository.findAll().size();
        // set the field null
        item.setItemReferenceId(null);

        // Create the Item, which fails.
        ItemDTO itemDTO = itemMapper.toDto(item);

        restItemMockMvc.perform(post("/api/items")
            .contentType(MediaType.APPLICATION_JSON)
            .content(TestUtil.convertObjectToJsonBytes(itemDTO)))
            .andExpect(status().isBadRequest());

        List<Item> itemList = itemRepository.findAll();
        assertThat(itemList).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    public void getAllItems() throws Exception {
        // Initialize the database
        itemRepository.saveAndFlush(item);

        // Get all the itemList
        restItemMockMvc.perform(get("/api/items?sort=id,desc"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(item.getId().intValue())))
            .andExpect(jsonPath("$.[*].itemReferenceId").value(hasItem(DEFAULT_ITEM_REFERENCE_ID)))
            .andExpect(jsonPath("$.[*].itemName").value(hasItem(DEFAULT_ITEM_NAME)));
    }
    
    @Test
    @Transactional
    public void getItem() throws Exception {
        // Initialize the database
        itemRepository.saveAndFlush(item);

        // Get the item
        restItemMockMvc.perform(get("/api/items/{id}", item.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.id").value(item.getId().intValue()))
            .andExpect(jsonPath("$.itemReferenceId").value(DEFAULT_ITEM_REFERENCE_ID))
            .andExpect(jsonPath("$.itemName").value(DEFAULT_ITEM_NAME));
    }


    @Test
    @Transactional
    public void getItemsByIdFiltering() throws Exception {
        // Initialize the database
        itemRepository.saveAndFlush(item);

        Long id = item.getId();

        defaultItemShouldBeFound("id.equals=" + id);
        defaultItemShouldNotBeFound("id.notEquals=" + id);

        defaultItemShouldBeFound("id.greaterThanOrEqual=" + id);
        defaultItemShouldNotBeFound("id.greaterThan=" + id);

        defaultItemShouldBeFound("id.lessThanOrEqual=" + id);
        defaultItemShouldNotBeFound("id.lessThan=" + id);
    }


    @Test
    @Transactional
    public void getAllItemsByItemReferenceIdIsEqualToSomething() throws Exception {
        // Initialize the database
        itemRepository.saveAndFlush(item);

        // Get all the itemList where itemReferenceId equals to DEFAULT_ITEM_REFERENCE_ID
        defaultItemShouldBeFound("itemReferenceId.equals=" + DEFAULT_ITEM_REFERENCE_ID);

        // Get all the itemList where itemReferenceId equals to UPDATED_ITEM_REFERENCE_ID
        defaultItemShouldNotBeFound("itemReferenceId.equals=" + UPDATED_ITEM_REFERENCE_ID);
    }

    @Test
    @Transactional
    public void getAllItemsByItemReferenceIdIsNotEqualToSomething() throws Exception {
        // Initialize the database
        itemRepository.saveAndFlush(item);

        // Get all the itemList where itemReferenceId not equals to DEFAULT_ITEM_REFERENCE_ID
        defaultItemShouldNotBeFound("itemReferenceId.notEquals=" + DEFAULT_ITEM_REFERENCE_ID);

        // Get all the itemList where itemReferenceId not equals to UPDATED_ITEM_REFERENCE_ID
        defaultItemShouldBeFound("itemReferenceId.notEquals=" + UPDATED_ITEM_REFERENCE_ID);
    }

    @Test
    @Transactional
    public void getAllItemsByItemReferenceIdIsInShouldWork() throws Exception {
        // Initialize the database
        itemRepository.saveAndFlush(item);

        // Get all the itemList where itemReferenceId in DEFAULT_ITEM_REFERENCE_ID or UPDATED_ITEM_REFERENCE_ID
        defaultItemShouldBeFound("itemReferenceId.in=" + DEFAULT_ITEM_REFERENCE_ID + "," + UPDATED_ITEM_REFERENCE_ID);

        // Get all the itemList where itemReferenceId equals to UPDATED_ITEM_REFERENCE_ID
        defaultItemShouldNotBeFound("itemReferenceId.in=" + UPDATED_ITEM_REFERENCE_ID);
    }

    @Test
    @Transactional
    public void getAllItemsByItemReferenceIdIsNullOrNotNull() throws Exception {
        // Initialize the database
        itemRepository.saveAndFlush(item);

        // Get all the itemList where itemReferenceId is not null
        defaultItemShouldBeFound("itemReferenceId.specified=true");

        // Get all the itemList where itemReferenceId is null
        defaultItemShouldNotBeFound("itemReferenceId.specified=false");
    }
                @Test
    @Transactional
    public void getAllItemsByItemReferenceIdContainsSomething() throws Exception {
        // Initialize the database
        itemRepository.saveAndFlush(item);

        // Get all the itemList where itemReferenceId contains DEFAULT_ITEM_REFERENCE_ID
        defaultItemShouldBeFound("itemReferenceId.contains=" + DEFAULT_ITEM_REFERENCE_ID);

        // Get all the itemList where itemReferenceId contains UPDATED_ITEM_REFERENCE_ID
        defaultItemShouldNotBeFound("itemReferenceId.contains=" + UPDATED_ITEM_REFERENCE_ID);
    }

    @Test
    @Transactional
    public void getAllItemsByItemReferenceIdNotContainsSomething() throws Exception {
        // Initialize the database
        itemRepository.saveAndFlush(item);

        // Get all the itemList where itemReferenceId does not contain DEFAULT_ITEM_REFERENCE_ID
        defaultItemShouldNotBeFound("itemReferenceId.doesNotContain=" + DEFAULT_ITEM_REFERENCE_ID);

        // Get all the itemList where itemReferenceId does not contain UPDATED_ITEM_REFERENCE_ID
        defaultItemShouldBeFound("itemReferenceId.doesNotContain=" + UPDATED_ITEM_REFERENCE_ID);
    }


    @Test
    @Transactional
    public void getAllItemsByItemNameIsEqualToSomething() throws Exception {
        // Initialize the database
        itemRepository.saveAndFlush(item);

        // Get all the itemList where itemName equals to DEFAULT_ITEM_NAME
        defaultItemShouldBeFound("itemName.equals=" + DEFAULT_ITEM_NAME);

        // Get all the itemList where itemName equals to UPDATED_ITEM_NAME
        defaultItemShouldNotBeFound("itemName.equals=" + UPDATED_ITEM_NAME);
    }

    @Test
    @Transactional
    public void getAllItemsByItemNameIsNotEqualToSomething() throws Exception {
        // Initialize the database
        itemRepository.saveAndFlush(item);

        // Get all the itemList where itemName not equals to DEFAULT_ITEM_NAME
        defaultItemShouldNotBeFound("itemName.notEquals=" + DEFAULT_ITEM_NAME);

        // Get all the itemList where itemName not equals to UPDATED_ITEM_NAME
        defaultItemShouldBeFound("itemName.notEquals=" + UPDATED_ITEM_NAME);
    }

    @Test
    @Transactional
    public void getAllItemsByItemNameIsInShouldWork() throws Exception {
        // Initialize the database
        itemRepository.saveAndFlush(item);

        // Get all the itemList where itemName in DEFAULT_ITEM_NAME or UPDATED_ITEM_NAME
        defaultItemShouldBeFound("itemName.in=" + DEFAULT_ITEM_NAME + "," + UPDATED_ITEM_NAME);

        // Get all the itemList where itemName equals to UPDATED_ITEM_NAME
        defaultItemShouldNotBeFound("itemName.in=" + UPDATED_ITEM_NAME);
    }

    @Test
    @Transactional
    public void getAllItemsByItemNameIsNullOrNotNull() throws Exception {
        // Initialize the database
        itemRepository.saveAndFlush(item);

        // Get all the itemList where itemName is not null
        defaultItemShouldBeFound("itemName.specified=true");

        // Get all the itemList where itemName is null
        defaultItemShouldNotBeFound("itemName.specified=false");
    }
                @Test
    @Transactional
    public void getAllItemsByItemNameContainsSomething() throws Exception {
        // Initialize the database
        itemRepository.saveAndFlush(item);

        // Get all the itemList where itemName contains DEFAULT_ITEM_NAME
        defaultItemShouldBeFound("itemName.contains=" + DEFAULT_ITEM_NAME);

        // Get all the itemList where itemName contains UPDATED_ITEM_NAME
        defaultItemShouldNotBeFound("itemName.contains=" + UPDATED_ITEM_NAME);
    }

    @Test
    @Transactional
    public void getAllItemsByItemNameNotContainsSomething() throws Exception {
        // Initialize the database
        itemRepository.saveAndFlush(item);

        // Get all the itemList where itemName does not contain DEFAULT_ITEM_NAME
        defaultItemShouldNotBeFound("itemName.doesNotContain=" + DEFAULT_ITEM_NAME);

        // Get all the itemList where itemName does not contain UPDATED_ITEM_NAME
        defaultItemShouldBeFound("itemName.doesNotContain=" + UPDATED_ITEM_NAME);
    }


    @Test
    @Transactional
    public void getAllItemsByIncidentIsEqualToSomething() throws Exception {
        // Initialize the database
        itemRepository.saveAndFlush(item);
        Incident incident = IncidentResourceIT.createEntity(em);
        em.persist(incident);
        em.flush();
        item.setIncident(incident);
        itemRepository.saveAndFlush(item);
        Long incidentId = incident.getId();

        // Get all the itemList where incident equals to incidentId
        defaultItemShouldBeFound("incidentId.equals=" + incidentId);

        // Get all the itemList where incident equals to incidentId + 1
        defaultItemShouldNotBeFound("incidentId.equals=" + (incidentId + 1));
    }

    /**
     * Executes the search, and checks that the default entity is returned.
     */
    private void defaultItemShouldBeFound(String filter) throws Exception {
        restItemMockMvc.perform(get("/api/items?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(item.getId().intValue())))
            .andExpect(jsonPath("$.[*].itemReferenceId").value(hasItem(DEFAULT_ITEM_REFERENCE_ID)))
            .andExpect(jsonPath("$.[*].itemName").value(hasItem(DEFAULT_ITEM_NAME)));

        // Check, that the count call also returns 1
        restItemMockMvc.perform(get("/api/items/count?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(content().string("1"));
    }

    /**
     * Executes the search, and checks that the default entity is not returned.
     */
    private void defaultItemShouldNotBeFound(String filter) throws Exception {
        restItemMockMvc.perform(get("/api/items?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$").isArray())
            .andExpect(jsonPath("$").isEmpty());

        // Check, that the count call also returns 0
        restItemMockMvc.perform(get("/api/items/count?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(content().string("0"));
    }


    @Test
    @Transactional
    public void getNonExistingItem() throws Exception {
        // Get the item
        restItemMockMvc.perform(get("/api/items/{id}", Long.MAX_VALUE))
            .andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    public void updateItem() throws Exception {
        // Initialize the database
        itemRepository.saveAndFlush(item);

        int databaseSizeBeforeUpdate = itemRepository.findAll().size();

        // Update the item
        Item updatedItem = itemRepository.findById(item.getId()).get();
        // Disconnect from session so that the updates on updatedItem are not directly saved in db
        em.detach(updatedItem);
        updatedItem
            .itemReferenceId(UPDATED_ITEM_REFERENCE_ID)
            .itemName(UPDATED_ITEM_NAME);
        ItemDTO itemDTO = itemMapper.toDto(updatedItem);

        restItemMockMvc.perform(put("/api/items")
            .contentType(MediaType.APPLICATION_JSON)
            .content(TestUtil.convertObjectToJsonBytes(itemDTO)))
            .andExpect(status().isOk());

        // Validate the Item in the database
        List<Item> itemList = itemRepository.findAll();
        assertThat(itemList).hasSize(databaseSizeBeforeUpdate);
        Item testItem = itemList.get(itemList.size() - 1);
        assertThat(testItem.getItemReferenceId()).isEqualTo(UPDATED_ITEM_REFERENCE_ID);
        assertThat(testItem.getItemName()).isEqualTo(UPDATED_ITEM_NAME);
    }

    @Test
    @Transactional
    public void updateNonExistingItem() throws Exception {
        int databaseSizeBeforeUpdate = itemRepository.findAll().size();

        // Create the Item
        ItemDTO itemDTO = itemMapper.toDto(item);

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restItemMockMvc.perform(put("/api/items")
            .contentType(MediaType.APPLICATION_JSON)
            .content(TestUtil.convertObjectToJsonBytes(itemDTO)))
            .andExpect(status().isBadRequest());

        // Validate the Item in the database
        List<Item> itemList = itemRepository.findAll();
        assertThat(itemList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    public void deleteItem() throws Exception {
        // Initialize the database
        itemRepository.saveAndFlush(item);

        int databaseSizeBeforeDelete = itemRepository.findAll().size();

        // Delete the item
        restItemMockMvc.perform(delete("/api/items/{id}", item.getId())
            .accept(MediaType.APPLICATION_JSON))
            .andExpect(status().isNoContent());

        // Validate the database contains one less item
        List<Item> itemList = itemRepository.findAll();
        assertThat(itemList).hasSize(databaseSizeBeforeDelete - 1);
    }
}
