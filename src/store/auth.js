import { LocalStorage, SessionStorage } from 'quasar';
import axios from 'axios';
import setAxiosHeaders from './helpers';
import api from './api';
import { message } from './functions';
import { Cookies } from 'quasar'

/* eslint no-shadow: ["error", { "allow": ["state"] }] */
const state = {
  // user: [],
  // user: LocalStorage.getItem('user'),
  // user: Cookies.get('user'),
  // user: SessionStorage.get('user'),
  isLoggedIn: false,
  role: '',
};

console.log(`state.user`, state.user)
// console.log(`Cookies.get('cookie_name')`, Cookies.get('cookie_name'))

const getters = {
  user: (state) => state.user,
  isLoggedIn: (state)=>state.isLoggedIn,
  role: (state)=>state.role,
};

const actions = {
  async register({ commit }, form) {
    const res = await axios.post(api.register, form); if (res.data.success) { this.$router.push({ path: '/login' }); }
    message(res.data.message);
  },
  async login({ commit }, form) {
    const res = await axios.post(api.login, form);
    if (res.data.success) {
      commit('LOGIN', res.data);
      setAxiosHeaders(state);
      this.$router.push({ path: '/' }); 
    }
    message(res.data.message);
  },
  async logout({ commit }, form) {
    const res = await axios.post(api.logout, form);
    if (res.data.success) {
      commit('LOGOUT', res.data.message);
    }
    message(res.data.message);
    this.$router.push({ path: '/login' });
  },
};

const mutations = {
  LOGIN: (state, data) => {
    state.user = data.user;
    state.isLoggedIn = true;
    state.role = data.user.role;
    LocalStorage.set('user', data.user);
    SessionStorage .set('user', data.user);

    Cookies.set('user', data.user)
    console.log('login set', data.user)
    setAxiosHeaders(state);
  },
  LOGOUT: (state) => {
    state.user = null;
    state.isLoggedIn = false;
    state.role = '';
    LocalStorage.clear();
    setAxiosHeaders(state);
  },
};

export default { state, getters, actions, mutations, };
