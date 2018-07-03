/*
 Quantcast measurement tag
 Copyright (c) 2008-2017, Quantcast Corp.
*/
(function(c,h,f){try{__qc("defaults",c,{labels:"_fp.event.Default"})}catch(m){}var k=function(a,b,e){return a?"nc"===a?!b||!e||0>b.indexOf(e):"eq"===a?b===e:"sw"===a?0===b.indexOf(e):"ew"===a?(a=b.length-e.length,b=b.lastIndexOf(e,a),-1!==b&&b===a):"c"===a?0<=b.indexOf(e):!1:!1},l=function(a){var b=f.createElement("a");b.href=a;return b},g=function(a,b,e){var c;c=h.top===h.self?f.location.href:l(f.referrer).href;k(b,c,e)?a(c):a(!1)},d=function(a){return"array"==={}.toString.call(a).match(/\s([a-zA-Z]+)/)[1].toLowerCase()?
{labels:a.join(",")}:{labels:""+a}};__qc("rules",[c,null,[[d,"_fp.event.Premium"]],[[g,"c","/premium"]]],[c,null,[[d,"_fp.event.Partners"]],[[g,"c","/partners"]]],[c,null,[[d,"_fp.event.Courses"]],[[g,"c","/courses"]]],[c,null,[[d,"_fp.event.Paths"]],[[g,"ew","/paths/"]]],[c,null,[[d,"_fp.event.WEB DEVELOPER - FRONTEND"]],[[g,"c","/paths/web-developer-frontend"]]],[c,null,[[d,"_fp.event.Homepage"]],[[function(a,b,c){var d;d=h.top===h.self?f.location.pathname:l(f.referrer).pathname;k(b,d,c)?a(d):a(!1)},
"eq","/"]]])})("p-d1D4hSPec1QW4",window,document);