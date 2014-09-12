var sendMentorMessage = function (){
  document.getElementByClassName("popBox").style.marginBottom = "100vh";
  document.getElementByClassName("messageSent").style.marginBottom = "0";
}

function(){
  document.getElementByClassName("yes").onClick = sendMentorMessage();
}