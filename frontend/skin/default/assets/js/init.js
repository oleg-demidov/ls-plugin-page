
jQuery(document).ready(function($){
    $('.js-show-widjet').find('textarea').keyup(function(e){
        $(e.target).closest('.tab-pane').find('.js-container-widjet').html($(e.target).val())
    });
});

