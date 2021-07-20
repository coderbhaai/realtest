import axios from 'axios';
import { message } from './functions';
import api from './api';
/* eslint no-shadow: ["error", { "allow": ["state"] }] */

const state = {
  adminMetas: [],
  adminBasics: [],
  basicOptions: [],
  adminBlogs: [],
  catOptions: [],
  tagOptions: [],
  propTypeOptions: [],
  amenityOptions: [],
  propTagOptions: [],
  propWhyOptions: [],
  adminProperty: [],
  propertyForEdit: {},
  adminBuilders: [],
  builderOptions: [],
  adminMedia: [],
  adminLeads: [],
  adminComments: []

};

const getters = {
  adminMetas: (state) => state.adminMetas,
  adminBasics: (state) => state.adminBasics,
  basicOptions: (state) => state.basicOptions,
  adminBlogs: (state) => state.adminBlogs,
  catOptions: (state) => state.catOptions,
  tagOptions: (state) => state.tagOptions,
  propTypeOptions: (state) => state.propTypeOptions,
  amenityOptions: (state) => state.amenityOptions,
  propTagOptions: (state) => state.propTagOptions,
  propWhyOptions: (state) => state.propWhyOptions,
  adminProperty: (state) => state.adminProperty,
  propertyForEdit: (state) => state.propertyForEdit,
  adminBuilders: (state) => state.adminBuilders,
  builderOptions: (state) => state.builderOptions,
  adminMedia: (state) => state.adminMedia,
  adminLeads: (state) => state.adminLeads,
  adminComments: (state) => state.adminComments,
};

const actions = {
  async adminMetas({ commit }) { const res = await axios.get(api.adminMetas); commit('ADMINMETAS', res.data.data); },
  async addMeta({ commit }, form) {
    const res = await axios.post(api.addMeta, form);
    if (res.data.success) {
      commit('ADDMETA', res.data.data);
    }
    message(res.data.message);
  },
  async updateMeta({ commit }, form) {
    const res = await axios.post(api.updateMeta, form);
    if (res.data.success) {
      commit('UPDATEMETA', res.data.data);
    }
    message(res.data.message);
  },
  async adminBasics({ commit }) { const res = await axios.get(api.adminBasics); commit('ADMINBASICS', res.data.data); },
  async addBasic({ commit }, form) {
    const res = await axios.post(api.addBasic, form);
    if (res.data.success) { commit('ADDBASIC', res.data.data); }
    message(res.data.message);
  },
  async updateBasic({ commit }, form) {
    const res = await axios.post(api.updateBasic, form);
    if (res.data.success) { commit('UPDATEBASIC', res.data.data); }
    message(res.data.message);
  },
  async adminBlogs({ commit }) { const res = await axios.get(api.adminBlogs); commit('ADMINBLOGS', res.data.data); },
  async addBlog({ commit }, form) {
    const res = await axios.post(api.addBlog, form);
    if (res.data.success) {
      commit('ADDBLOG', res.data.data);
      this.$router.push({ path: '/admin/blogs' });
    }
    message(res.data.message);
  },
  async updateBlog({ commit }, form) {
    const res = await axios.post(api.updateBlog, form);
    if (res.data.success) {
      commit('UPDATEBLOG', res.data.data);
      this.$router.push({ path: '/admin/blogs' }); 
    }
    message(res.data.message);
  },
  async blogMetaOptions({ commit }) { const res = await axios.get(api.blogMetaOptions); commit('BLOGMETAOPTIONS', res.data.data); },

  async addPropInputs({ commit }) { const res = await axios.get(api.addPropInputs); commit('ADDPROPINPUTS', res.data); },
  async adminProperty({ commit }) { const res = await axios.get(api.adminProperty); commit('ADMINPROPERTY', res.data.data); },
  async addProperty({ commit }, form) { 
    const res = await axios.post(api.addProperty, form);
    if (res.data.success) {
      commit('ADDPROPERTY', res.data.data);
      this.$router.push({ path: '/admin/property' }); 
    }
    message(res.data.message);
  },
  async updateProperty({ commit }, form) {
    const res = await axios.post(api.updateProperty, form);
    if (res.data.success) {
      commit('UPDATEPROPERTY', res.data.data);
      this.$router.push({ path: '/admin/property' }); 
    }
    message(res.data.message);
  },
  async changePropertyStatus({ commit }, form) {
    const res = await axios.post(api.changePropertyStatus, form);
    if (res.data.success) {
      commit('CHANGEPROPERTYSTATUS', res.data.data);
    }
    message(res.data.message);
  },
  async replacePropertyMedia({ commit }, form) {
    const res = await axios.post(api.replacePropertyMedia, form);
    if (res.data.success) { commit('RESETPROPERTY', res.data.data.data); }
    message(res.data.message);
  },
  async getProperty({ commit }, form) {
    const res = await axios.get(api.getProperty+form.id);
    if (res.data.success) { commit('GETPROPERTY', res.data.data); }
  },
  async addMediaInProperty({ commit }, form) {
    const res = await axios.post(api.addMediaInProperty, form);
    if (res.data.success) { commit('RESETPROPERTY', res.data.data.data); }
  },

  async adminBuilders({ commit }) { const res = await axios.get(api.adminBuilders); commit('ADMINBUILDERS', res.data.data); },
  async addBuilder({ commit }, form) {
    const res = await axios.post(api.addBuilder, form);
    if (res.data.success) { commit('ADDBUILDER', res.data.data); }
    message(res.data.message);
  },
  async updateBuilder({ commit }, form) {
    const res = await axios.post(api.updateBuilder, form);
    if (res.data.success) { commit('UPDATEBUILDER', res.data.data); }
    message(res.data.message);
  },
  
  async adminMedia({ commit }) { const res = await axios.get(api.adminMedia); commit('ADMINMEDIA', res.data.data); },
  async updateMedia({ commit }, form) {
    const res = await axios.post(api.updateMedia, form);
    if (res.data.success) { commit('UPDATEMEDIA', res.data.data); }
    message(res.data.message);
  },

  async adminLeads({ commit }) { const res = await axios.get(api.adminLeads); commit('ADMINLEADS', res.data.data); },
  async updateLeads({ commit }, form) {
    const res = await axios.post(api.updateLeads, form);
    if (res.data.success) { commit('UPDATELEADS', res.data.data); }
    message(res.data.message);
  },
  async changeLeadStatus({ commit }, form) {
    const res = await axios.post(api.changeLeadStatus, form);
    if (res.data.success) { commit('CHANGELEADSTATUS', res.data.data); }
    message(res.data.message);
  },

  async adminComments({ commit }) { const res = await axios.get(api.adminComments); commit('ADMINCOMMENTS', res.data.data); },
  async updateComment({ commit }, form) {
    const res = await axios.post(api.updateComment, form);
    if (res.data.success) { commit('UPDATECOMMENT', res.data.data); }
    message(res.data.message);
  },
  async changeCommentStatus({ commit }, form) {
    const res = await axios.post(api.changeCommentStatus, form);
    if (res.data.success) { commit('CHANGECOMMENTSTATUS', res.data.data); }
    message(res.data.message);
  },

};

const mutations = {
  ADMINMETAS: (state, data) => { state.adminMetas = data; },
  ADDMETA: (state, data) => state.adminMetas.unshift(data),
  UPDATEMETA: (state, data) => {
    const index = state.adminMetas.findIndex((i) => i.id === data.id);
    if (index !== -1) {
      state.adminMetas.splice(index, 1, data);
    }
  },
  ADMINBASICS: (state, data) => {
    state.adminBasics = data;
    state.basicOptions = data.filter((i) => i.type === 'Basic');
  },
  ADDBASIC: (state, data) => { 
    state.adminBasics.unshift(data); 
    if(data.type=='Basic'){ state.basicOptions.unshift(data) }
  },
  UPDATEBASIC: (state, data) => {
    const index = state.adminBasics.findIndex((i) => i.id === data.id);
    if (index !== -1) { state.adminBasics.splice(index, 1, data); }
    if(data.type=="Basic"){
      const index = state.basicOptions.findIndex((i) => i.id === data.id);
      if (index !== -1) { state.basicOptions.splice(index, 1, data); }
    }
  },
  ADMINBLOGS: (state, data) => { state.adminBlogs = data; },
  BLOGMETAOPTIONS: (state, data) => {
    state.catOptions = data.filter((i) => i.type === 'Category');
    state.tagOptions = data.filter((i) => i.type === 'Tag');
  },
  ADDBLOG: (state, data) => state.adminBlogs.unshift(data),
  UPDATEBLOG: (state, data) => {
    const index = state.adminBlogs.findIndex((i) => i.id === data.id);
    if (index !== -1) { state.adminBlogs.splice(index, 1, data); }
  },

  ADMINPROPERTY: (state, data) => { state.adminProperty = data; },
  ADDPROPINPUTS: (state, data) => {
    state.propTypeOptions = data.basic.filter((i) => i.type == 'Property Type');
    state.amenityOptions = data.basic.filter((i) => i.type == 'Amenities');
    state.propTagOptions = data.basic.filter((i) => i.type == 'Property Tags');
    state.propWhyOptions = data.basic.filter((i) => i.type == 'Why');
    state.builderOptions = data.builder;
  },
  ADDPROPERTY: (state, data) => { state.adminProperty.unshift(data) },
  UPDATEPROPERTY: (state, data) => {
    const index = state.adminProperty.findIndex((i) => i.id == data.id);
    if (index !== -1) { state.adminProperty.splice(index, 1, data); }
  },
  CHANGEPROPERTYSTATUS: (state, data) => {
    const index = state.adminProperty.findIndex((i) => i.id === data.id);
    if (index !== -1) { state.adminProperty.splice(index, 1, data); }
  },

  RESETPROPERTY: (state, data) => { state.propertyForEdit = data },
  
  GETPROPERTY: (state, data) => { state.propertyForEdit = data },

  ADMINBUILDERS: (state, data) => { state.adminBuilders = data; },
  ADDBUILDER: (state, data) => state.adminBuilders.unshift(data),
  UPDATEBUILDER: (state, data) => {
    const index = state.adminBuilders.findIndex((i) => i.id === data.id);
    if (index !== -1) { state.adminBuilders.splice(index, 1, data); }
  },

  ADMINMEDIA: (state, data) => { state.adminMedia = data; },
  UPDATEMEDIA: (state, data) => {
    const index = state.adminMedia.findIndex((i) => i.id === data.id);
    if (index !== -1) { state.adminMedia.splice(index, 1, data); }
  },

  ADMINLEADS: (state, data) => { state.adminLeads = data; },
  UPDATELEADS: (state, data) => {
    const index = state.adminLeads.findIndex((i) => i.id === data.id);
    if (index !== -1) { state.adminLeads.splice(index, 1, data); }
  },
  CHANGELEADSTATUS: (state, data) => {
    const index = state.adminLeads.findIndex((i) => i.id === data.id);
    if (index !== -1) { state.adminLeads.splice(index, 1, data); }
  },

  ADMINCOMMENTS: (state, data) => { state.adminComments = data; },
  UPDATECOMMENT: (state, data) => {
    const index = state.adminComments.findIndex((i) => i.id === data.id);
    if (index !== -1) { state.adminComments.splice(index, 1, data); }
  },
  CHANGECOMMENTSTATUS: (state, data) => {
    const index = state.adminComments.findIndex((i) => i.id === data.id);
    if (index !== -1) { state.adminComments.splice(index, 1, data); }
  },

};

export default {
  state,
  getters,
  actions,
  mutations,
};
