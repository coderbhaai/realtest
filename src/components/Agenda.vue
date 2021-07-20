<template>
    <!-- <section class="agenda swiper swiper-container1" v-if="suggestBlogs.length" :style="`background: linear-gradient(to bottom,transparent 0%,rgb(0 0 0 / 43%) 35%,rgba(0,0,0,0.4) 100%), url(/images${suggestBlogs[0].fileURL}) no-repeat center; backgroundSize: cover; transition: background-image .5s ease-in-out`">
        <div class="swiper-wrapper">
            <div class="swiper-slide" v-for="i in suggestBlogs" :key="i.id" :data-bg="'/images'+i.fileURL">
               <div class="point">
                   <h3>{{i.title}}</h3>
                   <p class="para">Get a high end React JS website which is the call of the day. You get a fully highly customizable and scalable website with admin panel, blog system, register, login and a lot more.</p>
                   <p class="para">Read More</p>
                </div>
                <div class="discover">
                    <p>Discover</p>
                    <img src="/images/icons/long-arrow-white.svg">
                </div>
            </div>
        </div>
            <h2>Website Design and Development Company</h2>
        <div class="swiper-pagination"></div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </section> -->
    <section class="agenda swiper swiper-container1" v-if="suggestBlogs.length" :style="`background: linear-gradient(to bottom,transparent 0%,rgb(0 0 0 / 43%) 35%,rgba(0,0,0,0.4) 100%), url(/images${suggestBlogs[0].fileURL}) no-repeat center; backgroundSize: cover; transition: background-image .5s ease-in-out`">
        <swiper class="banner"
            :slides-per-view="4"
            :space-between="0"
            loop = true
            navigation
                :pagination="{ clickable: true }"
                :scrollbar="{ draggable: true }"
            autoplay
                :delay = 1000
                disableOnInteraction: false
        >
            <swiper-slide v-for="(i,index) in suggestBlogs" :key="index" :virtualIndex="index">
                <div class="point">
                    <h3>{{i.title}}</h3>
                    <p class="para">Get a high end React JS website which is the call of the day. You get a fully highly customizable and scalable website with admin panel, blog system, register, login and a lot more.</p>
                    <p class="para">Read More</p>
                </div>
                <div class="discover">
                    <p>Discover</p>
                    <img src="/images/icons/long-arrow-white.svg">
                </div>
            </swiper-slide>
        </swiper>
    </section>
</template>
<script>
import { mapGetters} from 'vuex';

export default {
    data() {
        return {
            
        };
    },
    methods: {
    },
    computed: {
        ...mapGetters(['suggestBlogs']),
    },
    created() {
        this.$store.dispatch('suggestBlogs');
    },
    mounted() {
        new Swiper(".agenda", {
            slidesPerView: 4,
            spaceBetween: 0,
            loop: true,
            autoplay: { delay: 4000 },
            // watchSlidesVisibility: true,
            // centeredSlides: false,
            breakpoints: {
                0: { slidesPerView: 1, spaceBetween: 0, },
                640: { slidesPerView: 2, spaceBetween: 0, },
                768: { slidesPerView: 3, spaceBetween: 0, },
                1200: { slidesPerView: 4, spaceBetween: 0, },
            },
            navigation: { nextEl: ".swiper-button-next", prevEl: ".swiper-button-prev" },
            pagination: { el: ".swiper-pagination", clickable: true },
        });
    }
};
</script>
<style>
</style>
