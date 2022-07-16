<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>Login - ShopGrids Bootstrap 5 eCommerce HTML Template.</title>
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
                    <h1 class="page-title">Login</h1>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
                <ul class="breadcrumb-nav">
                    <li><a href="index.jsp"><i class="lni lni-home"></i> Home</a></li>
                    <li>Login</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End Breadcrumbs -->

<!-- Start Account Login Area -->
<%
    String email = "", password = "", isRemember = "";
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("email")) email = cookie.getValue();
            else if (cookie.getName().equals("password")) password = cookie.getValue();
            else if (cookie.getName().equals("remember")) isRemember = cookie.getValue();
        }
    }
%>
<div class="account-login section">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                <form class="card login-form" method="post"
                      action="LoginController">
                    <div class="card-body">
                        <div class="title">
                            <h3>Login Now</h3>
                            <p>You can login using your social media account or email address.</p>
                        </div>
                        <div class="social-login">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-12"><a class="btn facebook-btn"
                                                                         href="javascript:void(0)"><i
                                        class="lni lni-facebook-filled"></i> Facebook
                                    login</a></div>
                                <div class="col-lg-4 col-md-4 col-12"><a class="btn twitter-btn"
                                                                         href="javascript:void(0)"><i
                                        class="lni lni-twitter-original"></i> Twitter
                                    login</a></div>
                                <div class="col-lg-4 col-md-4 col-12"><a class="btn google-btn"
                                                                         href="javascript:void(0)"><i
                                        class="lni lni-google"></i> Google login</a>
                                </div>
                            </div>
                        </div>
                        <div class="alt-option">
                            <span>Or</span>
                        </div>
                        <div class="form-group input-group">
                            <label for="reg-email">Email</label>
                            <input class="form-control" value="<%=email%>" name="email" type="email" id="reg-email">
                        </div>
                        <div class="form-group input-group">
                            <label for="reg-pass">Password</label>
                            <input class="form-control" value="<%=password%>" name="password" type="password"
                                   id="reg-pass">
                        </div>
                        <div class="d-flex flex-wrap justify-content-between bottom-content">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input width-auto" name="remember-me"
                                       id="rememberMe"
                                    <%=isRemember.equals("1") ? "checked" : ""%>
                                >
                                <label class="form-check-label" for="rememberMe">Remember me</label>
                            </div>
                            <a class="lost-pass" href="<%=request.getContextPath() + "/forgot-password"%>">Forgot
                                password?</a>
                        </div>
                        <span id="msg-login-error" style="color: red">
                                <c:out value="${message}"/>
                            </span>
                        <div class="button">
                            <button class="btn" type="submit">Login</button>
                        </div>
                        <p class="outer-link">Don't have an account? <a
                                href="<%=request.getContextPath() + "/register"%>">Register here </a>
                        </p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- End Account Login Area -->
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
<script src="${pageContext.request.contextPath}/assets/js/validate-login-form.js"></script>
</body>

</html>
