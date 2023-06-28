<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingAPI" value="/api/building"/>
<c:url var="buildingListType" value="/admin/building-edit"/>
<head>
    <title>Thêm tòa nhà</title>
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
                    <a href="#">Home</a>
                </li>
                <li class="active">Dashboard</li>
            </ul><!-- /.breadcrumb -->
        </div>
    </div>
</div><!-- /.main-content -->
<div class="row">
    <div class="col-xs-12">
        <!-- PAGE CONTENT BEGINS -->
        <form class="form-horizontal" role="form" id="formEdit">
            <div class="row">
                <div class="col-xs-12" style="width: 95%">
                    <!-- PAGE CONTENT BEGINS -->
                    <form:form modelAttribute="building" action="${buildingAPI}" id="listForm">
                        <div class="form-group" style="margin-top: -100px">
                            <label class="col-sm-3 control-label no-padding-right"> Tên sản
                                phẩm </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="name" value="${building.name}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"> Đường </label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="street" value="${building.street}"/>
                            </div>
                        </div>

                        <div class=" form-group">
                            <label class="col-sm-3 control-label no-padding-right"> Phường
                            </label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="ward" value="${building.ward}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="district"> Quận
                            </label>
                            <div class="col-sm-9">
                                <form:select path="district">
                                    <form:option value="-1" label="---Quận hiện có---"/>
                                    <form:options items="${districtMaps}"/>
                                </form:select>
                            </div>
                        </div>

                        <div class=" form-group">
                            <label class="col-sm-3 control-label no-padding-right"> Kết cấu
                            </label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="structure"
                                       value="${building.structure}"/>
                            </div>
                        </div>

                        <div class=" form-group">
                            <label class="col-sm-3 control-label no-padding-right"> Số tầng
                                hầm </label>

                            <div class="col-sm-9">
                                <input type="number" class="form-control"
                                       name="numberOfBasement" value="${building.numberOfBasement}"/>
                            </div>
                        </div>

                        <div class=" form-group">
                            <label class="col-sm-3 control-label no-padding-right"> Diện
                                tích sàn </label>

                            <div class="col-sm-9">
                                <input type="number" class="form-control" name="floorArea"
                                       value="${building.floorArea}"/>
                            </div>
                        </div>

                        <div class=" form-group">
                            <label class="col-sm-3 control-label no-padding-right">
                                Hướng
                            </label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control"
                                       name="direction" value="${building.direction}"/>
                            </div>
                        </div>

                        <div class=" form-group">
                            <label class="col-sm-3 control-label no-padding-right"> Hạng
                            </label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="level"
                                       value="${building.level}"/>
                            </div>
                        </div>

                        <div class=" form-group">
                            <label class="col-sm-3 control-label no-padding-right">
                                Diện
                                tích thuê </label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control"
                                       name="rentArea" value="${building.rentArea}"/>
                            </div>
                        </div>

                        <div class=" form-group">
                            <label class="col-sm-3 control-label no-padding-right"> Mô tả
                                diện tích thuê </label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control"
                                       name="rentAreaDescription"
                                       value="${building.rentAreaDescription}"/>
                            </div>
                        </div>

                        <div class=" form-group">
                            <label class="col-sm-3 control-label no-padding-right">
                                Phí
                                dịch vụ
                            </label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control"
                                       name="serviceFee" value="${building.serviceFee}"/>
                            </div>
                        </div>

                        <div class=" form-group">
                            <label class="col-sm-3 control-label no-padding-right">
                                Phí
                                ô
                                tô
                            </label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control"
                                       name="carFee" value="${building.carFee}"/>
                            </div>
                        </div>

                        <div class=" form-group">
                            <label class="col-sm-3 control-label no-padding-right">
                                Phí mô
                                tô
                            </label>

                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control"
                                       name="motobikeFee"
                                       value="${building.motobikeFee}"/>
                            </div>
                        </div>

                        <div class=" form-group">
                            <label class="col-sm-3 control-label no-padding-right">
                                Phí
                                ngoài giờ
                            </label>

                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control"
                                       name="overtimeFee"
                                       value="${building.overtimeFee}"/>
                            </div>
                        </div>

                        <div class=" form-group">
                            <label class="col-sm-3 control-label no-padding-right">
                                Tiền
                                điện
                            </label>

                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control"
                                       name="electricityFee"
                                       value="${building.electricityFee}"/>
                            </div>
                        </div>

                        <div class=" form-group">
                            <label class="col-sm-3 control-label no-padding-right">
                                Đặt
                                cọc
                            </label>

                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control"
                                       name="deposit"
                                       value="${building.deposit}"/>
                            </div>
                        </div>

                        <div class=" form-group">
                            <label class="col-sm-3 control-label no-padding-right">
                                Thanh
                                toán
                            </label>

                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control"
                                       name="payment"
                                       value="${building.payment}"/>
                            </div>
                        </div>

                        <div class=" form-group">
                            <label class="col-sm-3 control-label no-padding-right">
                                Thời
                                hạn thuê
                            </label>

                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control"
                                       name="rentTime"
                                       value="${building.rentTime}"/>
                            </div>
                        </div>

                        <div class=" form-group">
                            <label class="col-sm-3 control-label no-padding-right">
                                Thời
                                gian trang trí
                            </label>

                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control"
                                       name="decorationTime"
                                       value="${building.decorationTime}"/>
                            </div>
                        </div>

                        <div class=" form-group">
                            <label class="col-sm-3 control-label no-padding-right">
                                Tên
                                quản lý
                            </label>

                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control"
                                       name="managerName"
                                       value="${building.managerName}"/>
                            </div>
                        </div>

                        <div class=" form-group">
                            <label class="col-sm-3 control-label no-padding-right">
                                Số điện
                                thoại quản lý
                            </label>

                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control"
                                       name="managerPhone"
                                       value="${building.managerPhone}"/>
                            </div>
                        </div>

                        <div class=" form-group">
                            <label class="col-sm-3 control-label no-padding-right">
                                Phí môi
                                giới
                            </label>

                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control"
                                       name="brokerageFee"
                                       value="${building.brokerageFee}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"> Chọn sản phẩm
                            </label>

                            <div class="col-sm-9">
                                <form:checkboxes path="buildingTypes" items="${typeMaps}"></form:checkboxes>
                            </div>
                        </div>

                        <div class="
                                   clearfix
                                   form-actions">
                            <div class="col-md-offset-3 col-md-9">
                                <c:if test="${building.id == null}">
                                    <button class="btn btn-info"
                                            type="button"
                                            id="btnAddBuilding" onclick="ChuyenTrang()">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Thêm
                                        tòa
                                        nhà
                                    </button>
                                </c:if>
                                <c:if test="${building.id != null}">
                                    <button class="btn btn-info"
                                            type="button"
                                            id="btnAddBuilding">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Cập nhật tòa nhà
                                    </button>
                                </c:if>
                                <button class="btn"
                                        type="reset">
                                    <i class="ace-icon fa fa-undo bigger-110"></i>
                                    Hủy
                                </button>
                            </div>
                        </div>
                        <form:hidden path="id" id="buildingID"/>
                    </form:form>
                </div><!-- /.col -->
            </div><!-- /.row -->
            <div class="space-24"></div>
        </form>
    </div><!-- /.col -->
</div><!-- /.row -->
<script>
    $('#btnAddBuilding').click(function () {
        var data = {};
        var formData = $('#formEdit').serializeArray();
        var buildingTypes = [];
        $.each(formData, function (indexInArray, valueOfElement) {
            if (valueOfElement.name == 'buildingTypes') {
                buildingTypes.push(valueOfElement.value);
            } else {
                data["" + valueOfElement.name + ""] = valueOfElement.value;
            }
        });
        data['buildingTypes'] = buildingTypes;
        addBuilding(data);
    });

    function addBuilding(data) {
        $.ajax({
            type: 'POST',
            url: '${buildingAPI}',
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json",
            success: function (res) {
                window.location.href = "<c:url value='/admin/building-edit-"+res.id+"?message=update_success'/>";
                alert("Cập nhật thành công");
            },
            error: function (res) {
                window.location.href = "<c:url value='/admin/building-edit-"+res.id+"?message=error_system'/>";
            }
        });
    }

    function ChuyenTrang() {
        location.assign("/admin/building-list");
    }

</script>
</body>
</html>
