<template>
    <div>
        <div class="propBanner">
            <img :src="'/images/'+singleProperty.bannerImage" :alt="singleProperty.bannerAlt"/>
            <div class="propBannerText">
                <h1>{{singleProperty.name}}</h1>
            </div>
            <div class="tint"></div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-12 mt-5 amenities card">
                    <div v-for="i in JSON.parse(singleProperty.amenitiesImageArray)">
                        <img :src="'/images'+i.fileURL" :alt="i.alt"/>
                        <p>{{i.name}}</p>
                    </div>
                </div>
                <div class="col-sm-12 mb-5 amenities card">
                    <div v-for="i in JSON.parse(singleProperty.tagsArray)">
                        <span class="label bg-primary text-white q-pa-sm">{{i.name}}</span>
                    </div>
                </div>
                <div class="col-sm-9">
                    <div class="container-fluid pics">
                        <div class="row">
                            <div class="col-sm-6">
                                <!-- <div class="banner swiper swiper-container2">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide" v-for="i in singleProperty.picsImageArray" :key="i.id">
                                            <img :src="'/images/'+i.fileURL" :alt="i.alt"/>
                                        </div>
                                    </div>
                                    <div class="swiper-pagination"></div>
                                    <div class="swiper-button-next"></div>
                                    <div class="swiper-button-prev"></div>
                                </div> -->
                                <!-- <swiper class="banner"
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
                                    >
                                    <swiper-slide v-for="(i, index) in singleProperty.picsImageArray" :key="i.id" :virtualIndex="index">
                                        <p>{{index}}</p>
                                        <img :src="'/images/'+i.fileURL" :alt="i.alt"/>
                                    </swiper-slide> 
                                </swiper> -->
                            </div>
                            <div class="col-sm-6 blocksText">
                                <p>{{singleProperty.shortdesc}}</p>
                            </div>
                            <div class="col-sm-12 my-5">
                                <p>{{singleProperty.longdesc}}</p>
                            </div>
                        </div>
                    </div>
                    <div class="blocks" v-if="JSON.parse(singleProperty.blocks).length">
                        <div class="row" v-for="i in JSON.parse(singleProperty.blocks)">
                            <div class="col-sm-6">
                                <img :src="'/images'+i.image" :alt="i.alt"/>
                            </div>
                            <div class="col-sm-6 blocksText">
                                <h2>{{i.head}}</h2>
                                <p>{{i.text}}</p>
                            </div>
                        </div>
                    </div>
                    <ContactForm title="Please fill the form to know more" para="We keep your details safe and secure with us." />
                </div>
                <div class="col-sm-3 suggestSidebar">
                    <h2>Similar Properties</h2>
                    <div class="card" v-for="i in suggestProp">
                        <a :href="'/property/'+i.url">
                            <img :src="'/images/'+i.bannerImage" :alt="i.bannerAlt"/>
                            <div class="">
                                <h2>{{i.name}}</h2>
                                <p>{{i.price}}</p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { mapGetters } from 'vuex';
import ContactForm from '../parts/ContactForm'
import SwiperCore, { Navigation, Pagination, Scrollbar, A11y, EffectFade, Autoplay } from 'swiper';
import { Swiper, SwiperSlide } from 'swiper/vue'
SwiperCore.use([EffectFade, Navigation, Pagination, Scrollbar, A11y, Autoplay]);

export default {
    components: { ContactForm, Swiper, SwiperSlide },
    data() {
    return {
        slide: 'first',
        autoplay: true,
    };
  },
    created() {
        const form = {
            url: this.$route.params.url,
        };
        this.$store.dispatch('singleProperty', form);

  },
  computed: {
    ...mapGetters(['singleProperty', 'suggestProp']),
  },
  mounted() {
    // this.homeSwiper = new Swiper(".banner", {
    //   updateOnWindowResize: true,
    //   loop: true,
    //   slidesPerView: 1,
    //   spaceBetween: 0,
    //   speed: 500,
    //   centeredSlides: true,
    //   centeredSlidesBounds: true,
    //   // autoplay: {
    //   //   delay: 1000,
    //   //   disableOnInteraction: false,
    //   // },
    // //   pagination: { el: ".swiper-pagination", clickable: true },
    //   navigation: { nextEl: '.swiper-button-next', prevEl: '.swiper-button-prev' },
    // });
  }
}
</script>
<style lang="sass" scoped>

</style>