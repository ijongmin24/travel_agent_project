package com.ta.travel_agent.info;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InfoSADTO {
private int sa_no;
private int sa_ba_no;
private String sa_img;
private String sa_name;
private String sa_info;

}
