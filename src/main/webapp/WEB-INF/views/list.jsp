<%--
  Created by IntelliJ IDEA.
  User: 刘银龙
  Date: 2021/12/5
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>员工列表</title>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<link href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>id</th>
                    <th>name</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptname</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                <tr>
                    <td>${emp.id}</td>
                    <td>${emp.lastName}</td>
                    <td>${emp.gender}</td>
                    <td>${emp.email}</td>
                    <td>${emp.dept.deptName}</td>
                    <th>
                        <button class="btn btn-primary btn-sm">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            编辑
                        </button>
                        <button class="btn btn-danger btn-sm">
                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                            删除
                        </button>
                    </th>
                </tr>
                </c:forEach>
            </table>
        </div>
    </div>
<%--    分页信息--%>
    <div class="row">
<%--        分页文字--%>
        <div class="col-md-6">当前${pageInfo.pageNum}页，总${pageInfo.pages}页，总${pageInfo.total}记录数</div>
<%--    分页条--%>
    <div class="col-md-6">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li><a href="${APP_PATH}/emps?pn=1">首页</a> </li>
                <c:if test="${pageInfo.hasPreviousPage}">
                <li>
                    <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                </c:if>
                <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                    <c:if test="${pageNum == pageInfo.pageNum}">
                        <li class="active"><a href="#">${pageNum}</a></li>
                    </c:if>
                    <c:if test="${pageNum != pageInfo.pageNum}">
                        <li><a href="${APP_PATH}/emps?pn=${pageNum}">${pageNum}</a></li>
                    </c:if>

                </c:forEach>
                <c:if test="${pageInfo.hasNextPage}">
                <li>
                    <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                </c:if>
                <li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">末页</a> </li>

            </ul>
        </nav>
    </div>

    </div>
</div>

</body>
</html>
