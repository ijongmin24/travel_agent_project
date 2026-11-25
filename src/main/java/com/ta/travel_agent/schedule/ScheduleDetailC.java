package com.ta.travel_agent.schedule;

import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/schedule/detail")
public class ScheduleDetailC extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        JsonObject obj = ScheduleDAO.getSchedulePlaceDetail(req, res);

        res.setContentType("application/json; charset=UTF-8");
        res.getWriter().println(obj);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

    }
}