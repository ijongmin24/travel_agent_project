package com.ta.travel_agent.info;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InfoEventDTO {
private int e_no;
private int e_ba_no;
private int e_sa_no;
private String e_img;
private String e_name;
private String e_place;
private String e_date;
private String e_info;

}
