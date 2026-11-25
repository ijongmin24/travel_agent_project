package com.ta.travel_agent.schedule;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/schedule/add/main")
public class ScheduleAddMainC extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        ScheduleDAO.getTravel(req);

        req.setAttribute("content", "/jsp/schedule/add/schedule_add_main.jsp");

        req.getRequestDispatcher("/index.jsp").forward(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        ScheduleDAO.addSchedule(req);

        res.sendRedirect("/schedule/add/main");
    }
}