/*sublistas sedes*/
$(document).ready(function(){
    $('.facultad').hide();
    $('.programas').hide();
});
$(document).ready(function(){
    $('.sede>button').click(function(){
        if($(this).parent().find('.facultad').length){
        $(this).parent().find('.facultad').slideToggle(400);
        }
        else{
            $(this).parent().find('.programas').slideToggle();
        }
    });
    $('.facultad>button').click(function(){
        $(this).parent().find('.programas').slideToggle();
    });
});
$(document).ready(function(){
$('.div-D hr').css({"margin-top":"10px"});
$('.div-D hr').css({"margin-bottom":"10px"});
$('.div-D hr').css({"border-top": "1px solid #666666"});
    });
$(document).ready(function(){
  $('.oculto_1 a').css({"color":"#ffffff"});
  var x=  $(".visible_2").width();
  var ancho= parseInt(x);
  $('.oculto_2').css("width",ancho);
  $(window).resize(function(){
  var x=  $(".visible_2").width();
  var ancho= parseInt(x);
  $('.oculto_2').css("width",ancho);
  });
});
$(document).ready(function(){
var sheight = $('.token').height();
var largo = parseInt(sheight);
    if(largo == 1){
    $(".home-image img").attr("src","images/Fondos/bgmovil2.jpg");
     $(".oculto_2").show();
    }
    else if((largo == 2)||(largo == 3)){
    $(".home-image img").attr("src","images/Fondos/bg.jpg");
    $(".oculto_2").hide();
    $(".visible_2").hover(function(){
    $(this).parent().find(".oculto_2").slideDown(400);
    },function(){
    $(this).parent().find(".oculto_2").slideUp(400);});
    }
    $(window).resize(function(){
    var sheight = $('.token').height();
var largo = parseInt(sheight);
    if(largo == 1){
    $(".home-image img").attr("src","images/Fondos/bgmovil2.jpg");
    $(".oculto_2").show();
   
 $(".visible_2").hover(function(){
  $(this).parent().find(".oculto_2").unbind("mouseenter mouseleave");
  },function(){
  $(this).parent().find(".oculto_2").unbind("mouseenter mouseleave");});
        
    }else if((largo == 2)||(largo == 3)){
    $(".home-image img").attr("src","images/Fondos/bg.jpg");
    $(".oculto_2").hide();
    $(".visible_2").hover(function(){
  $(this).parent().find(".oculto_2").slideDown(400);
  },function(){
  $(this).parent().find(".oculto_2").slideUp(400);});
    }
    });
});




$(document).ready(function(){
   $('.oculto_2 a').css({"color":"#ffffff"});
  var x=  $(".visible_1").width();
  var ancho= parseInt(x);
  $('.oculto_1').css("width",ancho);
  $(window).resize(function(){
  var x=  $(".visible_1").width();
  var ancho= parseInt(x);
  $('.oculto_1').css("width",ancho);
  });
  
});

$(document).ready(function(){
var sheight = $('.token').height();
var largo = parseInt(sheight);
    if(largo == 1){
    $(".home-image img").attr("src","images/Fondos/bgmovil2.jpg");
     $(".oculto_1").show();
    }
    else if((largo == 2)||(largo == 3)){
    $(".home-image img").attr("src","images/Fondos/bg.jpg");
    $(".oculto_1").hide();
    $(".visible_1").hover(function(){
    $(this).parent().find(".oculto_1").slideDown(400);
    },function(){
    $(this).parent().find(".oculto_1").slideUp(400);});
    }
    $(window).resize(function(){
    var sheight = $('.token').height();
var largo = parseInt(sheight);
    if(largo == 1){
    $(".home-image img").attr("src","images/Fondos/bgmovil2.jpg");
    $(".oculto_1").show();


 $(".visible_1").hover(function(){
  $(this).parent().find(".oculto_1").unbind("mouseenter mouseleave");
  },function(){
  $(this).parent().find(".oculto_1").unbind("mouseenter mouseleave");});
        
    }else if((largo == 2)||(largo == 3)){
    $(".home-image img").attr("src","images/Fondos/bg.jpg");
    $(".oculto_1").hide();
    $(".visible_1").hover(function(){
  $(this).parent().find(".oculto_1").slideDown(400);
  },function(){
  $(this).parent().find(".oculto_1").slideUp(400);});
    }
    });
});