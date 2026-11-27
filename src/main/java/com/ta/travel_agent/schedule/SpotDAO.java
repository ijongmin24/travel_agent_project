package com.ta.travel_agent.schedule;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ta.travel_agent.MyBatis;
import com.ta.travel_agent.schedule.spot.SpotDTO;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SpotDAO {

    public static JsonObject getSchedulePlaceDetail(HttpServletRequest req, HttpServletResponse res) {
        SqlSession ss = null;

        try {
            ss = MyBatis.connect();

            String spot_no = req.getParameter("spot_no");

            SpotDTO spot = ss.selectOne("bo.getSpotDetail", spot_no);

            JsonObject obj = new JsonObject();
            JsonParser parser = new JsonParser();
            obj.add("spot", parser.parse(spot.toJSON()));

            return obj;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }
        return null;
    }

    public static JsonObject addSpot(HttpServletRequest req, HttpServletResponse res) {
        SqlSession ss = null;

        try {
            ss = MyBatis.connect();

            Map<String, String> params = new HashMap<>();

            params.put("spot_name", req.getParameter("spot_name"));
            params.put("spot_address", req.getParameter("spot_address"));
            params.put("spot_latitude", req.getParameter("spot_latitude"));
            params.put("spot_longitude", req.getParameter("spot_longitude"));
            params.put("spot_spotcode", req.getParameter("spot_spotcode"));
            params.put("spot_phone", req.getParameter("spot_phone"));
            params.put("spot_postal", req.getParameter("spot_postal"));
            params.put("spot_category", req.getParameter("spot_category"));
            params.put("spot_subcategory", req.getParameter("spot_subcategory"));

            List<SpotDTO> spot = ss.selectOne("bo.isSpot", req.getParameter("spot_spotcode"));
            if (spot.isEmpty()) {
                int rows = ss.insert("bo.addSpot", params);
                if( rows == 1 ) {
                    System.out.println("spot added successfully");
                    ss.commit();
                }
            }

            JsonObject obj = new JsonObject();
            obj.addProperty("msg", "success");

            return obj;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }
        return null;

    }

    public static JsonObject getSpots(HttpServletRequest req, HttpServletResponse res) {
        SqlSession ss = null;

        try {
            ss = MyBatis.connect();

            String t_no = req.getParameter("t_no");

            List<SpotDTO> spots = ss.selectList("bo.getSpots", t_no);

            System.out.println(spots);
            JsonObject obj = new JsonObject();
            JsonParser parser = new JsonParser();
            ArrayList<String> spots_json = new ArrayList<>();
            for (SpotDTO spotDTO : spots) {
                spots_json.add(spotDTO.toJSON());
            }
            obj.add("spots", parser.parse(spots_json.toString()));

            return obj;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }
        return null;
    }
}
