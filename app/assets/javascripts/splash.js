$(".findMentor").mouseenter(function(){
  $(".findMentor").text("Be Inspired");
});
$(".beMentor").mouseenter(function(){
  $(".beMentor").text("Lead the Way");
});

// var fade_in = function(){

// }

window.onscroll = function(){
  document.getElementById('student').style.opacity='1';
  document.getElementById('mentor').style.opacity='1';
}

window.onmousemove  = function(){
  document.getElementById('student').style.opacity='1';
  document.getElementById('mentor').style.opacity='1';
}