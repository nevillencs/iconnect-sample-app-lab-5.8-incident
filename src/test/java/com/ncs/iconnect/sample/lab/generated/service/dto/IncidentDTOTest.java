package com.ncs.iconnect.sample.lab.generated.service.dto;

import org.junit.jupiter.api.Test;
import static org.assertj.core.api.Assertions.assertThat;
import com.ncs.iconnect.sample.lab.generated.web.rest.TestUtil;

public class IncidentDTOTest {

    @Test
    public void dtoEqualsVerifier() throws Exception {
        TestUtil.equalsVerifier(IncidentDTO.class);
        IncidentDTO incidentDTO1 = new IncidentDTO();
        incidentDTO1.setId(1L);
        IncidentDTO incidentDTO2 = new IncidentDTO();
        assertThat(incidentDTO1).isNotEqualTo(incidentDTO2);
        incidentDTO2.setId(incidentDTO1.getId());
        assertThat(incidentDTO1).isEqualTo(incidentDTO2);
        incidentDTO2.setId(2L);
        assertThat(incidentDTO1).isNotEqualTo(incidentDTO2);
        incidentDTO1.setId(null);
        assertThat(incidentDTO1).isNotEqualTo(incidentDTO2);
    }
}
