!function(){function m(){l.slots=[];for(var a=document.querySelectorAll("[data-bsft-slot]"),b=0;b<a.length;b++)l.slots.push({name:a[b].dataset.bsftSlot,el:a[b]})}function n(a,b){b.tz=l.tz;var c={x:l.eventApiKey,slot:a,user:l.userParams,context:b};return"true"==r("dev")&&(c.dev=!0),JSON.stringify(c)}function o(){for(var b=[],c=0;c<l.slots.length;c++)!function(c){b[c]=A(),b[c].open("POST",a+"live",!0),b[c].setRequestHeader("Content-Type","application/json"),b[c].onreadystatechange=function(){if(4===b[c].readyState&&200==b[c].status){try{var a=JSON.parse(b[c].responseText)}catch(a){console.log("error loading slot",a)}a&&a.show&&p(l.slots[c].el,a.width,a.height,a.content)}},b[c].send(n(l.slots[c].name,l.slotParams[l.slots[c].name]||{}))}(c)}function p(a,b,c,d){var e=document.createElement("iframe");a.appendChild(e),e.src="javascript:''",e.style.width=b,e.style.height=c,e.style.border="none",e.contentWindow.document.open(),e.contentWindow.document.write(d),e.contentWindow.document.close(),a.style.width=b,a.style.height=c,a.style.display="block"}function q(a){m(),l.slotParams=a||{},o()}function r(a){var b=window.location.href;a=a.replace(/[\[\]]/g,"\\$&");var c=new RegExp("[?&]"+a+"(=([^&#]*)|&|#|$)"),d=c.exec(b);return d?d[2]?decodeURIComponent(d[2].replace(/\+/g," ")):"":null}function s(a){for(var b=[];null!=a.parentNode;){for(var c=0,d=0,e=0;e<a.parentNode.childNodes.length;e++){var f=a.parentNode.childNodes[e];f.nodeName==a.nodeName&&(f===a&&(d=c),c++)}""!=a.id?b.unshift(a.nodeName.toLowerCase()+"#"+a.id):c>1?b.unshift(a.nodeName.toLowerCase()+"["+d+"]"):b.unshift(a.nodeName.toLowerCase()),a=a.parentNode}return b}function t(a,b){var c=document.getElementById(a);L(c,"change",function(){H({0:"icapture",1:b,2:document.getElementById(a).value})},!1)}function u(a){var b=new Image(1,1);b.src=a}function w(a){try{var b=D("_bs_fb_pushed");if(void 0!=b)return;request=c+"?x="+window._blueshiftid+"&k="+a;var d=A();d.open("GET",request,!0),d.onreadystatechange=function(){4==d.readyState&&200==d.status&&y(JSON.parse(d.responseText))},d.send(request)}catch(a){}}function x(a){for(var b in a)if(a.hasOwnProperty(b))return!1;return!0}function y(a){return!!x(a)||(window._fbq=window._fbq||[],window._fbq.push(["track","user_attributes",a]),void C("_bs_fb_pushed","1",1))}function z(a){try{xhr=A(),xhr.open("GET",a,!0),xhr.send(a)}catch(a){}}function A(){if(window.XMLHttpRequest)try{var a=new XMLHttpRequest}catch(a){var a=new window.ActiveXObject("Microsoft.XMLHTTP")}return a}function B(){var a="";try{a=window.top.document.referrer}catch(b){if(window.parent)try{a=window.parent.document.referrer}catch(b){a=""}}return""===a&&(a=document.referrer),a}function C(a,b,c){var d=new Date;d.setDate(d.getDate()+c);var e=window.location.hostname,f=e.split(".");4==f.length&&f[0]>=0&&f[0]<=255&&f[1]>=0&&f[1]<=255&&f[2]>=0&&f[2]<=255&&f[3]>=0&&f[3]<=255||(e="."+e.replace(/^www./,""));var g=escape(b)+(null==c?"":";expires="+d.toUTCString())+";path=/;domain="+e;document.cookie=a+"="+g}function D(a){var b,c,d,e=document.cookie.split(";");for(b=0;b<e.length;b++)if(c=e[b].substr(0,e[b].indexOf("=")),d=e[b].substr(e[b].indexOf("=")+1),c=c.replace(/^\s+|\s+$/g,""),c==a)return unescape(d)}function E(){function a(){return Math.floor(65536*(1+Math.random())).toString(16).substring(1)}return a()+a()+"-"+a()+"-"+a()+"-"+a()+"-"+a()+a()+a()}function F(a){var c=a[0],e=B(),j=Math.floor(1e6*Math.random()+1),k=Math.round(new Date/1e3),m=D("_bs");if(void 0==m&&(m=E(),C("_bs",m,365)),"config"==c&&a[1])return i=a[1],i.trackClicks&&M(),!0;if("identify"==c&&(l.userParams=a[1]||{},l.userParams.cookie=m),"track"==c)c=a[1],a=a[2];else{if("capture"==c)return t(a[1],a[2]),!0;if("retarget"==c)return req=d+b+"?t="+k+"&e=appnexus&z="+j+"&x="+window._blueshiftid+"&k="+m+"&appnexus_id=$UID&u="+encodeURIComponent(encodeURIComponent(window.location.href))+"&r="+encodeURIComponent(encodeURIComponent(e)),u(req),!0;if("facebook"==c)return g=!0,!0;"icapture"==c?(c="capture",n=a[1],value=a[2],a={},a[n]=value):a=a[1]}req=b+"?t="+k+"&e="+c+"&r="+encodeURIComponent(e)+"&z="+j+"&x="+window._blueshiftid+"&k="+m+"&u="+encodeURIComponent(window.location.href);for(var n in a)v=a[n],"object"==typeof v?req+="&"+n+"_json="+encodeURIComponent(JSON.stringify(v)):req+="&"+n+"="+encodeURIComponent(v);return h?z(req):u(req),1==g&&"pageload"==c&&w(m),1==f&&"pageload"==c&&(req=d+b+"?t="+k+"&e=appnexus&z="+j+"&x="+window._blueshiftid+"&k="+m+"&appnexus_id=$UID&u="+encodeURIComponent(encodeURIComponent(window.location.href))+"&r="+encodeURIComponent(encodeURIComponent(e)),u(req)),1==g&&"pageload"==c&&w(m),!0}function G(a,b){setTimeout(function(){H(a)},b)}function H(a){if(void 0!=a[0]){if(!e)return void G(a,20);if("identify"===a[0])return void F(a);if(l.userParams.cookie||new Date-I>1e3)switch(a[0]){case"live":q(a[1]);break;default:F(a)}else G(a,20)}}function J(){e=!0,I=new Date,l.eventApiKey=_blueshiftid}function M(){L(document,"click",function(a){a=a||window.event,element=a.target||a.srcElement,element.href&&H(["click",{p:s(element).toString(),c:element.href,a:element.innerHTML}])})}var I,a=("https:"===document.location.protocol?"https:":"http:")+"//api.getblueshift.com/",b=a+"unity.gif",c=a+"cookiejar.json",d=("https:"===document.location.protocol?"https:":"http:")+"//ib.adnxs.com/getuid?",e=!1,f=!1,g=!1,h="undefined"!=typeof XMLHttpRequest&&"withCredentials"in new XMLHttpRequest,i={},l={eventApiKey:void 0,userParams:{},slots:[],slotParams:{},tz:(new Date).getTimezoneOffset()};if("object"==typeof blueshift){var K="undefined"==typeof blueshift.slice?[]:blueshift.slice(0);for(blueshift={events:[],load:function(){J()},capture:function(a,b){t(a,b)},retarget:function(){H(["retarget"])},facebook:function(){H(["facebook"])},track:function(a,b){H(["track",a,b])},pageload:function(a){H(["pageload",a])},identify:function(a){H(["identify",a])},live:function(a){H(["live",a])}},N=0;N<K.length;N++)blueshift.events.push(K[N])}if(document.addEventListener)var L=function(a,b,c){a.addEventListener(b,c,!1)};else var L=function(a,b,c){a.attachEvent("on"+b,c)};for(var N=0;N<blueshift.events.length;N++)H(blueshift.events[N]);"complete"===document.readyState?J():window.addEventListener?window.addEventListener("load",J,!1):window.attachEvent?window.attachEvent("onload",J):J}();