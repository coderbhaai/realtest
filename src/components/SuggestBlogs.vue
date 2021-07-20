<template>
    <div class="homeBlogs container my-5">
        <h2 class="heading">Some Interesting Reads</h2>
        <div class="row">
            <BlogCardItem v-for='i in suggestBlogs' :key="i.id.toString()" v-bind="i"/>
        </div>
    </div>
</template>
<script>
import { mapGetters} from 'vuex';
import BlogCardItem from 'components/BlogCardItem.vue'

export default {
    components: { BlogCardItem },
    computed: {
        ...mapGetters(['suggestBlogs']),
    },
    created() {
        this.$store.dispatch('suggestBlogs');
    },
};
</script>
<style>
</style>
