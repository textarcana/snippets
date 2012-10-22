$$('.shout')[0].style.position='absolute';
$$('.shout')[0].style.top='0';
window.onresize=function(){$$('.shout')[0].style.left=(document.body.clientWidth/2)-200+'px'};
