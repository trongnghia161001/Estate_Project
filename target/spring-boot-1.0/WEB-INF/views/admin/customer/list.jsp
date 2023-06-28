<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="loadStaffAPI" value="/api/customer"/>
<c:url var="customerListURL" value="/admin/customer-list"/>
<c:url var="formAjax" value="/api/customer"/>
<c:url var="customerEdit" value="/admin/customer-edit"/>
<html>
<head>
    <title>Danh sách khách hàng</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'absolute')
                } catch (e) {
                }
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">Danh sách khách hàng</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">


            <div class="row">
                <div class="widget-box">
                    <div class="widget-header">
                        <h4 class="widget-title">Tìm kiếm</h4>

                        <div class="widget-toolbar">
                            <a href="#" data-action="collapse">
                                <i class="ace-icon fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="widget-body">
                        <div class="widget-main">
                            <form:form commandName="modelSearch" action="${customerListURL}" id="listForm"
                                       method="GET">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <!-- PAGE CONTENT BEGINS -->
                                        <div class="col-sm-4">
                                            <div>
                                                <label for="fullname">Tên khách hàng</label>
                                                <form:input path="fullname" cssClass="form-control"/>
                                            </div>
                                        </div>

                                        <div class="col-sm-4">
                                            <div>
                                                <label for="phone">Di động</label>
                                                <form:input path="phone" cssClass="form-control"/>
                                            </div>
                                        </div>

                                        <div class="col-sm-4">
                                            <div>
                                                <label for="email">Email</label>
                                                <form:input path="email" cssClass="form-control"/>
                                            </div>
                                        </div>
                                    </div>

                                    <security:authorize access="hasRole('manager')">
                                        <div class="col-xs-12">
                                            <div>
                                                <form:select path="staffId" cssStyle="margin-top: 25px; margin-left: 12px;">
                                                    <form:option value="" label="---Chọn nhân viên---"/>
                                                    <form:options items="${staffmaps}"/>
                                                </form:select>
                                            </div>
                                        </div>
                                    </security:authorize>

                                    <div class="col-xs-12">
                                        <button type="button" class="btn btn-primary" id="btnSearch"
                                                style="border: 1px; background-color: darkgreen; padding: 5px 15px; color: white; margin-top: 20px; margin-left: 12px   ">
                                            Tìm kiếm
                                        </button>
                                    </div>
                                    <!-- PAGE CONTENT ENDS -->
                                </div>
                                <!-- /.col -->
                            </form:form>
                        </div>
                    </div>
                </div>
                <div class="pull-right">
                    <button class="btn btn-white btn-info btn-bold" data-toggle="tooltip" title="Thêm khách hàng"
                            onclick="ChuyenTrang()">
                        <i class="fa fa-plus-circle" aria-hidden="true">
                        </i>
                    </button>
                    <button class="btn btn-white btn-info btn-bold" data-toggle="tooltip" title="Xóa khách hàng"
                            id="btnDeleteCustomer" onclick="warningBeforeDelete()">
                        <span>
                            <i class="fa fa-trash-o bigger-110 pink"></i>
						</span>
                    </button>
                </div>
                <div class="col-xs-12" style="padding: 0px">
                    <table id="customerList" class="table table-striped table-bordered table-hover"
                           style="margin-top: 40px">
                        <thead>
                        <tr>
                            <th class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace"/>
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            <th>Tên</th>
                            <th>Nhân viên quản lý</th>
                            <th>Di động</th>
                            <th>Email</th>
                            <th>Nhu cầu</th>
                            <th>Người nhập</th>
                            <th>Ngày nhập</th>
                            <th>Tình trạng</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${customerList}">
                            <tr>
                                <td class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" id="checkbox_1" name="buildingIds"
                                               value="${item.id}"/>
                                        <span class="lbl"></span>
                                    </label>
                                </td>
                                <td>${item.fullname}</td>
                                <td>${item.staffName}</td>
                                <td>${item.phone}</td>
                                <td>${item.email}</td>
                                <td>${item.demand}</td>
                                <td>${item.modifiedDate}</td>
                                <td>${item.modifiedBy}</td>
                                <td>${item.status}</td>
                                <td>
                                    <div class="hidden-sm hidden-xs btn-group">
                                        <button class="btn btn-xs btn-info" data-toggle="tooltip"
                                                title="Cập nhật khách hàng" onclick="updateCustomer(${item.id})">
                                            <i class="ace-icon fa fa-check bigger-120"></i>
                                            <input type="hidden" id="id" name="id" value="">
                                        </button>

                                        <security:authorize access="hasRole('manager')">
                                            <button class="btn btn-xs btn-info" data-toggle="tooltip"
                                                    title="Giao khách hàng" onclick="assignmentCustomer(${item.id})">
                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                            </button>
                                        </security:authorize>
                                    </div>

                                    <div class="hidden-md hidden-lg">
                                        <div class="inline pos-rel">
                                            <button class="btn btn-minier btn-primary dropdown-toggle"
                                                    data-toggle="dropdown" data-position="auto">
                                                <i class="ace-icon fa fa-cog icon-only bigger-110"></i>
                                            </button>

                                            <ul
                                                    class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                                <li>
                                                    <a href="#" class="tooltip-info" data-rel="tooltip"
                                                       title="View">
																<span class="blue">
																	<i
                                                                            class="ace-icon fa fa-search-plus bigger-120"></i>
																</span>
                                                    </a>
                                                </li>

                                                <li>
                                                    <a href="#" class="tooltip-success" data-rel="tooltip"
                                                       title="Edit">
																<span class="green">
																	<i
                                                                            class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																</span>
                                                    </a>
                                                </li>

                                                <li>
                                                    <a href="#" class="tooltip-error" data-rel="tooltip"
                                                       title="Delete">
																<span class="red">
																	<i class="ace-icon fa fa-trash-o bigger-120"></i>
																</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div><!-- /.row -->
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->
<div class="modal fade" id="assignmentCustomerModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Danh sách nhân viên</h4>
            </div>
            <div class="modal-body">
                <table class="table table-hover" id="staffList">
                    <thead>
                    <tr>
                        <th>Chọn nhân viên</th>
                        <th>Tên nhân viên</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                <input type="hidden" id="customerID" name="id" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="btnAssignCustomer">Giao khách
                    hàng
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>
<script type="text/javascript">

    function assignmentCustomer(customerID) {
        openModalAssignmentCustomer();
        loadStaffs(customerID);
        $('#customerID').val(customerID);
        console.log($('#customerID').val());
    };


    function loadStaffs(customerID) {
        $.ajax({
            type: "GET",
            url: '${loadStaffAPI}/' + customerID + '/staffs',
            dataType: "json",
            success: function (response) {
                var row = '';
                $.each(response.data, function (index, item) {
                    row += '<tr>';
                    row += '<td class="text-center"><input type="checkbox" value=' + item.staffId + ' id="checkbox_' + item.staffId + '" class="check-box-element" ' + item.checked + '/></td>';
                    row += '<td class="text-center">' + item.fullName + '</td>';
                    row += '</tr>';
                });
                $('#staffList tbody').html(row);
                console.log('success');

            },
            error: function (response) {
                console.log('failed');
                console.log(response);
            }
        });
    }

    function openModalAssignmentCustomer() {
        $('#assignmentCustomerModal').modal();
    }

    $('#btnAssignCustomer').click(function (e) {
        e.preventDefault();
        var data = [];
        var customerID = $('#customerID').val();
        var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        assignStaff(customerID, staffs);
    });

    function assignStaff(customerID, staffs) {
        $.ajax({
            type: "PUT",
            url: '${formAjax}/' + customerID + '/staffs',
            data: JSON.stringify(staffs),
            dataType: "json",
            contentType: "application/json",
            success: function (response) {
                console.log('success');
            },
            error: function (response) {
                console.log('failed');
                console.log(response);
            }
        });
    }

    function warningBeforeDelete() {
        var dataArray =  $('#customerList').find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        if (dataArray.length > 0) {
            showAlertBeforeDelete(function () {
                event.preventDefault();
                deleteCustomer(dataArray);
            });
        }
        else {
            confirm("Bạn vui lòng chọn khách hàng cần xóa!!!");
        }
    }

    function deleteCustomer(data) {
        $.ajax({
            type: "DELETE",
            url: '${formAjax}',
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (response) {
                window.location.href = "<c:url value='/admin/customer-list?message=delete_success'/>"
            },
            error: function (response) {
                console.log(response);
                window.location.href = "<c:url value='/admin/customer-list?message=error_system'/>"
            }
        });
    }

    $('#btnSearch').click(function (e) {
        e.preventDefault();
        $('#listForm').submit();
    });

    function updateCustomer(customerID) {
        update(customerID);
    }

    function update(customerID) {
        location.assign("/admin/customer-edit-" + customerID);
    }

    function ChuyenTrang() {
        location.assign("/admin/customer-edit");
    }
</script>
</body>
</html>