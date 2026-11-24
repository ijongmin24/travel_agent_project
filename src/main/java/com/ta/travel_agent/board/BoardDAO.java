package com.ta.travel_agent.board;

import com.ta.travel_agent.MyBatis;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class BoardDAO {


    public static void load(HttpServletRequest request) {
        // mybatis _> DB ORM Framework -> 다 해주는거
        // 유지보수 -> 설정 (db 서버정보, sql) 외부파일에 (.xml)

        SqlSession ss = null;

        try {
            ss = MyBatis.connect();
            List<RegionDTO> regions = ss.selectList("jmqqq.getRegion");
            request.setAttribute("regions",regions);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }
    }

    }

