// if user email field != null
//   function(){
//     get this email
//     query gravatar
//     if email is associated with a gravatar, display gravatar next to user email field.
//       else{
//         display: none;
//       }
//   }

//   <%= image_tag @user.gravatar_url %>

//   how can I tell if there is actually an image?


$.fn.inView = function(){
    //Window Object
    var win = $(window);
    //Object to Check
    obj = $(this);
    //the top Scroll Position in the page
    var scrollPosition = win.scrollTop();
    //the end of the visible area in the page, starting from the scroll position
    var visibleArea = win.scrollTop() + win.height();
    //the end of the object to check
    var objEndPos = (obj.offset().top + obj.outerHeight());
    return(visibleArea >= objEndPos && scrollPosition <= objEndPos ? true : false)
};

if($('#s1').($('inView')) == true{
  function(){
    $('li.progDot:nth-child(1)').style.background='$charlie';
  }
}