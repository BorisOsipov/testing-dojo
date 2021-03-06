<%@ page import="static org.automation.dojo.ScoreService.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="refresh" content="1">
    <meta http-equiv="Content-Type" content="text/html;">
    <title>Leader Board</title>
    <link href="${ctx}/resources/style/bootstrap.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>Leader Board</h1>
    <jsp:include page="followus.jsp"/>
    <jsp:include page="releaseInfo.jsp"/>
    <table id="table-logs" class="table table-striped">
        <thead>
        <th width="5%"><h2>#</h2></th>
        <th width="20%"><h2>Player</h2></th>
        <th width="60%"><h2>Relative Score</h2></th>
        <th width="15%"><h2>Absolute Score</h2></th>
        </thead>
        <tbody>
        <c:forEach items="${records}" var="record" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>
                    <c:set var="superman"><%=SUPERMAN%></c:set>
                    <c:set var="looser"><%=LOOSER%></c:set>

                    <c:choose>
                            <c:when test="${record.player == superman}">
                                <img src="${ctx}/resources/images/superman_new.png" alt="Superman">
                            </c:when>
                            <c:when test="${record.player == looser}">
                                <img src="${ctx}/resources/images/tortoise_new.png" alt="Tortoise">
                            </c:when>
                            <c:otherwise>
                            <a href="${ctx}/logs/${record.player}">
                                <h1>${record.player}</h1>
                            </a>
                            </c:otherwise>
                        </c:choose>
                    </td>
                <td align="center">
                    <div class="progress">
                        <div class="bar" style="width: ${record.relativeScore}%;"></div>
                    </div>
                </td>
                <td>
                    <h1>${record.total+0}</h1>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<img/>

</body>
</html>