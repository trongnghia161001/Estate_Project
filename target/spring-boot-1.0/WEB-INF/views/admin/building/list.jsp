<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="loadStaffAPI" value="/api/building"/>
<c:url var="buildingListURL" value="/admin/building-list"/>
<c:url var="formAjax" value="/api/building"/>
<c:url var="buildingEdit" value="/admin/building-edit"/>
<html>
<head>
    <title>Danh sách tòa nhà</title>
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
                <li class="active">Danh sách tòa nhà</li>
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
                            <form:form commandName="modelSearch" action="${buildingListURL}" id="listForm"
                                       method="GET">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <!-- PAGE CONTENT BEGINS -->
                                        <div class="col-sm-6">
                                            <div>
                                                <label for="name">Tên tòa nhà</label>
                                                <form:input path="name" cssClass="form-control"/>
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <div>
                                                <label for="floorArea">Diện tích sàn</label>
                                                <input type="number" id="floorArea" class="form-control"
                                                       name="floorArea" value="${modelSearch.floorArea}"
                                                       style="margin-bottom: 25px;"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12">
                                        <div class="col-sm-4">
                                            <div>
                                                <form:select path="district">
                                                    <form:option value="" label="---Quận hiện có---"/>
                                                    <form:options items="${districtMaps}"/>
                                                </form:select>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div>
                                                <label for="ward">Phường</label>
                                                <form:input path="ward" cssClass="form-control"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div>
                                                <label for="street">Đường</label>
                                                <form:input path="street" cssClass="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12">
                                        <div class="col-sm-4">
                                            <div>
                                                <label for="numberOfBasement">Số tầng hầm</label>
                                                <input type="number" id="numberOfBasement" class="form-control"
                                                       name="numberOfBasement" value="${modelSearch.numberOfBasement}"
                                                       style="margin-bottom: 25px;"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div>
                                                <label for="direction">Hướng</label>
                                                <form:input path="direction" cssClass="form-control"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div>
                                                <label for="level">Hạng</label>
                                                <form:input path="level" cssClass="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12">
                                        <div class="col-sm-3">
                                            <div>
                                                <label for="areaRentFrom">Diện tích từ</label>
                                                <input type="number" id="areaRentFrom" class="form-control"
                                                       name="areaRentFrom" value="${modelSearch.areaRentFrom}"
                                                       style="margin-bottom: 25px;"/>
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div>
                                                <label for="areaRentTo">Diện tích đến</label>
                                                <input type="number" id="areaRentTo" class="form-control"
                                                       name="areaRentTo" value="${modelSearch.areaRentTo}"
                                                       style="margin-bottom: 25px;"/>
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div>
                                                <label for="costRentFrom">Giá thuê từ</label>
                                                <input type="number" id="costRentFrom" class="form-control"
                                                       name="costRentFrom" value="${modelSearch.costRentFrom}"
                                                       style="margin-bottom: 25px;"/>
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div>
                                                <label for="costRentTo">Giá thuê đến</label>
                                                <input type="number" id="costRentTo" class="form-control"
                                                       name="costRentTo" value="${modelSearch.costRentTo}"
                                                       style="margin-bottom: 25px;"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12">
                                        <div class="col-sm-4">
                                            <div>
                                                <label for="managerName">Tên quản lý</label>
                                                <form:input path="managerName" cssClass="form-control"/>
                                            </div>
                                        </div>

                                        <div class="col-sm-4">
                                            <div>
                                                <label for="managerPhone">Điện thoại quản lý</label>
                                                <form:input path="managerPhone" cssClass="form-control"/>
                                            </div>
                                        </div>
                                        <security:authorize access="hasRole('manager')">
                                            <div class="col-sm-4">
                                                <div>
                                                    <form:select path="staffId" cssStyle="margin-top: 25px">
                                                        <form:option value="" label="---Chọn nhân viên---"/>
                                                        <form:options items="${staffmaps}"/>
                                                    </form:select>
                                                </div>
                                            </div>
                                        </security:authorize>
                                    </div>
                                    <div class="col-xs-12">
                                        <label for="type">Chọn loại tòa nhà:</label>
                                        <form:checkboxes path="type" items="${typeMaps}"
                                                         cssStyle="margin-top: 25px"/>
                                    </div>
                                    <div class="col-xs-12">
                                        <button type="button" class="btn btn-primary" id="btnSearch"
                                                style="border: 1px; background-color: darkgreen; padding: 5px 15px; color: white">
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
                    <button class="btn btn-white btn-info btn-bold" data-toggle="tooltip" title="Thêm tòa nhà"
                            onclick="ChuyenTrang()">
                        <i class="fa fa-plus-circle" aria-hidden="true">
                        </i>
                    </button>
                    <button class="btn btn-white btn-info btn-bold" data-toggle="tooltip" title="Xóa tòa nhà"
                            id="btnDeleteBuilding" onclick="warningBeforeDelete()">
                        <span>
                            <i class="fa fa-trash-o bigger-110 pink"></i>
						</span>
                    </button>
                </div>
                <div class="col-xs-12" style="padding: 0px">
                    <table id="buildingList" class="table table-striped table-bordered table-hover"
                           style="margin-top: 40px">
                        <thead>
                        <tr>
                            <th class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace"/>
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            <th>Ngày</th>
                            <th>Tên sản phẩm</th>
                            <th>Địa chỉ</th>
                            <th>Tên quản lý</th>
                            <th>Số điện thoại</th>
                            <th>D.T sàn</th>
                            <th>Giá thuê</th>
                            <th>Phí dịch vụ</th>
                            <th>Phí MG</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${buildingList}">
                            <tr>
                                <td class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" id="checkbox_1" name="buildingIds"
                                               value="${item.id}"/>
                                        <span class="lbl"></span>
                                    </label>
                                </td>
                                <td>1/18/2022</td>
                                <td>${item.name}</td>
                                <td>${item.address}</td>
                                <td>${item.managerName}</td>
                                <td>${item.managerPhone}</td>
                                <td>${item.floorArea}</td>
                                <td>${item.rentPrice}</td>
                                <td>${item.serviceFee}</td>
                                <td>${item.brokerageFee}</td>
                                <td>
                                    <div class="hidden-sm hidden-xs btn-group">
                                        <button class="btn btn-xs btn-info" data-toggle="tooltip"
                                                title="Cập nhật tòa nhà" onclick="updateBuilding(${item.id})">
                                            <i class="ace-icon fa fa-check bigger-120"></i>
                                            <input type="hidden" id="id" name="id" value="">
                                        </button>

                                        <security:authorize access="hasRole('manager')">
                                            <button class="btn btn-xs btn-info" data-toggle="tooltip"
                                                    title="Giao tòa nhà" onclick="assignmentBuilding(${item.id})">
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
<div class="modal fade" id="assignmentBuildingModal" role="dialog">
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
                <input type="hidden" id="buildingID" name="id" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="btnAssignBuilding">Giao tòa nhà
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>
<script type="text/javascript">

    function assignmentBuilding(buildingID) {
        openModalAssignmentBuilding();
        loadStaffs(buildingID);
        $('#buildingID').val(buildingID);
        console.log($('#buildingID').val());
    };


    function loadStaffs(buildingID) {
        $.ajax({
            type: "GET",
            url: '${loadStaffAPI}/' + buildingID + '/staffs',
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

    function openModalAssignmentBuilding() {
        $('#assignmentBuildingModal').modal();
    }

    $('#btnAssignBuilding').click(function (e) {
        e.preventDefault();
        var data = [];
        var buildingID = $('#buildingID').val();
        var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        assignStaff(buildingID, staffs);
    });

    function assignStaff(buildingID, staffs) {
        $.ajax({
            type: "PUT",
            url: '${formAjax}/' + buildingID + '/staffs',
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
        var dataArray = $('#buildingList').find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        if (dataArray.length > 0) {
            showAlertBeforeDelete(function () {
                event.preventDefault();
                deleteBuilding(dataArray);
            });
        }
        else {
            confirm("Bạn vui lòng chọn tòa nhà cần xóa!!!");
        }
    }

    function deleteBuilding(data) {
        $.ajax({
            type: "DELETE",
            url: '${formAjax}',
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (response) {
                window.location.href = "<c:url value='/admin/building-list?message=delete_success'/>"
            },
            error: function (response) {
                console.log(response);
                window.location.href = "<c:url value='/admin/building-list?message=error_system'/>"
            }
        });
    }

    $('#btnSearch').click(function (e) {
        e.preventDefault();
        $('#listForm').submit();
    });

    function updateBuilding(buildingID) {
        update(buildingID);
    }

    function update(buildingID) {
        location.assign("/admin/building-edit-" + buildingID);
    }

    function ChuyenTrang() {
        location.assign("/admin/building-edit");
    }

</script>
</body>
</html>