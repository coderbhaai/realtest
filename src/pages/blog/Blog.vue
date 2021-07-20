<template>
  <div class="q-pa-md blogs">
    <h1 class="heading">Interesting Reads for You</h1>
    <div class="container">
      <div class="row">
        <BlogCardItem v-for="i in blogs" :key="i.id" v-bind="i"/>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters} from 'vuex';
import BlogCardItem from 'components/BlogCardItem.vue'

export default {
  components: { BlogCardItem },
  name: 'blog',
  computed: {
    ...mapGetters(['blogs']),
  },
  created() {
    this.$store.dispatch('blogs');
  },
};
</script>

<style lang="sass" scoped>
  .blogs> h1
    text-align: center
</style>
