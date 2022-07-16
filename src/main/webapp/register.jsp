<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>Register - ShopGrids Bootstrap 5 eCommerce HTML Template.</title>
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
                    <h1 class="page-title">Registration</h1>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
                <ul class="breadcrumb-nav">
                    <li><a href="<%=request.getContextPath()%>"><i class="lni lni-home"></i> Home</a></li>
                    <li>Registration</li>
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
                <div class="register-form">
                    <div class="title">
                        <h3>No Account? Register</h3>
                        <p>Registration takes less than a minute but gives you full control over your orders.</p>
                    </div>
                    <form id="register-form" class="row"
                          method="post" onsubmit="return isValidateRegisterForm()"
                          action="RegisterController">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="reg-name">Name</label>
                                <input class="form-control" value="<c:out value="${name}"/>" name="name" type="text"
                                       id="reg-name">
                                <span style="color: red" id="msg-error-name"></span>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="reg-email">E-mail</label>
                                <input class="form-control" value="<c:out value="${email}"/>" name="email" type="email"
                                       id="reg-email">
                                <span style="color: red" id="msg-error-email">
                                    <c:out value="${message}"/>
                                </span>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="reg-phone">Phone Number</label>
                                <input class="form-control" value="<c:out value="${phone}"/>" name="phone" type="text"
                                       id="reg-phone"/>
                                <span style="color: red" id="msg-error-phone"></span>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="reg-pass">Password</label>
                                <input class="form-control" name="pass" type="password" id="reg-pass">
                                <span style="color: red" id="msg-error-pass"></span>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="reg-pass-confirm">Confirm Password</label>
                                <input class="form-control" name="pass-confirm" type="password" id="reg-pass-confirm">
                                <span style="color: red" id="msg-error-pass-confirm"></span>
                            </div>
                        </div>
                        <div class="button">
                            <button class="btn" type="submit">Register</button>
                        </div>
                        <p class="outer-link">Already have an account? <a href="login.jsp">Login Now</a>
                        </p>
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
<script src="${pageContext.request.contextPath}/assets/js/validate-register-form.js"></script>

</body>

</html>
