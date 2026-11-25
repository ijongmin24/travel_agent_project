package com.ta.travel_agent.board;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ta.travel_agent.MyBatis;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
            List<BoardDTO> boards = ss.selectList("jmqqq.getBoard");
            request.setAttribute("regions",regions);
            request.setAttribute("categories",categories);
            request.setAttribute("boards",boards);
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
            request.setCharacterEncoding("UTF-8");

            // 값 받기
            String b_no = request.getParameter("b_no");
            String b_title = request.getParameter("b_title");
            String b_content = request.getParameter("b_content");
            String b_view = "0";
            SimpleDateFormat b_created_date = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat b_updated_date = new SimpleDateFormat("yyyy-MM-dd");
            String b_status = "Y";
            String b_u_id = "bo";
            String b_region_no = request.getParameter("b_region");
            String b_cg_no = request.getParameter("b_category");

            Map<String, String> params = new HashMap<>();
            params.put("b_no", b_no);
            params.put("b_title", b_title);
            params.put("b_content", b_content);
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

    public static void detail(HttpServletRequest request) {
        SqlSession ss = null;

        try {
            ss = MyBatis.connect();

            String b_no = request.getParameter("b_no");

            List<BoardDTO> boards = ss.selectList("jmqqq.detailBoard", b_no);
            request.setAttribute("boards",boards);


            List<CommentsDTO> comments = ss.selectList("jmqqq.selectComment", b_no);
            request.setAttribute("comments", comments);
        } catch (Exception e) {
            throw new RuntimeException(e);

        } finally {
            ss.close();
        }
    }

    public static void addComment(HttpServletRequest request, HttpServletResponse response) {
        SqlSession ss = null;

        try {
            ss = MyBatis.connect();

            String c_content = request.getParameter("c_content");
            SimpleDateFormat c_created_date = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat c_updated_date = new SimpleDateFormat("yyyy-MM-dd");
            String c_status = "N";
            String c_b_no = request.getParameter("c_b_no");
            String c_parent_comment = "null";
            String c_u_id ="bo";
//            String c_u_id = request.getParameter("c_u_id");

            Map<String, String> params = new HashMap<>();
            params.put("c_content", c_content);
            params.put("c_created_date", c_created_date.format(new Date()));
            params.put("c_updated_date", c_updated_date.format(new Date()));
            params.put("c_status", c_status);
            params.put("c_b_no", c_b_no);
            params.put("c_parent_comment", c_parent_comment);
            params.put("c_u_id", c_u_id);

            //db comments b_no = c_b_no조회
            // List<comment>
            // req.setAtttr


            if (ss.insert("jmqqq.addComment", params) == 1) {
                System.out.println("add success");
                ss.commit(); // batis가 커밋 수동으로 돌려놓음.

                JsonObject obj = new JsonObject();
                obj.addProperty("content", c_content );

                System.out.println(obj);
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().println(obj);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            ss.close();
        }
    }
}

