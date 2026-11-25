package com.ta.travel_agent.schedule;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ta.travel_agent.MyBatis;
import com.ta.travel_agent.board.CategoryDTO;
import com.ta.travel_agent.board.RegionDTO;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class ScheduleDAO {

    public static void addSchedule(HttpServletRequest req) {
        SqlSession ss = null;

        try {
            ss = MyBatis.connect();

//            ss.insert("")


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

    }

    public static void getRegion(HttpServletRequest req) {
        SqlSession ss = null;

        try {
            ss = MyBatis.connect();

            List<RegionDTO> regions = ss.selectList("jmqqq.getRegion");
            req.setAttribute("regions", regions);


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

    }

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
}
