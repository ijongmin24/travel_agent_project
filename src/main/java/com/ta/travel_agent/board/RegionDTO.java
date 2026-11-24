package com.ta.travel_agent.board;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RegionDTO {
    private int r_no;
    private String r_name;
    private String r_country;

}
