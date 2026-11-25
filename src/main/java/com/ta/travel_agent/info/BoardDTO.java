package com.ta.travel_agent.info;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardDTO {
    private int b_no;
    private String b_title;
    private String b_content;
    private String b_view;
    private Date b_created_date;
    private Date b_updated_date;
    private String b_status;
    private String b_u_id;
    private int b_region_no;
    private int b_cg_no;



}
