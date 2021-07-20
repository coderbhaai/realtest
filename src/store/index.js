
// import Vue from 'vue'
// import Vuex from 'vuex';
// import createPersistedState from 'vuex-persistedstate';

// Vue.use(Vuex)

// import user from './user';
// import auth from './auth';
// import blog from './blog';
// import admin from './admin';


// const store = new Vuex.Store({
//   modules:{
//     user,
//     auth,
//     blog,
//     admin
//   },
//   plugins: [createPersistedState()],
//   mutations: {
//     increment: state => state.count++,
//     decrement: state => state.count--
//   }
// });












import Vuex from 'vuex';
import { createStore } from 'vuex'
import createPersistedState from 'vuex-persistedstate'
import * as Cookies from "js-cookie";

import user from './user';
import auth from './auth';
import blog from './blog';
import admin from './admin';

// Vue.config.devtools = true;
// Vue.use(Vuex)

const store = createStore({
  modules: {
    user,
    auth,
    blog,
    admin,
  },
  // plugins: [createPersistedState()],
  plugins: [
    createPersistedState({
      storage: {
        getItem: (key) => Cookies.get(key),
        // Please see https://github.com/js-cookie/js-cookie#json, on how to handle JSON.
        setItem: (key, value) =>
          Cookies.set(key, value, { expires: 3, secure: true }),
          removeItem: (key) => Cookies.remove(key),
        },
    }),
  ],
})


export default store;