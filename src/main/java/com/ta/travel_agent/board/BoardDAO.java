package com.ta.travel_agent.board;

import com.ta.travel_agent.MyBatis;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BoardDAO {


    public static void select(HttpServletRequest request) {
        // mybatis _> DB ORM Framework -> 다 해주는거
        // 유지보수 -> 설정 (db 서버정보, sql) 외부파일에 (.xml)
        SqlSession ss = null;

        try {
            ss = MyBatis.connect();
            List<RegionDTO> regions = ss.selectList("jmqqq.getRegion");
            List<CategoryDTO> categories = ss.selectList("jmqqq.getCategory");
            request.setAttribute("regions",regions);
            request.setAttribute("categories",categories);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }
    }

    public static void add(HttpServletRequest request) {
        SqlSession ss = null;

        try {
            ss = MyBatis.connect();

            // 값 받기
            String b_no = request.getParameter("b_no");
            String b_title = request.getParameter("b_title");
            String product_content = request.getParameter("b_content");
            String b_view = request.getParameter("product_exp");
            SimpleDateFormat b_created_date = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat b_updated_date = new SimpleDateFormat("yyyy-MM-dd");
            String b_status = request.getParameter("b_status");
            String b_u_id = request.getParameter("b_u_id");
            String b_region_no = request.getParameter("b_region_no");
            String b_cg_no = request.getParameter("b_cg_no");

            Map<String, String> params = new HashMap<>();
            params.put("b_no", b_no);
            params.put("b_title", b_title);
            params.put("product_content", product_content);
            params.put("b_view", b_view);
            params.put("b_created_date", b_created_date.format(new Date()));
            params.put("b_updated_date", b_updated_date.format(new Date()));
            params.put("b_status", b_status);
            params.put("b_u_id", b_u_id);
            params.put("b_region_no", b_region_no);
            params.put("b_cg_no", b_cg_no);

            if (ss.insert("jmqqq.addBoard", params) == 1) {
                System.out.println("add success");
                ss.commit(); // batis가 커밋 수동으로 돌려놓음.
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }
    }
}

