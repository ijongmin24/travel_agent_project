package com.ta.travel_agent.info;

import com.ta.travel_agent.MyBatis;
import com.ta.travel_agent.board.RegionDTO;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class InfoDAO {
    public static void viewHotBoard(HttpServletRequest request) {
        SqlSession ss = null;

        try {
            ss = MyBatis.connect();
            List<BoardDTO> boards = ss.selectList("gyu.viewHotBoard");
            request.setAttribute("boards", boards);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ss != null) {
                ss.close();
            }
        }

    }
}
