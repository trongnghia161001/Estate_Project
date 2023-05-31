<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerAPI" value="/api/customer"/>
<c:url var="customerListType" value="/admin/customer-edit"/>
<head>
    <title>Thêm thông tin khách hàng</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs')
                } catch (e) {
                }
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="<c:url value="/admin/home"/>">Home</a>
                </li>
                <li class="active">Edit Customer</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <form class="form-horizontal" role="form" id="formEdit">
                <div class="row">
                    <div class="col-xs-12" style="width: 80%">
                        <form:form modelAttribute="customer" action="${customerAPI}" id="listForm">
                            <div class="form-group" style="margin-top: 70px">
                                <label class="col-sm-3 control-label no-padding-right"> Tên đầy đủ</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="fullname"
                                           value="${customer.fullname}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Số điện thoại </label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="phone" value="${customer.phone}"/>
                                </div>
                            </div>
                            <div class=" form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Email
                                </label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="email" value="${customer.email}"/>
                                </div>
                            </div>
                            <div class=" form-group">
                                <div class="col-md-offset-3 col-md-9" style="margin: 10px 0px 0px 25%">
                                    <c:if test="${customer.id == null}">
                                        <button class="btn btn-info"
                                                type="button"
                                                id="btnAddCustomer" onclick="ChuyenTrang()">
                                            <i class="ace-icon fa fa-check bigger-110"></i>
                                            Thêm
                                            khách hàng
                                        </button>
                                    </c:if>
                                    <c:if test="${customer.id != null}">
                                        <button class="btn btn-info"
                                                type="button"
                                                id="btnAddCustomer">
                                            <i class="ace-icon fa fa-check bigger-110"></i>
                                            Cập nhật khách hàng
                                        </button>
                                    </c:if>
                                    <button class="btn"
                                            type="reset">
                                        <i class="ace-icon fa fa-undo bigger-110"></i>
                                        Hủy
                                    </button>
                                </div>
                            </div>
                            <form:hidden path="id" id="customerID"/>
                        </form:form>
                    </div>
                </div>
            </form>
        </div>

        <%-- Transaction Componenet --%>
        <form class="form-horizontal" role="form" id="transaction">
            <c:forEach var="transEnum" items="${transactionEnum}">
                <div class="page-content">
                    <div class="page-header" style="padding: 3px">
                        <h1 style="font-size: 21px;">${transEnum.value}
                            <button value="${transEnum.key}"
                                    class="dt-button buttons-colvis btn btn-white btn-primary btn-bold btnAddTransaction"
                                    data-toggle="tooltip" title='Thêm hành động'>
                                <span><i class="fa fa-plus-circle sbigger-110 purple"></i></span>
                            </button>
                        </h1>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr style="font-family: VnBlack ; font-weight: bold; color: #000000;">
                                        <td class="col-sm-3">Ngày tạo</td>
                                        <td>Ghi chú</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="index" items="${transaction}">
                                        <c:if test="${transEnum.value.equals(index.code)}">
                                            <tr>
                                                <th>${index.dateAdd}</th>
                                                <th>${index.note}</th>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    <tr>
                                        <th></th>
                                        <th>
                                            <input type="text" style="width: 100%" name="transactionNote"
                                                   id="transactionNote"/>
                                        </th>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </form>

    </div>
</div>

<script>
    $('#btnAddCustomer').click(function () {
        var data = {};
        var formData = $('#formEdit').serializeArray();
        $.each(formData, function (indexInArray, valueOfElement) {
            data["" + valueOfElement.name + ""] = valueOfElement.value;
        });
        addCustomer(data);
    });

    function addCustomer(data) {
        $.ajax({
            type: 'POST',
            url: '${customerAPI}',
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json",
            success: function (res) {
                window.location.href = "<c:url value='/admin/customer-edit-"+res.id+"?message=update_success'/>";
                alert("Cập nhật thành công");
            },
            error: function (res) {
                window.location.href = "<c:url value='/admin/customer-edit-"+res.id+"?message=error_system'/>";
            }
        });
    }

    function ChuyenTrang() {
        location.assign("/admin/customer-list");
    }

    $('.btnAddTransaction').click(function () {
        var data = {};
        $.each($('#transaction').serializeArray(), function (indexInArray, valueOfElement) {
            data['note'] = valueOfElement.value;
        });
        if (data['note'] === "") {
            data['note'] = $('#transactionNote').val();
        }
        data['customerId'] = $('#customerID').val();
        data['code'] = this.value;
        addTransaction(data);
    });

    function addTransaction(data) {
        $.ajax({
            type: 'POST',
            url: '${customerAPI}/transaction',
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json",
            success: function (res) {
                window.location.href = "/admin/home";
            },
            error: function (res) {
                alert("Bạn có chắc chắn muốn thêm?")
            }
        });
    }
</script>
</body>
</html>