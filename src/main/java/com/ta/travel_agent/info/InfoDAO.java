package com.ta.travel_agent.info;

import com.ta.travel_agent.MyBatis;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class InfoDAO {
    // 관광지 메인화면 HOT 게시물
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
    // 특산품 페이지
    public static void viewProduct(HttpServletRequest request) {
        SqlSession ss = null;
        try {
            ss = MyBatis.connect();
            List<InfoProductDTO> products = ss.selectList("gyu.viewProducts");
            request.setAttribute("products", products);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ss != null) {
                ss.close();
            }
        }
    }
    // 대도시 조회 (BigArea)
    public static void viewBA(HttpServletRequest request) {
        SqlSession ss = null;
        try {
            ss = MyBatis.connect();
            String r_no = request.getParameter("r_no");
            List<InfoBADTO> viewBA = ss.selectList("gyu.viewBA", r_no);
            request.setAttribute("viewBA", viewBA);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ss != null) {
                ss.close();
            }
        }
    }
    // 소도시 조회 (SmallArea)
    public static void viewSA(HttpServletRequest request) {
        SqlSession ss = null;
        try {
            ss = MyBatis.connect();
            List<InfoSADTO> viewSA = ss.selectList("gyu.viewSA");
            request.setAttribute("viewSA", viewSA);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ss != null) {
                ss.close();
            }
        }
    }
    // 가게 조회
    public static void viewRes(HttpServletRequest request) {
        SqlSession ss = null;
        try {
            ss = MyBatis.connect();
            List<InfoRestaurantDTO> viewRes = ss.selectList("gyu.viewRes");
            request.setAttribute("viewRes", viewRes);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ss != null) {
                ss.close();
            }
        }
    }
    // 이벤트 조회
    public static void viewEvent(HttpServletRequest request) {
        SqlSession ss = null;
        try {
            ss = MyBatis.connect();
            List<InfoEventDTO> viewEvent = ss.selectList("gyu.viewEvent");
            request.setAttribute("viewEvent", viewEvent);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ss != null) {
                ss.close();
            }
        }
    }
}
