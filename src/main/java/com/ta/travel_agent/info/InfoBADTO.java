package com.ta.travel_agent.info;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InfoBADTO {
private int ba_no;
private int ba_r_no;
private String ba_img;
private String ba_name;
private String ba_info;

}
