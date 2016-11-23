$(function(){
   
    
    var ias = jQuery.ias({
        container: '.box-users',
        item: '.user-item',
        pagination: '.pagination',
        next: '.pagination .next_link',
        triggerPageThreshold: 5
    });
    
     ias.extension(new IASTriggerExtension({
        text: 'Ver más',
        offset: 3
    }));
 
    ias.extension(new IASSpinnerExtension({
        src: '/web/assets/img/ajax-loader.gif',
    }));
 
    ias.extension(new IASNoneLeftExtension({
        text: 'No hay más personas',
    }));
   
   ias.on('ready',function(event){
       followButtons();
   });
   
   ias.on('rendered',function(event){
       followButtons();
   });
    
});


function followButtons(){
    $('.btn-follow').unbind('click').click(function(){
        $(this).addClass('hidden');
        $(this).parent().find('.btn-unfollow').removeClass('hidden');
        $.ajax({
            //url: URL+'/nick-test',//Usar en servidores Locales
            url : '/web/app_dev.php/follow',
            data: {followed: $(this).attr("data-followed")},
            type: 'POST',
            success: function(response){
               console.log(response);
            }
        });
    });
    
     $('.btn-unfollow').unbind('click').click(function(){
        $(this).addClass('hidden');
        $(this).parent().find('.btn-follow').removeClass('hidden');
        $.ajax({
            //url: URL+'/nick-test',//Usar en servidores Locales
            url : '/web/app_dev.php/unfollow',
            data: {followed: $(this).attr("data-followed")},
            type: 'POST',
            success: function(response){
               console.log(response);
            }
        });
    });
}
