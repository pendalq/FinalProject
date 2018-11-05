<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html lang="ko-KR">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>GOODS ALL LIST</title>
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/goodsAllList.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/webfonts.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/grid.css">
	<script src="<%=request.getContextPath()%>/js/viewEvent6.js"></script> 

	<script type="text/javascript">
		function goPage(pageNumber) {
			$("#_pageNumber").val(pageNumber);
			/* alert('1234'); */
			$("#form_search").attr("target", "_self").attr("action",
				"goodslist.do").submit();
		}
		
	</script>

</head>

<body>
	<!-- 전체 페이지 -->
	<div id="wrap">
		<!-- 메인 -->
		<main id="wrap-container">
			<!-- 메인 상단 (검색 / 카테고리) -->
			<section id="container-top">
				<h2 hidden>검색 옵션을 위한 메인 메뉴 상단입니다.</h2>
				<!-- category 1170 * 160 -->
				<div class="searchForm" onclick="focusingIn()">
					<div class="search-tap">
						<div class="searchbar">
							<form action="" method="post" id="form_search">
								<button type="button" id="btn_search"></button>	
								<input type="text" name="keyword" id="_keyword" value="${keyword}" class="list-search" placeholder="찾으시는 상품을 검색하세요." autocomplete="off" required="required"> 		
								<input type="hidden" name="category" id="_category" class="in-category" value="${category} ">
								<input type="hidden" name="options" id="_options" class="in-options" value="${options}">
							 	<input type="hidden" name="searchNum" id="_searchNum" value="${searchNum}">
								<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}" />
								<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage"value="${(empty recordCountPerPage)?10:recordCountPerPage}" />
							</form>
						</div>
					</div>
					<div id="search-options" class="search-options">
						<span class="title-category">찾으시는 상품이 있으신가요?</span>
						<ul class="category">
							<li><button type="button" class="btn_category" value="1">모두</button></li>
							<li><button type="button" class="btn_category" value="정수기">정수기</button></li>
							<li><button type="button" class="btn_category" value="냉장고">냉장고</button></li>
							<li><button type="button" class="btn_category" value="TV">TV</button></li>
						</ul>
						<!-- 에이젝스 검색 출력 -->
					</div>
				</div>

				<!-- 카테고리 값 저장 ---------------------------------- -->
				<c:set var="c_category" value="${category}" />
				<%-- <c:out value="${c_category }"/> --%>

				<!-- 카테고리 값에 따른 옵션창 on/off ---------------------------------- --> 
				<c:if test="${ c_category ne null and c_category ne '' }">
					<div class="option-header">
						<button type="button" id="btn-option" class="btn-option" value="false">${categoryName}</button>
						<div id="option-main" class="option-main">

							<c:choose>
								<c:when test="${c_category eq '정수기'}">  <!-- 이부분문제같은데 음 맞는데? 틀린게 없어 보이는데  -->
									<!-- ---------------------정수기 옵션-------------------- -->
									<ul class="water-option ani-option">
										<li class="water-brand">
											<div class="option">
												<span class="option-title">브랜드</span>
												<ul>
													<li><button type="button" id="skmagic" class="btn-categoryOp" value="skmagic">SK매직</button></li>
													<li><button type="button" id="lg" class="btn-categoryOp" value="lg">LG</button></li>
													<li><button type="button" id="picogram" class="btn-categoryOp" value="picogram">피코그램</button></li>
												</ul>
											</div>
										</li>
										<li class="water-type">
											<div class="option">
												<span class="option-title">정수기 종류</span>
												<ul>
													<li><button type="button" id="col_hot" class=" btn-categoryOp" value="col_hot">냉/온정수기</button></li>
													<li><button type="button" id="col" class="btn-categoryOp" value="col">냉정수</button></li>
													<li><button type="button" id="ice" class="btn-categoryOp" value="ice">얼음정수기</button></li>
												</ul>
											</div>
										</li>
										<li class="water-size">
											<div class="option">
												<span class="option-title">크기</span>
												<ul>
													<li><button type="button" id="middle" class="btn-categoryOp" value="middle">미들형</button></li>
													<li><button type="button" id="stand" class="btn-categoryOp" value="stand">스탠드형</button></li>
													<li><button type="button" id="under" class="btn-categoryOp" value="under">언더씽크형</button></li>
												</ul>
											</div>
										</li>
										<li id="li-optionSub"><button type="button" class="optionSubmit">적용</button></li>
									</ul>
								</c:when>
								
								<c:when test="${c_category eq '냉장고'}">
									<!-- ---------------------냉장고 옵션-------------------- -->
									<ul class="refrigerator-option ani-option">
										<li class="refrigerator-brand">
											<div class="option">
												<span class="option-title">브랜드</span>
												<ul>
													<li><button type="button" id="samsung" class="btn-categoryOp" value="samsung">삼성</button></li>
													<li><button type="button" id="lg-refrigerator" class="btn-categoryOp" value="lg1">LG</button></li>
													<li><button type="button" id="daewoo" class="btn-categoryOp" value="daewoo">대우</button></li>
												</ul>
											</div>
										</li>
										<li class="water-type">
											<div class="option">
												<span class="option-title">품목</span>
												<ul>
													<li><button type="button" id="normalDoor" class=" btn-categoryOp" value="normal">일반형</button></li>
													<li><button type="button" id="doublegateDoor" class="btn-categoryOp" value="doublegateDoor">양문형</button></li>
													<li><button type="button" id="threeDoor" class="btn-categoryOp" value="threeDoor">3문형</button></li>
													<li><button type="button" id="fourDoor" class="btn-categoryOp" value="fourDoor">4문형</button></li>
												</ul>
											</div>
										</li>
										<li class="water-size">
											<div class="option">
												<span class="option-title">에너지 효율</span>
												<ul>
													<li><button type="button" id="firstEffi" class="btn-categoryOp" value="first_effi">1등급</button></li>
													<li><button type="button" id="secondEffi" class="btn-categoryOp" value="second_effi">2등급</button></li>
													<li><button type="button" id="thirdEffi" class="btn-categoryOp" value="third_effi">3등급</button></li>
													<li><button type="button" id="fourthEffi" class="btn-categoryOp" value="fourth_effi">4등급</button></li>
													<li><button type="button" id="fifthEffi" class="btn-categoryOp" value="fifth_effi">5등급</button></li>
												</ul>
											</div>
										</li>
										<li id="li-optionSub"><button type="button" class="optionSubmit">적용</button></li>
									</ul>
								</c:when>
								
								<c:when test="${c_category eq 'TV'}">
									<!-- ---------------------TV 옵션-------------------- -->
									<ul class="tv-option ani-option">
										<li class="tv-brand">
											<div class="option">
												<span class="option-title">브랜드</span>
												<ul>
													<li><button type="button" id="samsung-tv" class="btn-categoryOp" value="samsung-tv">삼성</button></li>
													<li><button type="button" id="lg-tv" class="btn-categoryOp" value="lg-tv">LG</button></li>
													<li><button type="button" id="sony" class="btn-categoryOp" value="sony">소니</button></li>
												</ul>
											</div>
										</li>
										<li class="water-type">
											<div class="option">
												<span class="option-title">해상도</span>
												<ul>
													<li><button type="button" id="hd" class=" btn-categoryOp" value="normalhd">HD</button></li>
													<li><button type="button" id="fullhd" class="btn-categoryOp" value="fullhd">FullHD</button></li>
													<li><button type="button" id="ultrahd" class="btn-categoryOp" value="ultrahd">UltraHD</button></li>
												</ul>
											</div>
										</li>
										<li class="water-size">
											<div class="option">
												<span class="option-title">화면 패널</span>
												<ul>
													<li><button type="button" id="ledtv" class="btn-categoryOp" value="ledtv">LED</button></li>
													<li><button type="button" id="oled" class="btn-categoryOp" value="oled">OLED</button></li>
													<li><button type="button" id="pdp" class="btn-categoryOp" value="pdp">PDP</button></li>
												</ul>
											</div>
										</li>
										<li id="li-optionSub"><button type="button" class="optionSubmit">적용</button></li>
									</ul>
								</c:when>	
							</c:choose>
							
						</div>
					</div>
				</c:if>
				<!-- 카테고리 옵션창 if문 끝 ---------------------------------- -->
			</section>

			<!-- 상품 리스트 -->
			<section id="container-main">

				<!-- ---------- 카테고리가 null or '' 경우 카테고리 버튼 생성 -------------------- -->
				<c:if test="${c_category eq null or c_category eq ''}">
					<!-- 상품 카테고리 링크 버튼 -->
					<div class="buttonBar">
						<ul class="buttonBar-list">
							<li>
								<button class="btn_buttonBar" value="정수기">
									<div class="btn-backImage waterBak"></div>
									<span class="btn-title">정수기</span>
								</button>
							</li>
							<li>
								<button class="btn_buttonBar" value="냉장고">
									<div class="btn-backImage washerBak"></div>
									<span class="btn-title">냉장고</span>
								</button>
							</li>
							<li>
								<button class="btn_buttonBar" value="TV">
									<div class="btn-backImage tvBak"></div>
									<span class="btn-title">TV</span>
								</button>
							</li>
						</ul>
					</div>
				</c:if>


				<div class="item-list">
					<h4>
						총 <span>${totalRecordCount}</span>개의 상품이 준비되어 있습니다.
					</h4>
					<ul class="item-ul">
						<!--------------------------------------------- 아이템 출력--------------------------------------------  -->
						<c:forEach items="${goods}" var="goods" varStatus="vs">
							<li class="item">
								<div class="item-image">
									${goods.imageName }<%-- <img src="<%=request.getContextPath()%>/image/titleImages/${goods.imageloc}" alt="삼성세탁기"> --%>
								</div>
								<div class="item-imageHover">
									<a href="goodsdetail.do?seq=${goods.seq }&pageNumber=0" class="btn-rental"><span>렌탈 신청하기</span></a>
								</div>
								<div class="item-detail">
									<em class="item-brand">${goods.brand}</em>
									<em class="item-goods">${goods.title}</em>
									<em class="item-price">₩${goods.price}/월</em>
								</div>
							</li>
						</c:forEach>
					</ul>

					<!---------------------------------------------페이징--------------------------------------------->
					<div id="paging_wrap">
						<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
							<jsp:param value="${pageNumber}" name="pageNumber" />
							<jsp:param value="${pageCountPerScreen}" name="pageCountPerScreen" />
							<jsp:param value="${recordCountPerPage}" name="recordCountPerPage" />
							<jsp:param value="${totalRecordCount}" name="totalRecordCount" />
						</jsp:include>
					</div>
				</div>
			</section>
			<!-- 그리드 레이아웃 도움 시작!! -->
			<div id="gridView" class="grid grid-act">
				<div class="grid-unit"></div>
				<div class="grid-unit"></div>
				<div class="grid-unit"></div>
				<div class="grid-unit"></div>
				<div class="grid-unit"></div>
				<div class="grid-unit"></div>
				<div class="grid-unit"></div>
				<div class="grid-unit"></div>
				<div class="grid-unit"></div>
				<div class="grid-unit"></div>
				<div class="grid-unit"></div>
				<div class="grid-unit"></div>
			</div>
			<div id="lineView"></div>
			<!-- 그리드 종료!! -->
		</main>

	</div>

</body>


</html>