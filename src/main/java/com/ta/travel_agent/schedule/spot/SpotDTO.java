package com.ta.travel_agent.schedule.spot;

import com.google.gson.Gson;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SpotDTO {
    private int spot_no;
    private String spot_name;
    private String spot_address;
    private double spot_latitude ;
    private double spot_longitude;
    private String spot_spotcode;
    private String spot_phone;
    private String spot_postal;
    private String spot_category;
    private String spot_subcategory;


    public String toJSON() {
        Gson gson = new Gson();
        return gson.toJson(this);
    }
}
