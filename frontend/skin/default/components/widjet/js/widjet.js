var DOMReady = function(a,b,c){b=document,c='addEventListener';b[c]?b[c]('DOMContentLoaded',a):window.attachEvent('onload',a)}
    
DOMReady(function () {
  if(window.top.location.host !== secrity_host && window.top.location.host !== domain_root){ 
        console.log('Домен: ' + window.top.location.host + ' не соответствует: '+secrity_host)
        window.location = aRouter.widjet + 'error_domain'
    }
});

