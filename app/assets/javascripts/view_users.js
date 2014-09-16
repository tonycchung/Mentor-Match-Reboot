$(function(){
  $(".contactUser").click(function(){
    alert("alert");
    $(".popBox").css({"margin-top": "0", "opacity": "1"});
  });
});

$(function(){
  $('.detail_1').addClass("isVisible");
});

$(function(){
  $('.next').click(function(){
    if($(".detail_1").hasClass("isVisible")){
      $(".detail_1").removeClass("isVisible");
      $(".detail_2").addClass("isVisible");
    } else if($(".detail_2").hasClass("isVisible")) {
      $(".detail_2").removeClass("isVisible");
      $(".detail_3").addClass("isVisible");
    } else if($(".detail_3").hasClass("isVisible")) {
      $(".detail_3").removeClass("isVisible");
      $(".detail_4").addClass("isVisible");
    } else if($(".detail_4").hasClass("isVisible")) {
      $(".detail_4").removeClass("isVisible");
      $(".detail_5").addClass("isVisible");
    }
  })
});

$(function(){
  $('.last').click(function(){
    if($(".detail_5").hasClass("isVisible")){
      $(".detail_5").removeClass("isVisible");
      $(".detail_4").addClass("isVisible");
    } else if($(".detail_4").hasClass("isVisible")) {
      $(".detail_4").removeClass("isVisible");
      $(".detail_3").addClass("isVisible");
    } else if($(".detail_3").hasClass("isVisible")) {
      $(".detail_3").removeClass("isVisible");
      $(".detail_2").addClass("isVisible");
    } else if($(".detail_2").hasClass("isVisible")) {
      $(".detail_2").removeClass("isVisible");
      $(".detail_1").addClass("isVisible");
    }
  })
});