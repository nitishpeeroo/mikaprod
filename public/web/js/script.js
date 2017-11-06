// Appel scrollify
function navScrollify(){
  $(document).ready(function(){
      $(function() {
        $.scrollify({
            section : ".home",
            section : ".presentation",
            section : ".artistes",
            section : ".videos",
            section : ".videos2",
            section : ".actualites",
            section : ".contact",
            section : ".panel",
        });
      });
    });
}

    ///////////////////////// MOBILE FUNCTION //////////////////////////////////////

    $(function() {
      $('.menuiconmobile').click(function() {
        if ($('.headermobile ul li').css("height") == "0px") {
            $(".headermobile ul li").animate({"height": "60px"}, "fast");
            $(".overlaymenu").animate({"height": "100%"}, "fast");
            $(".menuiconmobile .fa").removeClass("fa-bars", 1000);
            $(".menuiconmobile .fa").addClass("fa-times", 1000);
        }
        else if ($('.headermobile ul li').css("height") == "60px") {
              $(".headermobile ul li").animate({"height": "0px"}, "fast");
              $(".overlaymenu").animate({"height": "0%"}, "fast");
              $(".menuiconmobile .fa").removeClass("fa-times", 1000);
              $(".menuiconmobile .fa").addClass("fa-bars", 1000);
              /*iphone*/
              if ($('.headermobile ul li').css("height") == "60px") {
                /*$(".headermobile ul li").addClass("deploy");
                $(".headermobile ul li").removeClass("retract");
                $(".overlaymenu").addClass("deploy");
                $(".overlaymenu").removeClass("retract");*/
                $(".headermobile ul li").css('height','0px');
                $(".overlaymenu").css("height", "0px");

              }
        }
      });

      $('.headermobile ul li').click(function() {
          $(".headermobile ul li").animate({"height": "0px"}, "fast");
          $(".overlaymenu").animate({"height": "0%"}, "fast");
          $(".menuiconmobile .fa").removeClass("fa-times", 200);
          $(".menuiconmobile .fa").addClass("fa-bars", 200);   
        });  

      $('.overlaymenu ').click(function() {
          $(".headermobile ul li").animate({"height": "0px"}, "fast");
          $(".overlaymenu").animate({"height": "0%"}, "fast");
          $(".menuiconmobile .fa").removeClass("fa-times", 200);
          $(".menuiconmobile .fa").addClass("fa-bars", 200);   
        }); 
    });

//////////////////////// SOUND FUNCTION ////////////////////////
function actionOnScroll(){ 
  $(document).ready(function(){
      $("#homevideo").prop('muted', false);
      $("#homevideo")[0].volume = 0;
      $("#homevideo").animate({volume: 0.4}, 10000);

      $(function() {

          $('.sound').click(function() {

              if  ($( "#soundicondesktop" ).hasClass("fa-volume-up")) {
                  $("#homevideo").animate({volume: 0}, 1500);
                  $("#soundicondesktop").removeClass("fa-volume-up", 1500);
                  $("#soundicondesktop").addClass("fa-volume-off", 1500);
              }
              else if ($( "#soundicondesktop" ).hasClass("fa-volume-off")) {
                  $("#homevideo").animate({volume: 0.4}, 1500);
                  $("#soundicondesktop").removeClass("fa-volume-off", 1500);
                  $("#soundicondesktop").addClass("fa-volume-up", 1500);
              }

          });


          $('.soundmobile').click(function() {

              if  ($( "#soundiconmobile" ).hasClass("fa-volume-up")) {
                  $("#homevideo").animate({volume: 0}, 1500);
                  $("#soundiconmobile").removeClass("fa-volume-up", 1500);
                  $("#soundiconmobile").addClass("fa-volume-off", 1500);
              }
              else if ($( "#soundiconmobile" ).hasClass("fa-volume-off")) {
                  $("#homevideo").animate({volume: 0.4}, 1500);
                  $("#soundiconmobile").removeClass("fa-volume-off", 1500);
                  $("#soundiconmobile").addClass("fa-volume-up", 1500);
              }

          });

      });
  });

  $(window).scroll(function() {
     var hT = $('.presentation').offset().top,
         hH = $('.presentation').outerHeight(),
         wH = $(window).height(),
         wS = $(this).scrollTop();
     if (wS > (hT+hH-wH-600)){
          $(".menupresentation").addClass("active", 1500);
     }
     else {
        $(".menupresentation").removeClass("active", 1500);
     }
  });
  $(window).scroll(function() {
     var hT = $('.artistes').offset().top,
         hH = $('.artistes').outerHeight(),
         wH = $(window).height(),
         wS = $(this).scrollTop();
     if (wS > (hT+hH-wH-1200)){
          $(".menuartistes").addClass("active", 1500);
          $(".menupresentation").removeClass("active", 1500);
     }
     else {
        $(".menuartistes").removeClass("active", 1500);
     }
  });
  $(window).scroll(function() {
     var hT = $('.videos').offset().top,
         hH = $('.videos').outerHeight(),
         wH = $(window).height(),
         wS = $(this).scrollTop();
     if (wS > (hT+hH-wH-500)){
          $(".menuvideos").addClass("active", 1500);
          $(".menupresentation").removeClass("active", 1500);
          $(".menuartistes").removeClass("active", 1500);
     }
     else {
        $(".menuvideos").removeClass("active", 1500);
     }
  });
  $(window).scroll(function() {
     var hT = $('.actualites').offset().top,
         hH = $('.actualites').outerHeight(),
         wH = $(window).height(),
         wS = $(this).scrollTop();
     if (wS > (hT+hH-wH-600)){
          $(".menuactualites").addClass("active", 1500);
          $(".menupresentation").removeClass("active", 1500);
          $(".menuartistes").removeClass("active", 1500);
          $(".menuvideos").removeClass("active", 1500);
     }
     else {
        $(".menuactualites").removeClass("active", 1500);
     }
  });
  $(window).scroll(function() {
     var hT = $('.contact').offset().top,
         hH = $('.contact').outerHeight(),
         wH = $(window).height(),
         wS = $(this).scrollTop();
     if (wS > (hT+hH-wH-600)){
          $(".menucontact").addClass("active", 1500);
          $(".menupresentation").removeClass("active", 1500);
          $(".menuartistes").removeClass("active", 1500);
          $(".menuvideos").removeClass("active", 1500);
          $(".menuactualites").removeClass("active", 1500);
     }
     else {
        $(".menucontact").removeClass("active", 1500);
     }
  });

  $(document).scroll(function() {
    var y = $(this).scrollTop();
    if (y > 80) {
      $('.header').css("background-color", "rgba(0, 0, 0, 0.15)");
    } else {
      $('.header').css("background-color", "rgba(0, 0, 0, 1)");
    }
  });

  $(document).scroll(function() {
  var k = $(this).scrollTop();
    if (k > 40) {
      if ($("#homevideo")[0].volume == 0.4) {
        $("#homevideo")[0].volume = 0;
        $("#homevideo").prop('muted', true);
        $("#soundicondesktop").removeClass("fa-volume-up", 1500);
        $("#soundicondesktop").addClass("fa-volume-off", 1500);
      };
    };
  });


$(document).scroll(function() {
  var l = $(this).scrollTop();
    if (l <= 40 ) {
      if ($("#homevideo")[0].volume == 0) {
        setTimeout(function(){
        $("#homevideo")[0].volume = 0.4;
        $("#homevideo").prop('muted', false);
        $("#soundicondesktop").removeClass("fa-volume-off", 1500);
        $("#soundicondesktop").addClass("fa-volume-up", 1500);
      }, 500);
      };
    };
    
  });

  

    // $(document).scroll(function() {
    //   var y = $(this).scrollTop();
    //   if (y > 300) {
    //     $("#homevideo").animate({volume: 0}, 1000);
    //   } else {
    //     $("#homevideo").animate({volume: 1}, 1000);
    //   }
    // });

    $(document).ready(function() {
           $('#home-video').parent().append('<div id="mute-video" class="audio-on"></div><div id="loadingStatus" style="display:none">0%</div>');
           $('#home-video video').attr('id', 'thevideo');

        });

    // Boutons
    $(function() {
        $('#ben').click(function() {
            // $("#textfr").css('margin-left', '-48%')
            $( "#textfr" ).animate({ "margin-left": "-46%" }, "medium" );
        });
    });

    $(function() {
        $('#bfr').click(function() {
            // $("#textfr").css('margin-left', '2%')
            $( "#textfr" ).animate({ "margin-left": "2%" }, "medium" );
        });
    });

    $(document).ready(function(){
        if ($(window).width() < 800) { 
            $.scrollify.disable();
        }

        if ($(window).width() > 800) { 
            $.scrollify.enable();
        }
    });

    $(window).resize(function() {
        if ($(window).width() < 800) { 
            $.scrollify.disable();
        }
        
        if ($(window).width() > 800) { 
            $.scrollify.enable();
        }
    });

    $(document).ready(function(){
        $(".menulogo").click(function(){
             $.scrollify.move("#home");
        });
        $(".menupresentation").click(function(){
             $.scrollify.move("#presentation");
        });
        $(".menuartistes").click(function(){
             $.scrollify.move("#artistes");
        });
        $(".menuvideos").click(function(){
             $.scrollify.move("#videos");
        });
        $(".menuactualites").click(function(){
             $.scrollify.move("#actualites");
        });
        $(".menucontact").click(function(){
             $.scrollify.move("#contactsection");
        });


        $(".menulogomobile").click(function(){
             $('html, body').animate({
                 scrollTop: $(".home").offset().top
             }, 1000);
        });
        $(".menupresentationmobile").click(function(){
             $('html, body').animate({
                 scrollTop: $(".presentation").offset().top
             }, 1000);
        });
        $(".menuartistesmobile").click(function(){
             $('html, body').animate({
                 scrollTop: $(".artistes").offset().top
             }, 1000);
        });
        $(".menuvideosmobile").click(function(){
             $('html, body').animate({
                 scrollTop: $(".videos").offset().top
             }, 1000);
        });
        $(".menuactualitesmobile").click(function(){
             $('html, body').animate({
                 scrollTop: $(".actualites").offset().top
             }, 1000);
        });
        $(".menucontactmobile").click(function(){
             $('html, body').animate({
                 scrollTop: $(".contact").offset().top
             }, 1000);
        });
    })

    // $(document).ready(function(){
    //     $("#player_1").hover(function(){
    //         var player = $("#player_1");
    //             froogaloop = $f(player[0].id);
            
    //         player.mouseover(function(){
    //             froogaloop.api('play');
    //         }).mouseout(function(){
    //             froogaloop.api('pause');
    //         });
    //     });

    //     $("#player_2").hover(function(){
    //         var player = $("#player_2");
    //             froogaloop = $f(player[0].id);
            
    //         player.mouseover(function(){
    //             froogaloop.api('play');
    //         }).mouseout(function(){
    //             froogaloop.api('pause');
    //         });
    //     });

    //     $("#player_3").hover(function(){
    //         var player = $("#player_3");
    //             froogaloop = $f(player[0].id);
            
    //         player.mouseover(function(){
    //             froogaloop.api('play');
    //         }).mouseout(function(){
    //             froogaloop.api('pause');
    //         });
    //     });

    //     $("#player_4").hover(function(){
    //         var player = $("#player_4");
    //             froogaloop = $f(player[0].id);
            
    //         player.mouseover(function(){
    //             froogaloop.api('play');
    //         }).mouseout(function(){
    //             froogaloop.api('pause');
    //         });
    //     });

    //     $("#player_5").hover(function(){
    //         var player = $("#player_5");
    //             froogaloop = $f(player[0].id);
            
    //         player.mouseover(function(){
    //             froogaloop.api('play');
    //         }).mouseout(function(){
    //             froogaloop.api('pause');
    //         });
    //     });

    //     $("#player_6").hover(function(){
    //         var player = $("#player_6");
    //             froogaloop = $f(player[0].id);
            
    //         player.mouseover(function(){
    //             froogaloop.api('play');
    //         }).mouseout(function(){
    //             froogaloop.api('pause');
    //         });
    //     });
    // });
}