jQuery(document).ready(function($){
    if(window.top.location.host !== ls.registry.get('domain')){
        console.log('Fend.ru: Такой домен не зарегестрирован ' + window.top.location.host)
        window.location = aRouter.widjet + 'error_domain'
    }
    
});
