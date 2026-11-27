package com.ta.travel_agent.info;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InfoSADTO {
private int sa_no;
private int sa_ba_no;
private String sa_img;
private String sa_name;
private String sa_info;

// 소도시 안에 특산품 포함
private List<InfoProductDTO> products;

// 소도시 안에 레스토랑 포함
private List<InfoRestaurantDTO> restaurants;

// 소도시 안에 이벤트 포함
private List<InfoEventDTO> events;
}
