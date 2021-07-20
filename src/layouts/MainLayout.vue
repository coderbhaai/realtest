<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated>
      <q-toolbar>
        <div v-if="user">
          <q-btn flat dense round icon="menu" aria-label="Menu" @click="left = !left"/>
        </div>
        <q-toolbar-title><a href="/" class="logo">Real Estate</a></q-toolbar-title>
        <ul class="navbar">
          <li><a href="/property">Property</a></li>
          <li><a href="/blog">Blogs</a></li>
          <li><a href="/contact">Contact</a></li>
          <li v-if="!user"><a href="/register">Register</a></li>
          <li v-if="!user"><a href="/login">Login</a></li>
        </ul>
      </q-toolbar>
    </q-header>
    <div v-if="user">
      <q-drawer v-model="left" :show-if-above="false" bordered content-class="bg-grey-1">
        <q-list>
          <q-item-label header class="text-grey-8">Admin Panel</q-item-label>
            <EssentialLink v-for="link in essentialLinks" :key="link.title" v-bind="link"/>
        </q-list>
        <div v-if="user">
          <q-item><q-item-section avatar><q-icon name="schedule"/></q-item-section><q-item-section @click="logOut"><q-item-label>Log Out</q-item-label></q-item-section></q-item>
        </div>
        <div v-else>
          <q-list class="rounded-borders">
            <q-item clickable tag="a" href="/register"><q-item-section avatar><q-icon name="schedule" /></q-item-section><q-item-section><q-item-label>Register</q-item-label></q-item-section></q-item>
            <q-item clickable tag="a" href="/login"><q-item-section avatar><q-icon name="schedule" /></q-item-section><q-item-section><q-item-label>Login</q-item-label></q-item-section></q-item>
          </q-list>
        </div>
      </q-drawer>
    </div>
    <q-page-container>
      <router-view />
    </q-page-container>
    <Footer/>
  </q-layout>
</template>
<script>
import { mapGetters } from 'vuex';
import EssentialLink from 'components/EssentialLink.vue'
import Footer from 'components/Footer.vue'

const adminData = [
  { title: 'Meta Tags', caption: 'Add Meta Tags here', icon: 'school', link: '/admin/meta' },
  { title: 'Basics', caption: 'All Basic data', icon: 'code', link: '/admin/basics' },
  { title: 'Blogs', caption: 'Blogs', icon: 'chat', link: '/admin/blogs' },
  { title: 'Comments', caption: 'Comments', icon: 'rss_feed', link: '/admin/comments' },
  { title: 'Property', caption: 'Property Details', icon: 'record_voice_over', link: '/admin/property' },
  { title: 'Builders', caption: 'Registered Builders', icon: 'record_voice_over', link: '/admin/builders' },
  { title: 'Media', caption: 'All About Images', icon: 'rss_feed', link: '/admin/media' },
  { title: 'Leads', caption: 'Leads Generated', icon: 'rss_feed', link: '/admin/leads' }
];
export default {
  name: 'MainLayout',
  components: { EssentialLink, Footer },
  data () {
    return {
      leftDrawerOpen: false,
      left: false,
      right: false,
      essentialLinks: {}
    }
  },
  methods: {
    logOut(e) {
      e.preventDefault();
      const data={
        id: this.user.id
      }
      this.$store.dispatch('logout', data);
    },
  },
  computed: {
    ...mapGetters(['user']), 
  }, 
  created() {
    if(this.user && this.user == "Admin"){
      this.essentialLinks = adminData
    }
  },
}
</script>

<style lang="sass" scoped>
  .q-item__section--main:hover
    cursor: pointer
  .navbar
    display: flex
    li
      a
        color: #fff
        padding: 15px 20px
</style>