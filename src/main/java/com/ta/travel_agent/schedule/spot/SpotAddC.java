package com.ta.travel_agent.schedule.spot;

import com.google.gson.JsonObject;
import com.ta.travel_agent.schedule.ScheduleDAO;
import com.ta.travel_agent.schedule.SpotDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/spot/add")
public class SpotAddC extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {


    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        JsonObject obj = SpotDAO.addSpot(req, res);

        res.setContentType("application/json; charset=UTF-8");
        res.getWriter().println(obj);
    }
}