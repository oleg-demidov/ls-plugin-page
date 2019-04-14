var DOMReady = function(a,b,c){b=document,c='addEventListener';b[c]?b[c]('DOMContentLoaded',a):window.attachEvent('onload',a)}
    
DOMReady(function () {
  if(window.top.location.host !== widjet_params.secrity_host && window.top.location.host !== widjet_params.domain_root){ 
        console.log('Домен: ' + window.top.location.host + ' не соответствует: '+widjet_params.secrity_host)
        window.location = aRouter.widjet + 'error_domain'
    }
});

