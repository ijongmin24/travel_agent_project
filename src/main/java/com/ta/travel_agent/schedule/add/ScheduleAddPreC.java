package com.ta.travel_agent.schedule.add;

import com.ta.travel_agent.schedule.ScheduleDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/schedule/add/pre")
public class ScheduleAddPreC extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        ScheduleDAO.getRegion(req);

        req.setAttribute("content", "/jsp/schedule/add/schedule_add_pre.jsp");

        req.getRequestDispatcher("/index.jsp").forward(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        ScheduleDAO.addSchedule(req);

        res.sendRedirect("/schedule/add/main?travel_no=1");
    }
}