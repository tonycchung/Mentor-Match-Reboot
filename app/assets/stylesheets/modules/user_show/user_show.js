
If section contains overflow content:

On section hover, reveal a down arrow indicating further content.

On click of that down arrow, change the height and text-wrap of p to reveal the rest of a users answer. Also spin down arrow to point up.

On click of up arrow, revert p to previous state.

var allSections = function(){
  document.getElementsByTagName('section');
}

allSections.onmouseover=function(){

}