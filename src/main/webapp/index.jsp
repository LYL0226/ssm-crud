<%--
  Created by IntelliJ IDEA.
  User: 刘银龙
  Date: 2021/12/6
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%--    分页条--%>
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
<!-- Button trigger modal -->
<%--<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">--%>
<%--    Launch demo modal--%>
<%--</button>--%>

<%--员工修改的模态框--%>
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">name</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="emp_update_email" placeholder="email@qq.com">
                            <span  class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="emp_update_gender1" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="emp_update_gender2" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_update_select">

                            </select>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal  员工添加模态框 -->
<div class="modal fade" id="empModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">name</label>
                        <div class="col-sm-10">
                            <input type="text" name="lastName" class="form-control" id="emp_add_name" placeholder="name">
                            <span  class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="emp_add_email" placeholder="email@qq.com">
                            <span  class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="emp_add_gender1" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="emp_add_gender2" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_add_select">

                            </select>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_btn">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>id</th>
                    <th>name</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptname</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <%--    分页信息--%>
    <div class="row">
        <%--        分页文字--%>
        <div class="col-md-6" id="page_msg">当前${pageInfo.pageNum}页，总${pageInfo.pages}页，总${pageInfo.total}记录数</div>
        <%--    分页条--%>
        <div class="col-md-6" id="page_nav">

        </div>

    </div>
</div>
<script type="text/javascript">
    var totalRecord,currentPage;
    // 页面加载完成后发送Ajax请求
    $(function(){
       to_page(1);
    });
    function to_page(pn){
        $.ajax({
            url:"${APP_PATH}/emps",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                // console.log(result);
                build_emps(result);
                buid_msg(result);
                build_page(result);
            }
        });
    }
    function build_emps(result){
        //清空表格数据
        $("#emps tbody").empty();
        var emps = result.map.pageInfo.list;
        $.each(emps,function(index,item){
            var checkbox = $("<td><input type='checkbox' class='check_item'/></td>");
            var id = $("<td></td>").append(item.id);
            var name = $("<td></td>").append(item.lastName);
            var gender = $("<td></td>").append(item.gender);
            var email = $("<td></td>").append(item.email);
            var deptName = $("<td></td>").append(item.dept.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个自定义的属性表示当前员工的id
            editBtn.attr("edit-id",item.id);
            var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性表示当前员工的id
            deleteBtn.attr("delete-id",item.id);
            $("<tr></tr>").append(checkbox).append(id).append(name)
                .append(gender).append(email)
                .append(deptName).append(editBtn).append(deleteBtn).appendTo("#emps tbody");
        });
    }
    //解析显示分析信息
    function buid_msg(result){
        $("#page_msg").empty();
        $("#page_msg").append("当前"+result.map.pageInfo.pageNum+"页，总"+result.map.pageInfo.pages+"页，总"+result.map.pageInfo.total+"记录数")
        totalRecord = result.map.pageInfo.total;
        currentPage = result.map.pageInfo.pageNum;
    }
    //解析显示分页条
    function build_page(result){
        $("#page_nav").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.map.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //为元素添加点击翻页的事件
            firstPageLi.click(function(){
                to_page(1);
            });
            prePageLi.click(function(){
                to_page(result.map.pageInfo.pageNum -1);
            });
        }



        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.map.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_page(result.map.pageInfo.pageNum +1);
            });
            lastPageLi.click(function(){
                to_page(result.map.pageInfo.pages);
            });
        }



        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.map.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.map.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav");
    }
    function reset_form(ele){
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }
    //点击新增按钮弹出模态框
    $("#emp_add_btn").click(function(){
        //清除表单数据
        reset_form("#empModal form");
        // $("#empModal form")[0].reset();
        //先发送Ajax请求查询部门信息，作为模态框的展示
        getDepts("#dept_add_select");
        $("#empModal").modal({
            backdrop:"static"
        });
    });
    //查出部门信息显示在模态框的下拉列表中
    function getDepts(ele){
        //清空之前的值
        $(ele).empty();
        $("#dept_add_select").empty();
        $.ajax({
           url:"${APP_PATH}/depts",
           type:"GET",
           success:function(result){
               //显示部门信息
               $.each(result.map.depts,function(){
                  var option = $("<option></option>").append(this.deptName).attr("value",this.id);
                  option.appendTo(ele);
               });
           }
        });
    }
    function show_validate_msg(ele,status,msg){
        //清除当前元素的校验状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if("success"==status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if("error" == status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }
    //校验表单数据
    function validate_add_form(){
        var name = $("#emp_add_name").val();
        var regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[u2E80-\u9FFF]{2,5})/;
        if(!regName.test(name)){
            // alert("输入用户名不合法");
            show_validate_msg("#emp_add_name", "error", "用户名不合法");
        }else{
            show_validate_msg("#emp_add_name","success","");
        }
        var email = $("#emp_add_email").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            // alert("邮箱格式不正确");
            show_validate_msg("#emp_add_email","error","邮箱格式不正确");
            return false;
        }else{
            show_validate_msg("#emp_add_email","success","");
        }
        return true;
    }
    //给员工姓名绑定事件
    $("#emp_add_name").change(function () {
        var name = this.value;
        $.ajax({
            url:"${APP_PATH}/checkUser",
            data:"name="+name,
            type:"POST",
            success:function (result) {
                if(result.code == 200){
                    show_validate_msg("#emp_add_name","success","");
                    $("#emp_save_btn").attr("ajax-va","success");
                }else{
                    show_validate_msg("#emp_add_name","error",result.map.va_msg);
                    $("#emp_save_btn").attr("ajax-va","error");
                }
            }
        })
    });
    $("#emp_save_btn").click(function(){
        //进行数据的判断是否合法

        if(!validate_add_form()){
            return false;
        }
        //判断之前的Ajax用户名校验是否成功
        if($(this).attr("ajax-va") == "error"){
            return false;
        }
        //模态框的保存按钮
        $.ajax({
           url:"${APP_PATH}/emp",
            type:"POST",
            data:$("#empModal form").serialize(),
            success:function(result){
               if(result.code == 200 ){
                $("#empModal").modal('hide');
                $(".modal-backdrop.fade").hide();

                // alert(result.msg);
                //发送Ajax请求显示最后一页数据
                to_page(totalRecord);

               }else{
                   //显示失败信息
                   if(undefined != result.map.errorFields.lastName){
                       //显示用户名的错误信息
                       show_validate_msg("#emp_add_name","error",result.map.errorFields.lastName);
                   }
                   if(undefined != result.map.errorFields.email){
                       //显示邮箱的错误信息
                       show_validate_msg("#emp_add_email","error",result.map.errorFields.email);
                   }
               }
            }
        });
    });

    //绑定删除按钮 单个删除
    $(document).on("click",".delete_btn",function () {
        //弹出删除框
        var name = $(this).parents("tr").find("td:eq(1)").text();
        var id = $(this).attr("delete-id");
        if(confirm("确认删除["+name+"]员工吗？")){
            $.ajax({
                url:"${APP_PATH}/emp/"+id,
                type:"DELETE",
                success:function (result) {
                    //回到本页
                    to_page(currentPage);
                }
            })
        }
    })
    //要在创建按钮时绑定 或 使用on方法绑定
    $(document).on("click",".edit_btn",function(){
        //查出部门信息 员工信息
        getDepts("#dept_update_select");
        getEmp($(this).attr("edit-id"));
        //传递员工id属性给模态框的更新按钮
        $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
        $("#empUpdateModal").modal({
           backdrop:"static"
        });
    });
    //查询员工信息
    function getEmp(id){
        $.ajax({
            url:"${APP_PATH}/emp/"+id,
            type:"GET",
            success:function(result){
                var empData = result.map.emp;
                $("#empName_update_static").text(empData.lastName);
                $("#emp_update_email").val(empData.email);
                $("#empUpdateModal input[name=gender]").val([empData.gender]);
                $("#empUpdateModal select").val([empData.dId]);
            }
        })
    }
    //点击更新，更新员工信息
    $("#emp_update_btn").click(function () {
        //验证邮箱是否合法
        var email = $("#emp_update_email").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            // alert("邮箱格式不正确");
            show_validate_msg("#emp_update_email","error","邮箱格式不正确");
            return false;
        }else{
            show_validate_msg("#emp_update_email","success","");
        }
        //发送Ajax请求保存更新的员工数据
        /**
         * 如果直接发送ajax=PUT请求
         * 请求体中有数据，但emp的对象封装不到
         * 原因：tomcat会将请求体的数据封装到map中，
         *      request.getParameter（"empName")就会从map中取值
         *      SpringMVC封装POJO对象的时候，
         *      会把POJO中每个属性值，request.getParameter("email")
         */
        $.ajax({
            url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
            type:"PUT",
            data:$("#empUpdateModal form").serialize(),
            success:function(result){
                //关闭模态框
                $("#empUpdateModal").modal('hide');
                //回到最初页面
                to_page(currentPage);
            }
        })
    })

    //完成全选按钮绑定
    $("#check_all").click(function () {
        $(".check_item").prop("checked",$(this).prop("checked"));
    })
    $(document).on("click",".check_item",function () {
        var flag = $(".check_item:checked").length==$(".check_item").length;
        $("#check_all").prop("checked",flag);
    })
    //点击全部删除，批量删除
    $("#emp_delete_btn").click(function () {
            var empNames = "";
            var del_idstr = "";
            $.each($(".check_item:checked"),function(){
                //this
                empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
                //组装员工id字符串
                del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"_";
            });
            //去除empNames多余的,
            empNames = empNames.substring(0, empNames.length-1);
            //去除删除的id多余的-
            del_idstr = del_idstr.substring(0, del_idstr.length-1);
            if(confirm("确认删除【"+empNames+"】吗？")){
                //发送ajax请求删除
                $.ajax({
                    url:"${APP_PATH}/emp/"+del_idstr,
                    type:"DELETE",
                    success:function(result){
                        alert(result.msg);
                        //回到当前页面
                        to_page(currentPage);
                    }
                });
            }
    });
</script>

</body>
</html>
