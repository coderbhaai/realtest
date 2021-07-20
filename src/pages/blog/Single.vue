<template>
  <div class="blogs">
    <img :src="'images/blog/'+ singleBlog.image"/>
    <h1 class="heading">{{singleBlog.title}}</h1>
    <div class="container">
        <div class="row q-mb-xl">
          <div class="col-12">
            {{singleBlog.content}}
          </div>
        </div>
        <h2 class="heading">Some More Reads</h2>
        <div class="row">
          <!-- <BlogCardItem v-for='i,index in suggestBlogs' :key="index" v-bind="i"/> -->
          <div class="col-sm-3 mb-5" v-for='i,index in suggestBlogs'>
            <q-card class="my-card" flat bordered>
              <a :href="'/blog/'+i.url">
                <img :src="'/images/'+i.fileURL"/>
                <q-card-section>
                  <h2>{{i.title}}</h2>
                </q-card-section>
              </a>
            </q-card>
        </div>
        </div>
        <!-- <Comments v-bind:comments="comments" v-bind:response="response" v-bind:blogId="singleBlog.id"/> -->
        <div class="blogs mb-5">
          <h2 class="heading">Share your views</h2>
          <p>Please keep your views respectful and not include any anchors, promotional content or obscene words in them. Such comments will be definitely removed and your IP be blocked for future purpose.</p>
          <div class="row">
            <div class="col-12">
              <q-card class="my-card">
                <q-card-section>
                  <q-form class="q-gutter-md q-mb-lg" @submit="addSubmit">
                    <div class="row" v-if="!user.id">
                      <div class="col-6 q-pr-lg"><q-input v-model="name" label="Name" :rules="[...rules.required]"/></div>
                      <div class="col-6 q-pr-lg"><q-input v-model="email" label="Email" :rules="[...rules.required]"/></div>
                    </div>
                    <div class="row">
                      <div class="col-12 q-pr-lg"><q-input v-model="comment" label="Comment" type="textarea" :rules="[...rules.required]"/></div>
                    </div>
                    <div class="text-center"><q-btn label="Submit" type="submit" color="primary" class="q-mr-lg" /></div>
                  </q-form>
                </q-card-section>
              </q-card>
            </div>
            <div class="col-12 text-center q-mt-xl"><h2 class="heading">Some love showed by users </h2></div>
              <div class="col-12 q-mt-lg" v-for='i,index in comments' :key='index'>
                  <q-card class="my-card commentBox"><q-card-section>
                      <span v-html="i.comment"></span>
                      <div class="row user">
                          <h4><strong>{{i.user}}</strong></h4>
                          <p>{{refineDate(i.updated_at)}}</p>
                      </div>
                      <div class="col-12" v-for='j,index2 in response' :key='index2'>
                          <div v-if="i.id === j.commentId" class="response q-my-sm">
                              <p v-html="j.comment"></p>
                              <div class="row user">
                                  <h4><strong>{{j.user}}</strong></h4>
                                  <span>{{refineDate(j.updated_at)}}</span> 
                              </div>
                          </div>
                      </div>
                      <div class="text-right"><q-btn label="Reply" color="primary" @click="changeComment(i.id)"/></div>
                      <div v-if="i.id === commentId">
                        <q-form class="q-gutter-md q-mb-lg" @submit="replyComment">
                          <div class="row" v-if="!user">
                            <div class="col-6 q-pr-lg"><q-input v-model="name" label="Name" :rules="[...rules.required]"/></div>
                            <div class="col-6 q-pr-lg"><q-input v-model="email" label="Email" :rules="[...rules.required]"/></div>
                          </div>
                          <div class="row">
                            <div class="col-12 q-pr-lg"><q-input v-model="newComment" label="Comment" type="textarea" :rules="[...rules.required]"/></div>
                          </div>
                          <q-card-actions>
                            <q-btn color="primary" label="Submit Your Views" type="submit"/>
                            <q-space />
                            <q-btn color="primary" label="No Comments" @click="resetData"/>
                          </q-card-actions>
                        </q-form>
                      </div>
                  </q-card-section></q-card>
              </div>
          </div>
        </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
import Comments from 'components/Comments.vue';
import BlogCardItem from 'components/BlogCardItem.vue'
import {rules, refineDate} from '../../store/functions'

export default {
  components: { Comments, BlogCardItem },
  name: 'blog',
  data() {
    return {
      data: [],
      blogs: [],
      category: [],
      tags: [],
      suggest: [],
      rules : rules,
      refineDate: refineDate,
      name: '',
      email: '',
      comment: '',
      newComment: '',
      commentId: 0,
      order: 0,
    };
  },
  methods: {
    addSubmit(e) {
      e.preventDefault();
      const data = {
        name: this.user.name || this.name,
        email: this.user.email || this.email,
        comment: this.comment,
        commentId: this.commentId,
        order: this.order,
        blogId: this.blogId,
      };
      this.$store.dispatch('addComment', data);
      this.resetData();
    },
    changeComment(id) {
      this.commentId = id;
      this.order = 1;
    },
    replyComment(e) {
      e.preventDefault();
      const data = {
        name: this.user.name || this.name,
        email: this.user.email || this.email,
        comment: this.newComment,
        commentId: this.commentId,
        order: this.order,
        blogId: this.blogId,
      };
      this.$store.dispatch('addComment', data);
      this.resetData();
    },
    resetData() {
      this.name = '';
      this.email = '';
      this.comment = '';
      this.commentId = 0;
      this.order = 0;
    },
  },
  computed: {
    ...mapGetters(['singleBlog', 'blogList', 'comments', 'response', 'catList', 'tagList', 'suggestBlogs', 'user']),
  },
  created() {
    // this.$store.dispatch('suggestBlogs');
    const form = {
      url: this.$route.params.url,
    };
    this.$store.dispatch('singleBlog', form);
  },
};
</script>


<style lang="sass" scoped>
  .user
    align-items: center
    justify-content: space-between
    p
        margin:0
  .response
    margin-left: 3em
    border-left: 5px solid red
    padding-left: 1em
    p
      margin:0
</style>
