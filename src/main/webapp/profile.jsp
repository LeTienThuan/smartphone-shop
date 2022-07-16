<%@ page import="com.example.smartphoneshop.entities.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>Profile - ShopGrids Bootstrap 5 eCommerce HTML Template.</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg"/>

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css"/>
</head>

<body>
<c:import url="/header.jsp"/>

<!-- Start Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 col-md-6 col-12">
                <div class="breadcrumbs-content">
                    <h1 class="page-title">Profile</h1>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
                <ul class="breadcrumb-nav">
                    <li><a href="<%=request.getContextPath()%>"><i class="lni lni-home"></i> Home</a></li>
                    <li>Profile</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End Breadcrumbs -->

<!-- Start Account Register Area -->
<div class="account-login section">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                <%Account account = (Account) session.getAttribute("account");%>
                <div class="register-form">
                    <div class="title">
                        <h3>My Profile</h3>
                    </div>
                    <form id="update-profile-form" class="row"
                          method="post" action="<%=request.getContextPath() + "/user/profile/update"%>">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <span>E-mail: <%=account.getEmail()%></span>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <span>Password: ****** <a
                                        href="<%=request.getContextPath() + "/user/profile/change-password"%>">Change password</a></span>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="reg-name">Name</label>
                                <input value="<%=account.getName()%>" class="form-control" name="name" type="text"
                                       id="reg-name">
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="reg-phone">Phone Number</label>
                                <input value="<%=account.getPhone()%>" class="form-control" name="phone" type="text"
                                       id="reg-phone"/>
                                <span style="color: red" id="msg-error-phone"></span>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="reg-gender">Gender</label>
                                <select class="form-select" id="reg-gender" name="gender">
                                    <option value="" <%=account.getGender() == null ? "selected" : ""%>
                                            hidden
                                            disabled>Select an option
                                    </option>
                                    <option <%= account.getGender() != null
                                            && !account.getGender().equals("")
                                            && account.getGender().equals("male")
                                            ? "selected"
                                            : ""%>
                                            value="male">Male
                                    </option>
                                    <option <%= account.getGender() != null
                                            && !account.getGender().equals("")
                                            && account.getGender().equals("female")
                                            ? "selected"
                                            : ""%>
                                            value="female">Female
                                    </option>
                                    <option <%= account.getGender() != null
                                            && !account.getGender().equals("")
                                            && account.getGender().equals("other")
                                            ? "selected"
                                            : ""%>
                                            value="other">Other
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="reg-birth">Birth</label>
                                <input value="<%=account.getBirth()%>" id="reg-birth" class="form-control" type="date"
                                       name="birth">
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="reg-address">Address</label>
                                <input value="<%=account.getAddress() != null
                                ? account.getAddress()
                                : ""%>"
                                       id="reg-address" class="form-control"
                                       type="text" name="address">
                            </div>
                        </div>
                        <div class="button">
                            <button class="btn" type="submit">Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Account Register Area -->
<c:import url="/footer.jsp"/>
<!-- ========================= scroll-top ========================= -->
<a href="#" class="scroll-top">
    <i class="lni lni-chevron-up"></i>
</a>

<!-- ========================= JS here ========================= -->
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/tiny-slider.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/glightbox.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>

</html>
