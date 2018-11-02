<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />



	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<title>Main</title>

<link rel="shortcut icon" type="image/x-icon"
	href="design/images/favicon.ico">
<link rel="apple-touch-icon" href="design/apple-touch-icon.png">

<!-- Bootstrap Fremwork Main Css -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/design/css/bootstrap.min.css">
<!-- All Plugins css -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/design/css/plugins.css">
<!-- Theme shortcodes/elements style -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/design/css/shortcode/shortcodes.css">
<!-- Theme main style -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/design/style.css">
<!-- Responsive css -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/design/css/responsive.css">
<!-- User style -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/design/css/custom.css">

 <script src="<c:out value="design/js/main.js"/>"></script>
 <script src="<c:out value="design/js/vendor/jquery-1.12.4.min.js"/>"></script>
 <script src="<c:out value="design/js/popper.min.js"/>"></script>
 <script src="<c:out value="design/js/bootstrap.min.js"/>"></script>
 <script src="<c:out value="design/js/plugins.js"/>"></script>
    
    
    
    
    <style type="text/css">
    .list_table{
    	border-left: none;
    	border-right: none;
    	border-top: 1px solid black;
    	border-bottom: 1px solid black;
    }
    
    </style>

</head>



<body>


 <!-- Start Our Product Area -->
        <section class="htc__product__area ptb--130 bg__white">
            <div class="container">
                <div class="htc__product__container">
                    <!-- Start Product MEnu -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="product__menu">
                                <button data-filter="*"  class="is-checked">최신상품</button>
                            </div>
                        </div>
                    </div>
                    <!-- End Product MEnu -->

                    <div class="row product__list">
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 col-md-4 cat--1 col-sm-12">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist[0].seq }">
                                             ${mainbbslist[0].imageName } 
                                         <!--  <img alt="" src="image/producti.png"> -->
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist[0].seq }">${mainbbslist[0].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist[0].price }</li>
                                    </ul>
                                </div>
                              		<div class="add__to__wishlist">
                                        <span class="ti-heart">${mainbbslist[0].liked }</span>
                                    </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 col-md-4 cat--1 col-sm-12">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist[1].seq }">
                                            ${mainbbslist[1].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist[1].seq }">${mainbbslist[1].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist[1].price }</li>
                                    </ul>
                                </div>
                         		<div class="add__to__wishlist">
                                	<span class="ti-heart">${mainbbslist[1].liked }</span>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 col-md-4 col-sm-12 cat--2">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist[2].seq }">
                                        	${mainbbslist[2].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist[2].seq }">${mainbbslist[2].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist[2].price }</li>
                                    </ul>
                                </div>
                                <div class="add__to__wishlist">
                                	<span class="ti-heart">${mainbbslist[2].liked }</span>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 col-md-4 col-sm-12 cat--4">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist[3].seq }">
                                        	${mainbbslist[3].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist[3].seq }">${mainbbslist[3].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist[3].price }</li>
                                    </ul>
                                </div>
                                <div class="add__to__wishlist">
                                	<span class="ti-heart">${mainbbslist[3].liked }</span>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 cat--1 col-md-4 col-sm-12 cat--2">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist[4].seq }">
                                        	${mainbbslist[4].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist[4].seq }">${mainbbslist[4].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist[4].price }</li>
                                    </ul>
                                </div>
                                <div class="add__to__wishlist">
                                	<span class="ti-heart">${mainbbslist[4].liked }</span>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 col-md-4 col-sm-12 cat--3">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist[5].seq }">
                                        	${mainbbslist[5].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist[5].seq }">${mainbbslist[5].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist[5].price }</li>
                                    </ul>
                                </div>
                                <div class="add__to__wishlist">
                                	<span class="ti-heart">${mainbbslist[5].liked }</span>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 col-md-4 col-sm-12 cat--2">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist[6].seq }">
                                        	${mainbbslist[6].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist[6].seq }">${mainbbslist[6].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist[6].price }</li>
                                    </ul>
                                </div>
                                <div class="add__to__wishlist">
                                	<span class="ti-heart">${mainbbslist[6].liked }</span>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 col-md-4 col-sm-12 cat--2">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist[7].seq }">
                                        	${mainbbslist[7].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist[7].seq }">${mainbbslist[7].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist[7].price }</li>
                                    </ul>
                                </div>
                                <div class="add__to__wishlist">
                                	<span class="ti-heart">${mainbbslist[7].liked }</span>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 col-md-4 col-sm-12 cat--4">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist[8].seq }">
                                        	${mainbbslist[8].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist[8].seq }">${mainbbslist[8].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist[8].price }</li>
                                    </ul>
                                </div>
                                <div class="add__to__wishlist">
                                	<span class="ti-heart">${mainbbslist[8].liked }</span>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 col-md-4 col-sm-12 cat--3">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist[9].seq }">
                                        	${mainbbslist[9].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist[9].seq }">${mainbbslist[9].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist[9].price }</li>
                                    </ul>
                                </div>
                                <div class="add__to__wishlist">
                                	<span class="ti-heart">${mainbbslist[9].liked }</span>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 col-md-4 col-sm-12 cat--4">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist[10].seq }">
                                        	${mainbbslist[10].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist[10].seq }">${mainbbslist[10].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist[10].price }</li>
                                    </ul>
                                </div>
                                <div class="add__to__wishlist">
                                	<span class="ti-heart">${mainbbslist[10].liked }</span>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 col-md-4 col-sm-12 cat--3">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist[11].seq }">
                                        	${mainbbslist[11].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist[11].seq }">${mainbbslist[11].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist[11].price }</li>
                                    </ul>
                                </div>
                                <div class="add__to__wishlist">
                                	<span class="ti-heart">${mainbbslist[11].liked }</span>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                    </div>
                </div>
            </div>
        </section>
        <!-- End Our Product Area -->


        <section class="htc__product__area ptb--130 bg__white">
            <div class="container">
                <div class="htc__product__container">
                    <!-- Start Product MEnu -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="product__menu">
                                <button data-filter="*"  class="is-checked">인기상품</button>
                            </div>
                        </div>
                    </div>
                    <!-- End Product MEnu -->
	                    <div class="row product__list">
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 col-md-4 cat--1 col-sm-12">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist2[0].seq }">
                                            ${mainbbslist2[0].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist2[0].seq }">${mainbbslist2[0].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist2[0].price }</li>
                                    </ul>
                                </div>
                              		<div class="add__to__wishlist">
                                        <span class="ti-heart">${mainbbslist2[0].liked }</span>
                                    </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 col-md-4 cat--1 col-sm-12">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist2[1].seq }">
                                            ${mainbbslist2[1].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist2[1].seq }">${mainbbslist2[1].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist2[1].price }</li>
                                    </ul>
                                </div>
                         		<div class="add__to__wishlist">
                                	<span class="ti-heart">${mainbbslist2[1].liked }</span>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 col-md-4 col-sm-12 cat--2">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist2[2].seq }">
                                        	${mainbbslist2[2].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist2[2].seq }">${mainbbslist2[2].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist2[2].price }</li>
                                    </ul>
                                </div>
                                <div class="add__to__wishlist">
                                	<span class="ti-heart">${mainbbslist2[2].liked }</span>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 col-md-4 col-sm-12 cat--4">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist2[3].seq }">
                                        	${mainbbslist2[3].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist2[3].seq }">${mainbbslist2[3].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist2[3].price }</li>
                                    </ul>
                                </div>
                                <div class="add__to__wishlist">
                                	<span class="ti-heart">${mainbbslist2[3].liked }</span>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 cat--1 col-md-4 col-sm-12 cat--2">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist2[4].seq }">
                                        	${mainbbslist2[4].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist2[4].seq }">${mainbbslist2[4].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist2[4].price }</li>
                                    </ul>
                                </div>
                                <div class="add__to__wishlist">
                                	<span class="ti-heart">${mainbbslist2[4].liked }</span>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 col-md-4 col-sm-12 cat--3">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist2[5].seq }">
                                        	${mainbbslist2[5].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist2[5].seq }">${mainbbslist2[5].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist2[5].price }</li>
                                    </ul>
                                </div>
                                <div class="add__to__wishlist">
                                	<span class="ti-heart">${mainbbslist2[5].liked }</span>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 col-md-4 col-sm-12 cat--2">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist2[6].seq }">
                                        	${mainbbslist2[6].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist2[6].seq }">${mainbbslist2[6].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist2[6].price }</li>
                                    </ul>
                                </div>
                                <div class="add__to__wishlist">
                                	<span class="ti-heart">${mainbbslist2[6].liked }</span>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 col-md-4 col-sm-12 cat--2">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist2[7].seq }">
                                        	${mainbbslist2[7].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist2[7].seq }">${mainbbslist2[7].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist2[7].price }</li>
                                    </ul>
                                </div>
                                <div class="add__to__wishlist">
                                	<span class="ti-heart">${mainbbslist2[7].liked }</span>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 col-md-4 col-sm-12 cat--4">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist2[8].seq }">
                                        	${mainbbslist2[8].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist2[8].seq }">${mainbbslist2[8].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist2[8].price }</li>
                                    </ul>
                                </div>
                                <div class="add__to__wishlist">
                                	<span class="ti-heart">${mainbbslist2[8].liked }</span>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 col-md-4 col-sm-12 cat--3">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist2[9].seq }">
                                        	${mainbbslist2[9].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist2[9].seq }">${mainbbslist2[9].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist2[9].price }</li>
                                    </ul>
                                </div>
                                <div class="add__to__wishlist">
                                	<span class="ti-heart">${mainbbslist2[9].liked }</span>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 col-md-4 col-sm-12 cat--4">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist2[10].seq }">
                                        	${mainbbslist2[10].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist2[10].seq }">${mainbbslist2[10].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist2[10].price }</li>
                                    </ul>
                                </div>
                                <div class="add__to__wishlist">
                                	<span class="ti-heart">${mainbbslist2[10].liked }</span>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                        <!-- Start Single Product -->
                        <div class="col-md-3 single__pro col-lg-3 col-md-4 col-sm-12 cat--3">
                            <div class="product foo">
                                <div class="product__inner">
                                    <div class="pro__thumb">
                                        <a href="goodsdetail.do?seq=${mainbbslist2[11].seq }">
                                        	${mainbbslist2[11].imageName }
                                        </a>
                                    </div>
                                </div>
                                <div class="product__details">
                                    <h2><a href="goodsdetail.do?seq=${mainbbslist2[11].seq }">${mainbbslist2[11].title }</a></h2>
                                    <ul class="product__price">
                                        <li class="new__price">${mainbbslist2[11].price }</li>
                                    </ul>
                                </div>
                                <div class="add__to__wishlist">
                                	<span class="ti-heart">${mainbbslist2[11].liked }</span>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
                    </div>
                </div>
            </div>
        </section>
        <!-- End Our Product Area -->
	
	<div>후기</div>
	<table class="list_table" style="width: 90%">
		<colgroup>
			<col style="70px" />
			<col style="70px" />
			<col style="70px" />
			<col style="70px" />
			<col style="70px" />
		</colgroup>
		<thead>
			<th>번호</th>
			<th>아이디</th>
			<th>물품번호</th>
			<th>제목</th>
			<th>등록일</th>
			<th>조회수</th>
		</thead>
		<tbody>
			<c:if test="${empty reviewlist }">
				<tr>
					<td>등록된 후기가 없습니다</td>
				</tr>
			</c:if>
			
			<c:forEach items="${reviewlist }" var="rl" varStatus="vs3">
				<tr class="_hover_tr">
					<td>${rl.seq }</td>
					<td>${rl.id }</td>
					<td>${rl.gseq }</td>
					<td>
						<a href='goodsdetail.do?seq=${rl.gseq}&reviewPageNumber=0'>
						${rl.title }</a></td>
					<td>${rl.wdate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	

</body>
</html>