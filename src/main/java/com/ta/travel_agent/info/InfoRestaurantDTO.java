package com.ta.travel_agent.info;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InfoRestaurantDTO {
private int rs_no;
private int rs_ba_no;
private int ra_sa_no;
private String rs_img;
private String rs_name;
private String rs_place;
private String rs_time;
private String rs_call;
private String rs_info;

}
