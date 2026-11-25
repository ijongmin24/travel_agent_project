package com.ta.travel_agent.info;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/area")
public class InfoAreaC extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        InfoDAO.viewBA(request);
        InfoDAO.viewSA(request);

        request.setAttribute("content", "jsp/info/info_area.jsp");
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }

}