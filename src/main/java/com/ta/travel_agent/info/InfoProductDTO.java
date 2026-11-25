package com.ta.travel_agent.info;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InfoProductDTO {
private int p_no;
private int p_ba_no;
private int p_sa_no;
private String p_img;
private String p_name;
private int p_price;
private String p_info;

}
