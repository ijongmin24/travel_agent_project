<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%-- 메인 top 고정부분 --%>
<jsp:include page="info_mainTOP.jsp"></jsp:include>

<%-- 대도시명 --%>
  <div class="ba_name">
      ${viewBA[0].ba_name}
  </div>

</body>
</html>
