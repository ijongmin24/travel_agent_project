package com.ta.travel_agent.board;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/board/detail")
public class BoardDetailC extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        게시글 조회
        BoardDAO.detail(request);

        request.setAttribute("content", "/jsp/board/board_detail.jsp");
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        댓글
        request.setCharacterEncoding("UTF-8");

        BoardDAO.addComment(request, response);

        


//        request.setAttribute("content", "/jsp/board/board_detail.jsp");
//        request.getRequestDispatcher("/index.jsp").forward(request, response);

    }
}