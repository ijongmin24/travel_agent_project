package com.ta.travel_agent.board;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.*;
import com.ta.travel_agent.MyBatis;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

public class BoardDAO {


    public static void select(HttpServletRequest request) {
        // mybatis _> DB ORM Framework -> 다 해주는거
        // 유지보수 -> 설정 (db 서버정보, sql) 외부파일에 (.xml)
        SqlSession ss = null;

        try {
            ss = MyBatis.connect();
            List<RegionDTO> regions = ss.selectList("jmqqq.getRegion");
            List<CategoryDTO> categories = ss.selectList("jmqqq.getCategory");

            String place = request.getParameter("place");
            String category = request.getParameter("category");
            Map<String, String> params = new HashMap<>();
            params.put("place", place);
            params.put("category", category);
            List<BoardDTO> boards = ss.selectList("jmqqq.getBoard", params);

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

        List<File> savedFiles = new ArrayList<>();

        try {
            ss = MyBatis.connect();
            request.setCharacterEncoding("UTF-8");

            String saveRealPath = request.getServletContext().getRealPath("img/uploadImg");
            if (saveRealPath == null) {
                System.out.println("이미지 저장 경로를 찾을 수 없습니다.");
            }
            File saveDir = new File(saveRealPath);
            if (!saveDir.exists() && !saveDir.mkdirs()) {
                throw new Exception("이미지 저장 폴더 생성 실패");
            }

            Map<String, String> params = new HashMap<>();

            List<BoardImgDTO> images = new ArrayList<>();

            MultipartParser mr = new MultipartParser(request,
                    30 * 1024 * 1024,
                    true,
                    true,
                    "utf-8");

            Part part;

            int sequence = 1;

            while ((part = mr.readNextPart()) != null) {
                if (part.isParam()) {

                    ParamPart param =  (ParamPart) part;

                    params.put(
                            param.getName(),
                            param.getStringValue()
                    );
                } else if (part.isFile()) {

                    FilePart filePart = (FilePart) part;

                    if (!"b_file".equals(part.getName())) {
                        continue;
                    }
                    if (filePart.getFileName() == null) {
                        continue;
                    }
                    String contentType = filePart.getContentType();

                    if (contentType == null || !contentType.startsWith("image/")) {
                        throw new Exception("이미지 파일만 업로드 할 수 있습니다.");
                    }
                    filePart.setRenamePolicy(
                            new DefaultFileRenamePolicy()
                    );
                    filePart.writeTo(saveDir);

                    String fileName = filePart.getFileName();

                    savedFiles.add(new File(saveDir, fileName));

                    BoardImgDTO img = new BoardImgDTO();

                    img.setI_url("/img/uploadImg/" + fileName);
                    img.setI_sequence(sequence++);

                    images.add(img);
                }
            }

            int b_no = ss.selectOne("jmqqq.getBoardNo");

            params.put("b_no", String.valueOf(b_no));

            params.put("b_view", "0");
            params.put("b_status", "Y");
            params.put("b_u_id", "bo");
            params.put("b_region_no", params.get("b_region"));
            params.put("b_cg_no", params.get("b_category"));

            int result = ss.insert("jmqqq.addBoard", params);

            if (result == 1) {
                for (BoardImgDTO img : images) {
                    img.setI_b_no(b_no);

                    ss.insert("jmqqq.addImage", img);
                }

                ss.commit();

                System.out.println("게시글 등록 성공");
                System.out.println("이미지 개수 : " + images.size());
            } else {
                throw new Exception("게시글 등록 실패");
            }
        } catch (Exception e) {
            e.printStackTrace();

            if (ss != null) {
                ss.rollback();
            }

            for (File file : savedFiles) {
                if (file.exists()) {
                    file.delete();
                }
            }
        } finally {
            if (ss != null) {
            ss.close();
            }
        }
    }

    public static void detail(HttpServletRequest request) {
        SqlSession ss = null;

        try {
            ss = MyBatis.connect();

            String b_no = request.getParameter("b_no");

            List<BoardDTO> boards = ss.selectList("jmqqq.detailBoard", b_no);
            request.setAttribute("boards",boards);

            List<BoardImgDTO> images = ss.selectList("jmqqq.getImages", b_no);


            request.setAttribute("images",images);

            List<CommentsDTO> comments = ss.selectList("jmqqq.selectComment", b_no);

//             답글 조회
            for (CommentsDTO comment : comments) {

                List<CommentsDTO> replies = ss.selectList("jmqqq.replyComment", comment.getC_no());

                comment.setReplies(replies);
            }
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
            String c_parent_comment = request.getParameter("c_parent_comment");
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

                List<CommentsDTO> comments = ss.selectList("jmqqq.selectComment", c_b_no);

                ArrayList<String> comments_json = new ArrayList<>();
                for (CommentsDTO comment : comments) {
                    comments_json.add(comment.toJson());
                }
                JsonObject obj = new JsonObject();
                obj.addProperty("content", c_content );

                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().println(comments_json);

            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            ss.close();
        }
    }
}

