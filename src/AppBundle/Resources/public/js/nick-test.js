$(function(){
    $('#ajbundle_user_nick').blur(function(){
        var nick = this.value;
        $.ajax({
            //url: URL+'/nick-test',//Usar en servidores Locales
            url : '/web/app_dev.php/nick-test',
            data: {nick: nick},
            type: 'POST',
            success: function(response){
                if(response == "used"){
                    $('#ajbundle_user_nick').css("border","1px solid red");
                }else{
                    $('#ajbundle_user_nick').css("border","1px solid green");
                }
            }
        });
    });
});