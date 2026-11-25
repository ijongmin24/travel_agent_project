package com.ta.travel_agent.board;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardDTO {
    private int b_no;
    private String b_title;
    private String b_content;
    private String r_name;
    private int b_scrap;
    private int b_view;
    private int b_like;
    private Date b_created_date;
    private Date b_updated_date;
    private String b_status;
    private String b_u_id;
    private int b_region_no;
    private int b_cg_no;
}
