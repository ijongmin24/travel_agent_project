package com.ta.travel_agent.schedule;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ta.travel_agent.MyBatis;
import com.ta.travel_agent.board.RegionDTO;
import com.ta.travel_agent.schedule.spot.ScheduleSpotDTO;
import com.ta.travel_agent.schedule.spot.SpotDTO;
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

    public static void getTravel(HttpServletRequest req) {
        SqlSession ss = null;

        try {
            ss = MyBatis.connect();

            String travel_no = req.getParameter("travel_no");

            List<ScheduleSpotDTO> places = ss.selectList("bo.getAllPlace", travel_no);
            req.setAttribute("places", places);


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }
    }

    public static void getMyTravelList(HttpServletRequest req) {
        SqlSession ss = null;

        try {
            ss = MyBatis.connect();

//            String id = req.getParameter("id");
            String id = "bo";

            List<TravelDTO> travels = ss.selectList("bo.getMyTravel", id);
            req.setAttribute("travels", travels);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }
    }

    public static void getOthersTravelList(HttpServletRequest req) {
        SqlSession ss = null;

        try {
            ss = MyBatis.connect();

//            String id = req.getParameter("id");
            String id = "bo";

            List<TravelDTO> travels = ss.selectList("bo.getOthersTravel", id);
            req.setAttribute("travels", travels);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }
    }
}
