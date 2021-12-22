//= require jquery
//= require jquery_ujs

$(document).on("click",".hide_btn", function () {
    var btnId = $(this).attr("id");
    if ($(this).hasClass("down")) {
        $("#" + btnId).html("<span class='arr'>&uArr;<span>");
        $(this).removeClass("down");
        $(this).addClass("up");
    } else {
        $("#" + btnId).html("<span class='arr'>&dArr;<span>");
        $(this).removeClass("up");
        $(this).addClass("down");
    }
});
