<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
          rel="stylesheet">
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
    .error {
        color: red;
    }
</style>
<body>
<!-- Pre Loader -->
<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>
<!--/Pre Loader -->
<div class="wrapper">
    <!-- Page Content -->
    <div id="content">
        <!-- Top Navigation -->
        <%@ include file="../../static/topNav.jsp" %>
        <!-- Menu -->
        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="navUl" class="navbar-nav mr-auto">

                    </ul>
                </div>
            </nav>
        </div>
        <!-- /Menu -->
        <!-- Breadcrumb -->
        <!-- Page Title -->
        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">编辑住宿表</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">住宿表管理</li>
                        <li class="breadcrumb-item active">编辑住宿表</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /Page Title -->

        <!-- /Breadcrumb -->
        <!-- Main Content -->
        <div class="container">

            <div class="row">
                <!-- Widget Item -->
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">住宿表信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                                    <input id="updateId" name="id" type="hidden">
                                   <div class="form-group col-md-6" id="divfjTypesSelect">
                                       <label>住宿房间编号</label>
                                       <select id="fjTypesSelect" name="fjTypes" class="form-control">
                                       </select>
                                   </div>
                                   <div class="form-group col-md-6" id="divyhTypesSelect">
                                       <label>住宿人</label>
                                       <select id="yhTypesSelect" name="yhTypes" class="form-control">
                                       </select>
                                   </div>
                                    <div class="form-group col-md-6">
                                        <label>住宿结束时间</label>
                                        <input id="finishTime" name="finishTime" class="form-control"
                                                placeholder="住宿结束时间" type="date">
                                    </div>
                                <div class="form-group col-md-12 mb-3">
                                    <button id="exitBtn" type="button" class="btn btn-primary btn-lg">返回</button>
                                    <button id="submitBtn" type="button" class="btn btn-primary btn-lg">提交</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /Widget Item -->
            </div>
        </div>
        <!-- /Main Content -->
    </div>
    <!-- /Page Content -->
</div>
<!-- Back to Top -->
<a id="back-to-top" href="#" class="back-to-top">
    <span class="ti-angle-up"></span>
</a>
<!-- /Back to Top -->
<%@ include file="../../static/foot.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file="../../utils/baseUrl.jsp"%>

    var tableName = "zhusu";
    var pageType = "add-or-update";
    var updateId = "";
    var crossTableId = -1;
    var crossTableName = '';
    var ruleForm = {};
    var crossRuleForm = {};

    var fjTypesOptions = [];
    var yhTypesOptions = [];

    var ruleForm = {};
    var vm = new Vue({
        el: '#addOrUpdateForm',
        data: {
            ruleForm: {},
        },
        beforeCreate: function () {
            var id = window.sessionStorage.getItem("updateId");
            if (id != null && id != "" && id != "null") {
                $.ajax({
                    type: "GET",
                    url: baseUrl + "zhusu/info/" + id,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));
                    },
                    success: function (res) {
                        if (res.code == 0) {
                            vm.ruleForm = res.data;
                        } else if (res.code == 401) {
                        <%@ include file="../../static/toLogin.jsp"%>
                        } else {
                            alert(res.msg)
                        }
                    },
                });
            }
        },
        methods: {}
    });

    // 文件上传
    function upload() {

    }

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            let data = {};
            getContent();
            let value = $('#addOrUpdateForm').serializeArray();
            $.each(value, function (index, item) {
                data[item.name] = item.value;
            });
            debugger
            data.fjTypes = window.sessionStorage.getItem('check')
            let json = JSON.stringify(data);
            var urlParam;
            var successMes = '';
            if (updateId != null && updateId != "null" && updateId != '') {
                urlParam = 'update';
                successMes = '修改成功';
            } else {
                urlParam = 'save';
                successMes = '添加成功';
            }
            httpJson("zhusu/" + urlParam, "POST", data, (res) => {
                if(res.code == 0
        )
            {
                window.sessionStorage.removeItem('id');
                let flag = true;
                if (flag) {
                    alert(successMes);
                }
                if (window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true") {
                    window.sessionStorage.removeItem('onlyme');
                    window.parent.location.href = "${pageContext.request.contextPath}/index.jsp";
                } else {
                    window.location.href = "list.jsp";
                }

            }
        })
            ;
        } else {
            alert("表单未填完整或有错误");
        }
    }

    //查询当前页面下所有列表
        function fjTypesSelect() {
            //填充下拉框选项
            http("fangjian/page?page=1&limit=100&sort=&order=&dicCode=fj_types", "GET", {}, (res) => {
                if(res.code == 0){
                    fjTypesOptions = res.data.list;
            }
        });
        }
        function yhTypesSelect() {
            //填充下拉框选项
            http("yonghu/page?page=1&limit=100&sort=&order=&dicCode=yh_types", "GET", {}, (res) => {
                if(res.code == 0){
                    yhTypesOptions = res.data.list;
            }
        });
        }

    //初始化下拉框
    function initializationFjtypesSelect(){
        var fjTypesSelect = document.getElementById('fjTypesSelect');
            for (var i = 0; i < fjTypesOptions.length; i++) {
                fjTypesSelect.add(new Option(fjTypesOptions[i].name,fjTypesOptions[i].id));
            }
    }
    function initializationYhtypesSelect(){
        var yhTypesSelect = document.getElementById('yhTypesSelect');
            for (var i = 0; i < yhTypesOptions.length; i++) {
                yhTypesSelect.add(new Option(yhTypesOptions[i].name,yhTypesOptions[i].id));
            }
    }
    // 下拉框选项回显
    function setSelectOption() {
        for (var i = 0; i < fjTypesOptions.length; i++) {
            if(fjTypesOptions[i].id == ruleForm.fjTypes){//下拉框value对比,如果一致就赋值汉字
                document.getElementById("fjTypesSelect").options[i].selected = true;
            }
        }
        for (var i = 0; i < yhTypesOptions.length; i++) {
            if(yhTypesOptions[i].id == ruleForm.yhTypes){//下拉框value对比,如果一致就赋值汉字
                document.getElementById("yhTypesSelect").options[i].selected = true;
            }
        }
    }


    // 填充富文本框
    function setContent() {
    }

    // 获取富文本框内容
    function getContent() {

    }

    //搜素输入检查
            function idChickValue(e){
                var this_val = e.value || 0;
                var reg=/^[0-9]*$/;
                if(!reg.test(this_val)){
                    e.value = "";
                    alert("输入不合法");
                    return false;
                }
            }

    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.location.href = "list.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                fjTypes: {},
                yhTypes: {},
                initiateTime: {},
                finishTime: {},
            },
            messages: {
                fjTypes: {},
                yhTypes: {},
                initiateTime: {},
                finishTime: {},
            }
        }).form();
    }

    // 添加表单校验方法
    function addValidation() {
        jQuery.validator.addMethod("isPhone", function (value, element) {
            var length = value.length;
            var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "请填写正确的手机号码");
        jQuery.validator.addMethod("isIdCardNo", function (value, element) {
            return this.optional(element) || idCardNoUtil.checkIdCardNo(value);
        }, "请正确输入您的身份证号码");
    }

    // 获取当前详情
    function getDetails() {
        var id = window.sessionStorage.getItem("updateId");
        if (id != null && id != "" && id != "null") {
            updateId = id;
            $('#divyhTypesSelect').attr("style","display:none")
            $('#divfjTypesSelect').attr("style","display:none")
            window.sessionStorage.removeItem('updateId');
            http("zhusu/info/" + id, "GET", {}, (res) => {
                if(res.code == 0
        )
            {
                ruleForm = res.data
                // 是/否下拉框回显
                setSelectOption();
                // 设置图片src
                showImg();
                // 数据填充
                dataBind();
                // 富文本框回显
                setContent();
                //注册表单验证
                $(validform());
            }
        })
            ;
        } else {


            //注册表单验证
            $(validform());
        }
    }

    // 关联下拉框改变
    function lvSelectChange(level) {
        let data = {};
        let value = $('#addOrUpdateForm').serializeArray();
        $.each(value, function (index, item) {
            data[item.name] = item.value;
        });

    }

    // 清除可能会重复渲染的selection
    function clear(className) {
        var elements = document.getElementsByClassName(className);
        for (var i = elements.length - 1; i >= 0; i--) {
            elements[i].parentNode.removeChild(elements[i]);
        }
    }

    function dateTimePick() {
        $.fn.datetimepicker.dates['zh-CN'] = {
            days: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"],
            daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日"],
            daysMin: ["日", "一", "二", "三", "四", "五", "六", "日"],
            months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
            monthsShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
            today: "今天",
            suffix: [],
            meridiem: ["上午", "下午"]
        };
    }

    function calculation() {
        //积
        var x = 0;
        //和
        var y = 0;
        var flag = 0;
    }

    function calculationSE(colName) {
        //单列求和接口
        http("zhiburizhi" + colName, "GET", {
            tableName: "zhiburizhi",
            columnName: colName
        }, (res) => {
            if(res.code == 0
    )
        {
            $("#" + colName).attr("value", res.data);
        }
    })
        ;
    }

    function calculationPre() {
        //进入该页面就填充"单列求和"的列
    }




    function dataBind() {
        $("#updateId").val(ruleForm.id);

    }

    //图片显示
    function showImg() {
    }


    $(document).ready(function () {
        var id = window.sessionStorage.getItem('check')
        if(id != null ){
            $('#divyhTypesSelect').attr("style","display:none")
            $('#divfjTypesSelect').attr("style","display:none")
        }


        //设置右上角用户名
        $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
        //设置项目名
        $('.sidebar-header h3 a').html(projectName)
        //设置导航栏菜单
        setMenu();
        $('#exitBtn').on('click', function (e) {
            e.preventDefault();
            exit();
        });
        //初始化时间插件
        dateTimePick();
        //添加表单校验信息文本
        addValidation();
        //查询当前页面所有下拉框
        fjTypesSelect();
        yhTypesSelect();

        // 初始化下拉框
        initializationFjtypesSelect();
        initializationYhtypesSelect();
        getDetails();
        //初始化上传按钮
        upload();
        //单列求和
        calculationPre();
    <%@ include file="../../static/myInfo.js"%>
                $('#submitBtn').on('click', function (e) {
                    e.preventDefault();
                    //console.log("点击了...提交按钮");
                    submit();
                });
        readonly();
    });

    function readonly() {
        if (window.sessionStorage.getItem('role') != '管理员') {
            $('#divyhTypesSelect').attr("style","display:none")
            $('#divfjTypesSelect').attr("style","display:none")
        }
    }

    //比较大小
    function compare() {
        var largerVal = null;
        var smallerVal = null;
        if (largerVal != null && smallerVal != null) {
            if (largerVal <= smallerVal) {
                alert(smallerName + '不能大于等于' + largerName);
                return false;
            }
        }
        return true;
    }


    // 用户登出
    <%@ include file="../../static/logout.jsp"%>
</script>
</body>

</html>