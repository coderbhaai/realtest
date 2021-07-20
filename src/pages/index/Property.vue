<template>
  <div class="q-pa-md property">
    <h1 class="heading">Properties with us</h1>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3">
              <div class="q-px-sm">
                <h3>Filter By Price</h3>
                <!-- <q-range name="price_range" :value="lazy" @input="val => { lazy = val }" label :min="minPrice" :max="maxPrice" @change="filterOn()"/> -->
              </div>
              <h3>Filter By Property Type </h3>
              <div v-for="i in propTypeFilterOptions" :key="i.value">
                <q-checkbox v-model="filterByType" :val="i.value" :label="i.text" @input="filterOn()" v-if="propertyCopy.filter(j=>j.type==i.value).length"/>
              </div>
              <h3>Filter By Property Tags</h3>
              <div v-for="i in propTagsFilterOptions" :key="i.value">
                <q-checkbox v-model="filterByTags" :val="i.value" :label="i.text" @input="filterOn()" v-if="propertyCopy.filter(j=>JSON.parse(j.tags).includes(i.value)).length"/>
              </div>
              <h3>Filter By Amenities </h3>
              <div v-for="i in propAmenityFilterOptions" :key="i.value">
                <q-checkbox v-model="filterByAmenities" :val="i.value" :label="i.text" @input="filterOn()" v-if="propertyCopy.filter(j=>JSON.parse(j.amenities).includes(i.value)).length"/>
              </div>
              <h3>Filter By Builder</h3>
              <div v-for="i in propBuildersFilter" :key="i.value">
                <q-checkbox v-model="filterByBuilders" :val="i.value" :label="i.text" @input="filterOn()" v-if="propertyCopy.filter(j=>j.builder==i.value).length"/>
              </div>
              <h3>Filter By Beds</h3>
              <div v-for="i in propBedFilters" :key="i">
                <q-checkbox v-model="filterByBeds" :val="i" :label="i+' Bedroom'" @input="filterOn()" v-if="propertyCopy.filter(j=>j.bedroom==i).length"/>
              </div>
            </div>
            <div class="col-sm-9">
                <div class="row">
                  <PropertyCardItem v-for='j in propertyCopy' :key="j.id.toString()" v-bind="j"/>
                </div>
            </div>
        </div>
    </div>
  </div>
</template>

<script>
import { mapGetters} from 'vuex';
import PropertyCardItem from 'components/PropertyCardItem.vue'

export default {
  components: { PropertyCardItem },
  data () {
    return {
      filterByType: [],
      filterByTags: [],
      filterByAmenities: [],
      filterByBuilders: [],
      filterByBeds: [],
      lazy: { min: 0, max: 100 },
      minPrice: 0,
      maxPrice: 100,
      expanded: false,
      expandedId: '',
      lorem: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
    }
  },
  methods: {
    filterOn(){
      console.log('iiiiiiiiii')
      const data ={
        filterByType : this.filterByType,
        filterByTags : this.filterByTags,
        filterByAmenities : this.filterByAmenities,
        filterByBuilders : this.filterByBuilders,
        filterByBeds : this.filterByBeds,
        filterByPrice : this.lazy
      }
      this.$store.dispatch('filterProperty', data);
    },
    expand(id){
      if(this.expandedId != id){
        this.expandedId = id;
      }else{
        this.expandedId = '';
      }
    }
  },
  computed: {
    ...mapGetters(['propertyCopy', 'propTypeFilterOptions', 'propTagsFilterOptions', 'propAmenityFilterOptions', 'propBuildersFilter', 'propBedFilters', 'propBathFilters', 'propPriceFilters', 'propAreaFilters', 'propMinPrice', 'propMaxPrice' ]),
  },
  created() {
    this.$store.dispatch('property');
    this.$store.dispatch('propertyFilters');
    this.lazy.min = parseInt(this.$store.getters.propMinPrice)
    this.lazy.max = parseInt(this.$store.getters.propMaxPrice)
    this.minPrice = parseInt(this.$store.getters.propMinPrice)
    this.maxPrice = parseInt(this.$store.getters.propMaxPrice)
  },
}
</script>
<style lang="sass" scoped>
  .property
    .col-sm-3
      h3
        margin: 1em 0 0 0
        line-height: 1em
        font-size: 15px
        font-weight: 600
</style>