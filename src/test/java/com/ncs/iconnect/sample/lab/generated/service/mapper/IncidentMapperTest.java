package com.ncs.iconnect.sample.lab.generated.service.mapper;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.assertj.core.api.Assertions.assertThat;

public class IncidentMapperTest {

    private IncidentMapper incidentMapper;

    @BeforeEach
    public void setUp() {
        incidentMapper = new IncidentMapperImpl();
    }

    @Test
    public void testEntityFromId() {
        Long id = 1L;
        assertThat(incidentMapper.fromId(id).getId()).isEqualTo(id);
        assertThat(incidentMapper.fromId(null)).isNull();
    }
}
