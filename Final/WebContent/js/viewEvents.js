
//  포커스 됬을 경우
function focusingIn() {

    var option = document.querySelector(".search-options");
    var searchText = document.querySelector(".list-search");
    var searchFomr = document.querySelector(".searchForm");
    var searchTap = document.querySelector(".search-tap");

    searchFomr.style.width = '534px';
    searchFomr.style.height = '180px';

    searchTap.style.width = '534px';

    option.style.opacity = '1';
    option.style.width = '532px';
    option.style.zIndex = '1000';
    option.style.height = '134px';
    option.style.boxShadow = '0 5px 7px rgba(0,0,0,0.1),0 7px 15px rgba(26, 26, 29, 0.08)';

    searchText.style.width = '534px';
    searchText.style.brderRadius = '3px 3px 0px 0px';
    searchText.style.boxShadow = '0 5px 7px rgba(0,0,0,0.1),0 7px 15px rgba(26, 26, 29, 0.08)';
}

$(document).ready(function () {

    var optionsArr = new Array();
    var options = '';

    // 검색창 호버 이벤트
    $('.list-search, .btn-search').hover(function () {
        $('.list-search').css({ 'boxShadow': ' 3px 5px 7px rgba(0,0,0,0.1),3px 7px 15px rgba(26, 26, 29, 0.08)' })
    },
        function () {
            $('.list-search').css({ 'boxShadow': ' 0 2px 4px rgba(0,0,0,0.1),0 4px 12px rgba(26, 26, 29, 0.08)' })
        }
    );

    // 검색창 및 카테고리 자기 영역 외 클릭시 닫기
    $('body').click(function (e) {
        if ($('.search-options').css('opacity') == 1) {
            if (!$('.searchForm').has(e.target).length) {
                $('.search-options').css({
                    'width': '439px',
                    'height': '0px',
                    'overflow': 'hidden',
                    'zIndex': '0',
                    'opacity': '0'
                })
                $('.list-search').css({
                    'width': '439px',
                    'brderRadius': '3px',
                    'boxShadow': ' 0 2px 4px rgba(0,0,0,0.1),0 4px 12px rgba(26, 26, 29, 0.08)'
                })
                $('.searchForm').css({
                    'width': '441px',
                    'height': '46px'
                })
                $('.search-tap').css('width', '441px')
            }
        }
    })
    
     $('.btn-category, .btn-buttonBar').click(function () {
        if ($(this).val() == 'all') {

        } else if ($(this).val() == 'purifier') {

        } else if ($(this).val() == 'refrigerator') {

        } else if ($(this).val() == 'tv') {

        } else {

        }
    });


    // ------------------------------------------------------------------------------
    // 옵션 버튼 호버 이벤트
    $('#btn-option').hover(function () {
        $('#btn-option').css({ 'boxShadow': ' 0px 2px 4px rgba(0,0,0,0.1),0 4px 12px rgba(26, 26, 29, 0.08)' })
    },
        function () {
            if ($('#btn-option').val() == 'true') {
                $('#btn-option').css({ 'boxShadow': ' 0px 2px 4px rgba(0,0,0,0.1),0 4px 12px rgba(26, 26, 29, 0.08)' })
            } else {
                $('#btn-option').css({ 'boxShadow': 'none' })
            }
        }
    );

    // 옵션 버튼 클릭 이벤트
    $('#btn-option').click(function () {
        if ($(this).val() == 'false') {
            $(this).attr('class', 'btn-optionFocus');
            $('#option-main').attr('class', 'option-mainFocus');
            $('.ani-option').css({ 'opacity': '1' })
            $(this).val('true');
        } else {
            $(this).val('false');
            $(this).attr('class', 'btn-option');
            $('#option-main').attr('class', 'option-main');
            $('.ani-option').css({ 'opacity': '0' })
            $('.btn-categoryOpFocus').attr('class', 'btn-categoryOp');
            options = '';
            optionsArr = new Array();
        }
    });

    // 옵션 버튼 제외 영영 클릭 시 닫기
    $('body').click(function (e) {
        if ($('#option-main').css('height') != '0px') {
            if (!$('#option-main').has(e.target).length) {
                $('#option-main').attr('class', 'option-main');
                $('#btn-option').attr('class', 'btn-option');
                $('#btn-option').val('false');
                $('.ani-option').css({ 'opacity': '0' })
                $('.btn-categoryOpFocus').attr('class', 'btn-categoryOp');
                options = '';
                optionsArr = new Array();
            }
        }
    });
    // ------------------------------------------------------------------------------
    // 카테고리옵션 클릭버튼
    $('.btn-categoryOp').click(function () {

        // ---------------------정수기-------------------------
        // //// 브랜드
        if ($(this).val() == 'skmagic') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#lg').attr('class', 'btn-categoryOp');
            $('#picogram').attr('class', 'btn-categoryOp');
            brand = 'sk매직'
        } else if ($(this).val() == 'lg') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#skmagic').attr('class', 'btn-categoryOp');
            $('#picogram').attr('class', 'btn-categoryOp');
            brand = 'LG'
        } else if ($(this).val() == 'picogram') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#skmagic').attr('class', 'btn-categoryOp');
            $('#lg').attr('class', 'btn-categoryOp');
            brand = '피코그램'
        }
        // //// 종류
        else if ($(this).val() == 'col_hot') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#col').attr('class', 'btn-categoryOp');
            $('#ice').attr('class', 'btn-categoryOp');
            optionsArr[0] = '냉온정수기'
        } else if ($(this).val() == 'col') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#col_hot').attr('class', 'btn-categoryOp');
            $('#ice').attr('class', 'btn-categoryOp');
            optionsArr[0] = '냉정수기'
        } else if ($(this).val() == 'ice') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#col_hot').attr('class', 'btn-categoryOp');
            $('#col').attr('class', 'btn-categoryOp');
            optionsArr[0] = '얼음정수기'
        }
        // // 크기
        else if ($(this).val() == 'middle') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#stand').attr('class', 'btn-categoryOp');
            $('#under').attr('class', 'btn-categoryOp');
            optionsArr[1] = '미들형'
        } else if ($(this).val() == 'stand') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#middle').attr('class', 'btn-categoryOp');
            $('#under').attr('class', 'btn-categoryOp');
            optionsArr[1] = '스탠드형'
        } else if ($(this).val() == 'under') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#middle').attr('class', 'btn-categoryOp');
            $('#stand').attr('class', 'btn-categoryOp');
            optionsArr[1] = '언더씽크형'
        }

        // --------------------냉장고-------------------------------
        // 브랜드
        else if ($(this).val() == 'samsung') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#lg-refrigerator').attr('class', 'btn-categoryOp');
            $('#daewoo').attr('class', 'btn-categoryOp');
            brand = 'SAMSUNG'
        } else if ($(this).val() == 'lg1') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#samsung').attr('class', 'btn-categoryOp');
            $('#daewoo').attr('class', 'btn-categoryOp');
            brand = 'LG'
        } else if ($(this).val() == 'daewoo') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#samsung').attr('class', 'btn-categoryOp');
            $('#lg-refrigerator').attr('class', 'btn-categoryOp');
            brand = 'DAEWOO'
        }
        // //// 품목
        else if ($(this).val() == 'normal') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#doublegateDoor').attr('class', 'btn-categoryOp');
            $('#threeDoor').attr('class', 'btn-categoryOp');
            $('#fourDoor').attr('class', 'btn-categoryOp');
            optionsArr[0] = '일반형'
        } else if ($(this).val() == 'doublegateDoor') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#normalDoor').attr('class', 'btn-categoryOp');
            $('#threeDoor').attr('class', 'btn-categoryOp');
            $('#fourDoor').attr('class', 'btn-categoryOp');
            optionsArr[0] = '양문형'
        } else if ($(this).val() == 'threeDoor') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#normalDoor').attr('class', 'btn-categoryOp');
            $('#doublegateDoor').attr('class', 'btn-categoryOp');
            $('#fourDoor').attr('class', 'btn-categoryOp');
            optionsArr[0] = '3문형'
        } else if ($(this).val() == 'fourDoor') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#normalDoor').attr('class', 'btn-categoryOp');
            $('#doublegateDoor').attr('class', 'btn-categoryOp');
            $('#threeDoor').attr('class', 'btn-categoryOp');
            optionsArr[0] = '4문형'
        }
        // // 용량
        else if ($(this).val() == 'smallLiter') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#mediumLiter').attr('class', 'btn-categoryOp');
            $('#bigLiter').attr('class', 'btn-categoryOp');
            optionsArr[1] = 'smallLiter'
        } else if ($(this).val() == 'mediumLiter') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#smallLiter').attr('class', 'btn-categoryOp');
            $('#bigLiter').attr('class', 'btn-categoryOp');
            optionsArr[1] = 'mediumLiter'
        } else if ($(this).val() == 'bigLiter') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#smallLiter').attr('class', 'btn-categoryOp');
            $('#mediumLiter').attr('class', 'btn-categoryOp');
            optionsArr[1] = 'bigLiter'
        }
        // 에너지 효율
        else if ($(this).val() == 'first_effi') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#secondEffi').attr('class', 'btn-categoryOp');
            $('#thirdEffi').attr('class', 'btn-categoryOp');
            $('#fourthEffi').attr('class', 'btn-categoryOp');
            $('#fifthEffi').attr('class', 'btn-categoryOp');
            optionsArr[2] = '1등급'
        } else if ($(this).val() == 'second_effi') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#firstEffi').attr('class', 'btn-categoryOp');
            $('#thirdEffi').attr('class', 'btn-categoryOp');
            $('#fourthEffi').attr('class', 'btn-categoryOp');
            $('#fifthEffi').attr('class', 'btn-categoryOp');
            optionsArr[2] = '2등급'
        } else if ($(this).val() == 'third_effi') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#firstEffi').attr('class', 'btn-categoryOp');
            $('#secondEffi').attr('class', 'btn-categoryOp');
            $('#fourthEffi').attr('class', 'btn-categoryOp');
            $('#fifthEffi').attr('class', 'btn-categoryOp');
            optionsArr[2] = '3등급'
        } else if ($(this).val() == 'fourth_effi') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#firstEffi').attr('class', 'btn-categoryOp');
            $('#secondEffi').attr('class', 'btn-categoryOp');
            $('#thirdEffi').attr('class', 'btn-categoryOp');
            $('#fifthEffi').attr('class', 'btn-categoryOp');
            optionsArr[2] = '4등급'
        } else if ($(this).val() == 'fifth_effi') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#firstEffi').attr('class', 'btn-categoryOp');
            $('#secondEffi').attr('class', 'btn-categoryOp');
            $('#thirdEffi').attr('class', 'btn-categoryOp');
            $('#fourthEffi').attr('class', 'btn-categoryOp');
            optionsArr[2] = '5등급'
        }

        // --------------------TV-------------------------------
        // 브랜드
        else if ($(this).val() == 'samsung-tv') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#lg-tv').attr('class', 'btn-categoryOp');
            $('#sony').attr('class', 'btn-categoryOp');
            brand = 'SAMSUNG';
        } else if ($(this).val() == 'lg-tv') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#samsung-tv').attr('class', 'btn-categoryOp');
            $('#sony').attr('class', 'btn-categoryOp');
            brand = 'LG';
        } else if ($(this).val() == 'sony') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#samsung-tv').attr('class', 'btn-categoryOp');
            $('#lg-tv').attr('class', 'btn-categoryOp');
            brand = 'SONY';
        }
        // 해상도
        else if ($(this).val() == 'normalHD') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#fullhd').attr('class', 'btn-categoryOp');
            $('#ultrahd').attr('class', 'btn-categoryOp');
            optionsArr[0] = 'HD';
        } else if ($(this).val() == 'fullhd') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#hd').attr('class', 'btn-categoryOp');
            $('#ultrahd').attr('class', 'btn-categoryOp');
            optionsArr[0] = '풀HD';
        } else if ($(this).val() == 'ultrahd') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#hd').attr('class', 'btn-categoryOp');
            $('#fullhd').attr('class', 'btn-categoryOp');
            optionsArr[0] = '울트라HD';
        }
        // 화면 패널
        else if ($(this).val() == 'ledtv') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#oled').attr('class', 'btn-categoryOp');
            $('#pdp').attr('class', 'btn-categoryOp');
            optionsArr[1] = 'LEDTV';
        } else if ($(this).val() == 'oled') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#ledtv').attr('class', 'btn-categoryOp');
            $('#pdp').attr('class', 'btn-categoryOp');
            optionsArr[1] = 'OLED';
        } else if ($(this).val() == 'pdp') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#ledtv').attr('class', 'btn-categoryOp');
            $('#oled').attr('class', 'btn-categoryOp');
            optionsArr[1] = 'PDP';
        }
        // 화면 패널
        else if ($(this).val() == 'smallInch') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#mediumInch').attr('class', 'btn-categoryOp');
            $('#bigInch').attr('class', 'btn-categoryOp');
            optionsArr[2] = 'smallInch';
        } else if ($(this).val() == 'mediumInch') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#smallInch').attr('class', 'btn-categoryOp');
            $('#bigInch').attr('class', 'btn-categoryOp');
            optionsArr[2] = 'mediumInch';
        } else if ($(this).val() == 'bigInch') {
            $(this).attr('class', 'btn-categoryOpFocus');
            $('#smallInch').attr('class', 'btn-categoryOp');
            $('#mediumInch').attr('class', 'btn-categoryOp');
            optionsArr[2] = 'bigInch';
        }
    });

    $('.optionSubmit').click(function () {
        for (var i = 0; i < optionsArr.length; i++) {
            if (optionsArr[i] == undefined) {
                optionsArr[i] = '';
            }
            options += optionsArr[i];
            if(i != optionsArr.length - 1){
            	options += "/";
            }            
        }
        alert(optionsArr.length + '/확인/' + options);
        location.href="./goodslist.do?brand=" + brand + "&option=" + options + "&category=" + $("#_category").val() + "&searchNum=4";
    });
    
    $('.btn_category, .btn_buttonBar').click(function() {
    	$('#_keyword').val(null);
    	$('#_options').val(null);
    	if ($(this).val() == "1") {
			$('#_searchNum').val(1);
			$("#form_search").attr("target", "_self").attr("action",
	    	"goodslist.do").submit();
		}else{
			$('#_searchNum').val(3);
			$('#_category').val($(this).val())
			alert($(this).val() + ' ///  ' + $('#_category').val())
			$("#form_search").attr("target", "_self").attr("action",
	    	"goodslist.do").submit();
		}
    })

});

