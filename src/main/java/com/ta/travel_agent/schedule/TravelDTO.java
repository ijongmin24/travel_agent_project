package com.ta.travel_agent.schedule;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.text.SimpleDateFormat;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TravelDTO {
    private int t_no;
    private String t_r_no;
    private String r_name;
    private String t_u_id;
    private String t_title;
    private String t_img;
    private Date t_start_date;
    private Date t_end_date;
    private Date t_created_date;
    private Date t_updated_date;

    private String toDataString(Date date) {
        String dateStr = new SimpleDateFormat("yyyy-MM-dd").format(date);

        return dateStr;
    }

    public String getT_start_date() {
        return toDataString(t_start_date);
    }

    public String getT_end_date() {
        return toDataString(t_end_date);
    }

    public String getT_created_date() {
        return toDataString(t_created_date);
    }

    public String getT_updated_date() {
        return toDataString(t_updated_date);
    }
}
