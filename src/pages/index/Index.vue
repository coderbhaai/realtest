<template>
  <div>
  
    <swiper class="banner"
      :slides-per-view="1"
      :space-between="0"
      loop = true
      navigation
        :pagination="{ clickable: true }"
        :scrollbar="{ draggable: true }"
      autoplay
        :delay = 1000
        disableOnInteraction: false
      effect="fade"
      @swiper="onSwiper"
      @slideChange="onSlideChange"
    >
      <swiper-slide  v-for="(i, index) in slides" :key="index" :virtualIndex="index">
        <img :src="'/images/static/'+ i.img" :alt="'alt for image '+index"/>
        <div class="tint"></div>
        <div class="swiperText">
          <h1>{{i.text}}</h1>
        </div>
      </swiper-slide>
    </swiper>
    <PropAccordian/>
    <SuggestBlogs/>

    <!-- 
    <Agenda/>
     -->
    <Subscribe/>
  </div>
</template>

<script>
import Agenda from 'components/Agenda'
import Subscribe from 'components/Subscribe'
import PropAccordian from 'components/PropAccordian'
import SuggestBlogs from 'components/SuggestBlogs'
import SwiperCore, { Navigation, Pagination, Scrollbar, A11y, EffectFade, Autoplay } from 'swiper';
import { Swiper, SwiperSlide } from 'swiper/vue'
SwiperCore.use([EffectFade, Navigation, Pagination, Scrollbar, A11y, Autoplay]);

export default {
  components: { Agenda, Subscribe, PropAccordian, SuggestBlogs, Swiper, SwiperSlide },
  data () {
    return {
      slides: [
        {img: 'banner-1.jpg', text: "Slide-1"},
        {img: 'banner-2.jpg', text: "Slide-2"},
        {img: 'banner-3.jpg', text: "Slide-3"},
        {img: 'banner-4.jpg', text: "Slide-4"}
      ],
    }
  },
  methods: {
    onSwiper(swiper) {
        console.log(swiper);
      },
      onSlideChange() {
        // console.log('slide change');
      },
  },
  mounted() {
    console.log("Store", this.$store)
  }

}
</script>
