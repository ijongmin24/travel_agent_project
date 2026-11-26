package com.ta.travel_agent.board;

import com.google.gson.Gson;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentsDTO {
    private int c_no;
    private String c_content;
    Date c_created_date;
    Date c_updated_date;
    private String c_status;
    private int c_b_no;
    private int c_parent_comment;
    private String c_u_id;

    public String toJson() {
        Gson gson = new Gson();


        return gson.toJson(this);
    }
}
