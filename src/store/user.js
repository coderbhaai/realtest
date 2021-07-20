import axios from 'axios';
import { message } from './functions';
import api from './api';
/* eslint no-shadow: ["error", { "allow": ["state"] }] */

const state = {
  property: [],
  propertyCopy: [],
  propTypeFilterOptions : [],
  propTagsFilterOptions : [],
  propAmenityFilterOptions : [],
  propBuildersFilter : [],
  propBedFilters : [],
  propBathFilters : [],
  propPriceFilters : [],
  propAreaFilters : [],
  propMinPrice : '',
  propMaxPrice : '',
  singleProperty: {},
  suggestProp: [],
  userPropTypeOptions: [],
  homeBlogs: [],
};

const getters = {
  property: (state) => state.property,
  propertyCopy: (state) => state.propertyCopy,
  propTypeFilterOptions : (state) => state.propTypeFilterOptions,
  propTagsFilterOptions : (state) => state.propTagsFilterOptions,
  propAmenityFilterOptions : (state) => state.propAmenityFilterOptions,
  propBuildersFilter : (state) => state.propBuildersFilter,
  propBedFilters : (state) => state.propBedFilters,
  propBathFilters : (state) => state.propBathFilters,
  propPriceFilters : (state) => state.propPriceFilters,
  propAreaFilters : (state) => state.propAreaFilters,
  propMinPrice : (state) => state.propMinPrice,
  propMaxPrice : (state) => state.propMaxPrice,
  singleProperty : (state) => state.singleProperty,
  suggestProp : (state) => state.suggestProp,
  homeBlogs : (state) => state.homeBlogs,
  userPropTypeOptions : (state) => state.userPropTypeOptions,
};

const actions = {
  async property({ commit }) {
    const res = await axios.get(api.property);
    commit('PROPERTY', res.data.data);
  },
  async propertyFilters({ commit }) {
    const res = await axios.get(api.propertyFilters);
    commit('PROPERTYFILTERS', res.data);
  },
  async filterProperty({ commit }, form) { commit('FILTERPROPERTY', form); },
  async singleProperty({ commit }, form) {
    const res = await axios.get(api.singleProperty + form.url);
    commit('SINGLEPROPERTY', res.data);
  },
  async subscribe({ commit }, form) {
    const res = await axios.post(api.subscribe, form);
    message(res.data.message);
    commit('SUBSCRIBE', form);
  },
  async getHomeBlogs({ commit }) {
    const res = await axios.get(api.getHomeBlogs);
    commit('GETHOMEBLOGS', res.data);
  },
  async addLeads({ commit }, form) { 
    const res = await axios.post(api.addLeads, form);
    message(res.data.message);
    commit('ADDLEADS', form); 
  },

}

const mutations = {
  PROPERTY: (state, data) => { 
    state.property = data
    state.propertyCopy = data
  },
  PROPERTYFILTERS: (state, data) => { 
    state.propTypeFilterOptions = data.basic.filter((i) => i.type == 'Property Type');
    state.propTagsFilterOptions = data.basic.filter((i) => i.type == 'Property Tags');
    state.propAmenityFilterOptions = data.basic.filter((i) => i.type == 'Amenities');
    state.propMinPrice = data.minPrice
    state.propMaxPrice = data.maxPrice
    state.propBuildersFilter = data.builders
    var beds = []; data.dist.forEach(i => { beds.push(i.bedroom) }); state.propBedFilters = [...new Set(beds)];
    var baths = []; data.dist.forEach(i => { baths.push(i.bathroom) }); state.propBathFilters = [...new Set(baths)];
    var price = []; data.dist.forEach(i => { price.push(i.price) }); state.propPriceFilters = [...new Set(price)];
    var area = []; data.dist.forEach(i => { area.push(i.area) }); state.propAreaFilters = [...new Set(area)];
  },

  FILTERPROPERTY: (state, data) => {
    var xx = state.property.filter( i=> i.price>=data.filterByPrice.min && i.price<=data.filterByPrice.max)
    if(data.filterByType.length>0){ xx = xx.filter( i=> data.filterByType.includes(i.type) ) }
    if(data.filterByTags.length>0){ xx = xx.filter( i=> data.filterByTags.some(r=> JSON.parse(i.tags).includes(r)) ) }
    if(data.filterByAmenities.length>0){ xx = xx.filter( i=> data.filterByAmenities.some(r=> JSON.parse(i.amenities).includes(r)) ) }
    if(data.filterByBuilders.length>0){ xx = xx.filter( i=> data.filterByBuilders.includes(i.builder) ) }
    if(data.filterByBeds.length>0){ xx = xx.filter( i=> data.filterByBeds.includes(i.bedroom) ) }
    state.propertyCopy = xx
  },
  SINGLEPROPERTY: (state, data) => {
    state.singleProperty = data.data
    state.suggestProp = data.suggestProp
  },
  GETHOMEBLOGS: (state, data) => {
    state.userPropTypeOptions = data.propTypeOptions
    state.homeBlogs = data.property
  },
  ADDLEADS: (state, data) => {
  },
};

export default {
  state,
  getters,
  actions,
  mutations,
};
