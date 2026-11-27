package com.ta.travel_agent.board;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/board/update")
public class BoardUpdateC extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        BoardDAO.update(request);

        response.sendRedirect(request.getContextPath() + "/board");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        response.setContentType("text/plain; charset=UTF-8");

        int result = BoardDAO.updateComment(request);

        if (result > 0) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("fail");
        }
    }
}