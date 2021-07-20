$(document).ready(function(){

    // new Swiper('.swiper-container2', {
    //     slidesPerView: 1,
    //     spaceBetween: 10,
    //     // pagination: { el: '.swiper-pagination', clickable: true },
    //     navigation: { nextEl: '.swiper-button-next', prevEl: '.swiper-button-prev', clickable: true },
    //     loop: true,
    //     // autoplay: { delay: 2500 },
    //     // breakpoints: {
    //     //   640: { slidesPerView: 2, spaceBetween: 10, },
    //     //   768: { slidesPerView: 3, spaceBetween: 10, },
    //     //   1400: { slidesPerView: 4, spaceBetween: 10, },
    //     // },
    //   });
    
	//change BG image of slider on hover
    $(".agenda .swiper-slide").mouseover(function(){
      var slider = $(this);
      var bgImg = slider.attr("data-bg")
      var id = parseInt( slider.attr('data-swiper-slide-index'))+1
      var agendaId = slider.parents("section").attr("class").replace('agenda-','')
      if(agendaId && agendaId!==id){
          slider.parents("section").css({ "background": "linear-gradient(to bottom,transparent 0%,rgb(0 0 0 / 43%) 35%,rgba(0,0,0,0.4) 100%), url("+bgImg+") no-repeat center", "background-size": "cover" })
      }
  })
  //change BG image of slider on Click of arrows
  $(".agenda .swiper-button-next").click(function(){  sliderClicked() })
  $(".agenda .swiper-button-prev").click(function(){  sliderClicked() })
  sliderClicked=()=>{
      var agenda = $(document).find(".agenda").children("section")
      var agendaId = agenda.attr('class').replace('agenda-','')
      var newId = parseInt( $(document).find(".agenda .swiper-slide-active").attr('data-swiper-slide-index') )+1
      var bgImg = $(document).find(".agenda .swiper-slide-active").attr('data-bg')
      if(agendaId && agendaId!==newId){
          agenda.css({ "background": "linear-gradient(to bottom,transparent 0%,rgb(0 0 0 / 43%) 35%,rgba(0,0,0,0.4) 100%), url("+bgImg+") no-repeat center", "background-size": "cover" })
      }
  }

  // var table = $(".fixedHeader> div >.q-table")
  // $(window).scroll(function() {
  //   var windowTop = $(window).scrollTop();

  //   if (windowTop > 50) {
  //       $("thead", table).addClass("fixed").css("top", "50px");
  //   }else {
  //       $("thead", table).removeClass("fixed");
  //   }
  // });


});