$(document).ready(function (e) {

    $(".review_click").click(function (e) {


        if ($(this).val() == 1) {
            var str = $(this).siblings('.review_item_mainOff').children('.review_item_content').children('.review_content').text().length;
            $(this).val(0)

            if(str < 500){
                $(this).siblings('.review_item_mainOff').attr('class', 'review_item_mainOn');
                $(this).siblings('.review_item_mainOn').css({
                    'height': '100px'
                })
            }else if(str > 500){
                $(this).siblings('.review_item_mainOff').attr('class', 'review_item_mainOn');
                $(this).siblings('.review_item_mainOn').css({
                    'height': '300px'
                })
            }
            $(this).children('.review_item_headerOff').children(".review_openImgOff").attr('class', 'review_openImgOn');
            $(this).children('.review_item_headerOff').attr('class', 'review_item_headerOn')
        } else if ($(this).val() == 0) {
            $(this).val(1)
            $(this).siblings('.review_item_mainOn').css({
                'height': '0px'
            })
            $(this).siblings('.review_item_mainOn').attr('class', 'review_item_mainOff');
            $(this).children('.review_item_headerOn').children(".review_openImgOn").attr('class', 'review_openImgOff');
            $(this).children('.review_item_headerOn').attr('class', 'review_item_headerOff')
        }

    })

})
