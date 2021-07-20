<template>
  <div class="q-pa-md">
    <h1 class="heading">Add Property Here</h1>
    <q-form class="q-gutter-md" @submit="onSubmit">
      <div class="row q-pb-lg">
        <div class="col-4 q-pr-lg"><q-input v-model="name" label="Property Name" :rules="[...rules.required]"/></div>
        <div class="col-4 q-pr-lg"><q-input v-model="url" label="Property URL" :rules="[...rules.required]"/></div>
        <div class="col-4 q-pr-lg"><q-select map-options emit-value v-model="type" :options="propTypeOptions" option-value="value" option-label="text" label="Type" :rules="[...rules.required]"/></div>
        <div class="col-4 q-pr-lg"><q-file v-model="banner" label="Property Banner" :rules="[...rules.required]"/></div>
        <div class="col-4 q-pr-lg"><q-file multiple v-model="pics" label="Property Pics" :rules="[...rules.required]"/></div>
        <div class="col-4 q-pr-lg"><q-select map-options emit-value v-model="builder" :options="builderOptions" option-value="value" option-label="text" label="Builder" :rules="[...rules.required]"/></div>
        <div class="col-6 q-pr-sm"><q-select map-options emit-value v-model="amenities" multiple :options="amenityOptions" option-value="value" option-label="text" counter label="Select Amenities" :rules="[...rules.required]"/></div>
        <div class="col-6 q-pr-sm"><q-select map-options emit-value v-model="tags" multiple :options="propTagOptions" option-value="value" option-label="text" counter label="Select Tags" :rules="[...rules.required]"/></div>
        <div class="col-2 q-pr-lg"><q-input v-model="price" type="number" label="Property Price" :rules="[...rules.required]"/></div>
        <div class="col-2 q-pr-lg"><q-input v-model="discount" type="number" label="Discount" :rules="[...rules.required]"/></div>
        <div class="col-2 q-pr-lg"><q-input v-model="bedroom" type="number" label="Bedroom"/></div>
        <div class="col-2 q-pr-lg"><q-input v-model="bathroom" type="number" label="Bathroom"/></div>
        <div class="col-2 q-pr-lg"><q-input v-model="units" type="number" label="Units Available"/></div>
        <div class="col-2 q-pr-lg"><q-input v-model="area" type="number" label="Carpet Area"/></div>
        <div class="col-2 q-pr-lg"><q-input v-model="state" label="State"/></div>
        <div class="col-2 q-pr-lg"><q-input v-model="city" label="City"/></div>
        <div class="col-4 q-pr-lg"><q-input v-model="address" label="Address"/></div>
        <div class="col-4 q-pr-lg"><q-input v-model="landmark" label="Landmark"/></div>
        <div class="col-4 q-pr-lg"><q-file multiple v-model="brochure" label="Brochure"/></div>
        <div class="col-4 q-pr-lg"><q-input v-model="video" label="Youtube Video"/></div>
        <div class="col-4 q-pr-lg">
          <q-select map-options emit-value v-model="finance" :options="financeOptions" option-value="value" option-label="text" label="Finance Availability" :rules="[...rules.required]"/>
        </div>
        <div class="col-4 q-pr-lg">
          <q-input v-model="possession" mask="date" label="Possession Date (YYYY/MM/DD)" :rules="['date']">
            <template v-slot:append>
              <q-icon name="event" class="cursor-pointer">
                <q-popup-proxy ref="qDateProxy" transition-show="scale" transition-hide="scale">
                  <q-date v-model="possession">
                    <div class="row items-center justify-end">
                      <q-btn v-close-popup label="Close" color="primary" flat />
                    </div>
                  </q-date>
                </q-popup-proxy>
              </q-icon>
            </template>
          </q-input>
        </div>
        <div class="col-8 q-pr-sm">
          <q-select map-options emit-value v-model="why" multiple :options="propWhyOptions" option-value="value" option-label="text" counter label="Select Reasons"/>
        </div>
        <div class="col-12"><q-btn label="Add FAQ" color="primary" @click="addFaq()"/></div>
        <div class="col-4 q-pr-lg mb-3 closeBtnContainer" v-for="(i,index) in faq">
          <q-input label='FAQ Question' v-model="faq[index].quest" :rules="[...rules.required]" />
          <q-input label="Answer" v-model="faq[index].ans" :rules="[...rules.required]"/>
          <q-btn class="closeBtn" round color="primary" icon="remove" @click="removeFaq(index)"/>
        </div>
        <div class="col-12 mt-5"><q-btn label="Add Block" color="primary" @click="addBlock()"/></div>
        <div class="col-6 q-py-sm q-pr-lg closeBtnContainer" v-for="(i,index) in blocks">
          <q-file v-model="blocksPic[index]" label="Block Pic" :rules="[...rules.required]"/>
          <q-input label='Heading' v-model="blocks[index].head" :rules="[...rules.required]" />
           <q-btn class="closeBtn" round color="primary" icon="remove" @click="removeBlock(index)"/>
          <div class="floating-label">
            <label>Text</label>
            <q-editor
              :rules="[...rules.required]"
              v-model="blocks[index].text"
              :dense="$q.screen.lt.md"
              :toolbar="[
                [
                  {
                    label: $q.lang.editor.align,
                    icon: $q.iconSet.editor.align,
                    fixedLabel: true,
                    list: 'only-icons',
                    options: ['left', 'center', 'right', 'justify']
                  },
                  {
                    label: $q.lang.editor.align,
                    icon: $q.iconSet.editor.align,
                    fixedLabel: true,
                    options: ['left', 'center', 'right', 'justify']
                  }
                ],
                ['bold', 'italic', 'strike', 'underline', 'subscript', 'superscript'],
                ['token', 'hr', 'link', 'custom_btn'],
                ['print', 'fullscreen'],
                [
                  {
                    label: $q.lang.editor.formatting,
                    icon: $q.iconSet.editor.formatting,
                    list: 'no-icons',
                    options: [ 'p', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'code' ]
                  },
                  {
                    label: $q.lang.editor.fontSize,
                    icon: $q.iconSet.editor.fontSize,
                    fixedLabel: true,
                    fixedIcon: true,
                    list: 'no-icons',
                    options: [ 'size-1', 'size-2', 'size-3', 'size-4', 'size-5', 'size-6', 'size-7' ]
                  },
                  {
                    label: $q.lang.editor.defaultFont,
                    icon: $q.iconSet.editor.font,
                    fixedIcon: true,
                    list: 'no-icons',
                    options: [ 'default_font', 'arial', 'arial_black', 'comic_sans', 'courier_new', 'impact', 'lucida_grande', 'times_new_roman', 'verdana' ]
                  },
                  'removeFormat'
                ],
                ['quote', 'unordered', 'ordered', 'outdent', 'indent'],

                ['undo', 'redo'],
                ['viewsource']
              ]"
              :fonts="{ arial: 'Arial', arial_black: 'Arial Black', comic_sans: 'Comic Sans MS', courier_new: 'Courier New', impact: 'Impact', lucida_grande: 'Lucida Grande', times_new_roman: 'Times New Roman', verdana: 'Verdana' }"
            />
          </div>
        </div>
      </div>
      <div class="row q-pb-lg">
        <div class="col-6 q-pr-lg">
          <label>Short Description</label>
          <q-editor
            :rules="[...rules.required]"
            v-model="shortdesc"
            :dense="$q.screen.lt.md"
            :toolbar="[
              [
                {
                  label: $q.lang.editor.align,
                  icon: $q.iconSet.editor.align,
                  fixedLabel: true,
                  list: 'only-icons',
                  options: ['left', 'center', 'right', 'justify']
                },
                {
                  label: $q.lang.editor.align,
                  icon: $q.iconSet.editor.align,
                  fixedLabel: true,
                  options: ['left', 'center', 'right', 'justify']
                }
              ],
              ['bold', 'italic', 'strike', 'underline', 'subscript', 'superscript'],
              ['token', 'hr', 'link', 'custom_btn'],
              ['print', 'fullscreen'],
              [
                {
                  label: $q.lang.editor.formatting,
                  icon: $q.iconSet.editor.formatting,
                  list: 'no-icons',
                  options: [ 'p', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'code' ]
                },
                {
                  label: $q.lang.editor.fontSize,
                  icon: $q.iconSet.editor.fontSize,
                  fixedLabel: true,
                  fixedIcon: true,
                  list: 'no-icons',
                  options: [ 'size-1', 'size-2', 'size-3', 'size-4', 'size-5', 'size-6', 'size-7' ]
                },
                {
                  label: $q.lang.editor.defaultFont,
                  icon: $q.iconSet.editor.font,
                  fixedIcon: true,
                  list: 'no-icons',
                  options: [ 'default_font', 'arial', 'arial_black', 'comic_sans', 'courier_new', 'impact', 'lucida_grande', 'times_new_roman', 'verdana' ]
                },
                'removeFormat'
              ],
              ['quote', 'unordered', 'ordered', 'outdent', 'indent'],

              ['undo', 'redo'],
              ['viewsource']
            ]"
            :fonts="{ arial: 'Arial', arial_black: 'Arial Black', comic_sans: 'Comic Sans MS', courier_new: 'Courier New', impact: 'Impact', lucida_grande: 'Lucida Grande', times_new_roman: 'Times New Roman', verdana: 'Verdana' }"
          />
        </div>
        <div class="col-6">
          <label>Long Description</label>
          <q-editor
            :rules="[...rules.required]"
            v-model="longdesc"
            :dense="$q.screen.lt.md"
            :toolbar="[
              [
                {
                  label: $q.lang.editor.align,
                  icon: $q.iconSet.editor.align,
                  fixedLabel: true,
                  list: 'only-icons',
                  options: ['left', 'center', 'right', 'justify']
                },
                {
                  label: $q.lang.editor.align,
                  icon: $q.iconSet.editor.align,
                  fixedLabel: true,
                  options: ['left', 'center', 'right', 'justify']
                }
              ],
              ['bold', 'italic', 'strike', 'underline', 'subscript', 'superscript'],
              ['token', 'hr', 'link', 'custom_btn'],
              ['print', 'fullscreen'],
              [
                {
                  label: $q.lang.editor.formatting,
                  icon: $q.iconSet.editor.formatting,
                  list: 'no-icons',
                  options: [ 'p', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'code' ]
                },
                {
                  label: $q.lang.editor.fontSize,
                  icon: $q.iconSet.editor.fontSize,
                  fixedLabel: true,
                  fixedIcon: true,
                  list: 'no-icons',
                  options: [ 'size-1', 'size-2', 'size-3', 'size-4', 'size-5', 'size-6', 'size-7' ]
                },
                {
                  label: $q.lang.editor.defaultFont,
                  icon: $q.iconSet.editor.font,
                  fixedIcon: true,
                  list: 'no-icons',
                  options: [ 'default_font', 'arial', 'arial_black', 'comic_sans', 'courier_new', 'impact', 'lucida_grande', 'times_new_roman', 'verdana' ]
                },
                'removeFormat'
              ],
              ['quote', 'unordered', 'ordered', 'outdent', 'indent'],
              ['undo', 'redo'],
              ['viewsource']
            ]"
            :fonts="{ arial: 'Arial', arial_black: 'Arial Black', comic_sans: 'Comic Sans MS', courier_new: 'Courier New', impact: 'Impact', lucida_grande: 'Lucida Grande', times_new_roman: 'Times New Roman', verdana: 'Verdana' }"
          />
        </div>
      </div>
      <div><q-btn label="Add A Property" type="submit" color="primary"/></div>
    </q-form>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
import {rules} from '../../store/functions'

export default {
  name: 'AddProperty',
  data() {
    return {
      rules : rules,
      financeOptions: [
        {text: 'Not Available', value: '0'},
        {text: 'Finance Available', value: '1'},
      ],
      name:   '',
      url: '',
      type: '',
      banner:'',
      pics: [],
      amenities: [],
      tags: [],
      shortdesc: '',
      longdesc: '',
      price: '',
      discount: '',
      bedroom: '',
      bathroom: '',
      units: '',
      area: '',
      state:  '',
      city:   '',
      address:  '',
      landmark:   '',
      brochure: '',
      video: '',
      finance: '',
      possession: '',
      why: [],
      faq: [],
      blocks: [],
      blocksPic: [],
      builder: ''
    };
  },
  methods: {
    addFaq(){ this.faq.push({quest: '', ans: ''}) },
    addBlock(){ 
      this.blocks.push({ head: '', text: ''})
      this.blocksPic.push('')
    },
    removeFaq(index){ this.faq.splice(index, 1); },
    removeBlock(index){ 
      this.blocks.splice(index, 1);
      this.blocksPic.splice(index, 1); 
    },
    onSubmit(e) {
      e.preventDefault();
      const data = new FormData();
      if(this.pics){ for(const f of this.pics){ data.append('pics', f) } }
      if(this.brochure){ for(const f of this.brochure){ data.append('brochure', f) } }
      if(this.blocksPic){ for(const f of this.blocksPic){ data.append('blocksPic', f) } }
      data.append('name', this.name);
      data.append('url', this.url.replace(/ /g,"-").toLowerCase());
      data.append('builder', this.builder);
      data.append('type', this.type);
      data.append('banner', this.banner);
      data.append('shortdesc', this.shortdesc);
      data.append('longdesc', this.longdesc);
      data.append('amenities', JSON.stringify(this.amenities));
      data.append('tags', JSON.stringify(this.tags));
      data.append('price', this.price);
      data.append('discount', this.discount);
      data.append('bedroom', this.bedroom);
      data.append('bathroom', this.bathroom);
      data.append('units', this.units);
      data.append('address', JSON.stringify(["India", this.state, this.city, this.address, this.landmark ]));
      data.append('area', this.area);
      data.append('faq', JSON.stringify(this.faq));
      data.append('video', this.video);
      data.append('finance', this.finance);
      data.append('possession', this.possession);
      data.append('why', JSON.stringify(this.why));
      data.append('blocks', JSON.stringify(this.blocks));
      data.append('landmark', this.landmark);
      this.$store.dispatch('addProperty', data); 
    },
  },
  computed: {
    ...mapGetters(['propTypeOptions', 'amenityOptions', 'propTagOptions', 'propWhyOptions', 'builderOptions']),
  },
  created() {
    this.$store.dispatch('addPropInputs');
  },
};
</script>

<style lang="sass" scoped>
  .closeBtnContainer
    position: relative
  .closeBtn
    position: absolute
    top: 0
    right: 0
</style>
