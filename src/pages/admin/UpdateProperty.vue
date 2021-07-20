<template>
  <div class="q-pa-md">
    <h1 class="heading">Update Property Here</h1>
    <q-form class="q-gutter-md" @submit="onSubmit">
      <div class="row q-pb-lg">
        <div class="col-4 q-pr-lg"><q-input v-model="name" label="Property Name" :rules="[...rules.required]"/></div>
        <div class="col-4 q-pr-lg"><q-input v-model="url" label="Property URL" :rules="[...rules.required]"/></div>
        <div class="col-4 q-pr-lg"><q-select map-options emit-value v-model="type" :options="propTypeOptions" option-value="value" option-label="text" label="Type" :rules="[...rules.required]"/></div>
        <div class="col-6 q-pr-sm">
          <q-select map-options emit-value v-model="amenities" multiple :options="amenityOptions" option-value="value" option-label="text" counter label="Select Amenities" :rules="[...rules.required]"/>
        </div>
        <div class="col-6 q-pr-sm">
          <q-select map-options emit-value v-model="tags" multiple :options="propTagOptions" option-value="value" option-label="text" counter label="Select Tags" :rules="[...rules.required]"/>
        </div>
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
        <div class="col-6 q-pr-sm">
          <q-select map-options emit-value v-model="why" multiple :options="propWhyOptions" option-value="value" option-label="text" counter label="Select Reasons"/>
        </div>
        <div class="col-6 q-pr-lg"><q-select map-options emit-value v-model="builder" :options="builderOptions" option-value="value" option-label="text" label="Builder" :rules="[...rules.required]"/></div>
        <div class="col-12"><q-btn label="Add FAQ" color="primary" @click="addFaq()"/></div>
        <div class="col-4 q-pr-lg mb-3 closeBtnContainer" v-for="(i,index) in faq">
          <q-input label='FAQ Question' v-model="faq[index].quest" :rules="[...rules.required]" />
          <q-input label="Answer" v-model="faq[index].ans" :rules="[...rules.required]"/>
          <q-btn class="closeBtn" round color="primary" icon="remove" @click="removeFaq(index)"/>
        </div>
        <div class="col-12 mt-5"><q-btn label="Add Block" color="primary" @click="addExtraBlock()"/></div>
        <div class="col-6 q-py-sm q-pr-lg closeBtnContainer previewImg" v-for="(i,index) in blocks">
          <a :href="'/images'+oldBlocks[index]['fileURL']" target="_blank"><img :src="'/images'+oldBlocks[index]['fileURL']"/></a>
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
        <div class="col-6 q-py-sm q-pr-lg closeBtnContainer previewImg" v-for="(i,index) in extraBlocks">
          <q-file v-model="extraBlocksPic[index]" label="Block Pic" :rules="[...rules.required]"/>
          <q-input label='Heading' v-model="extraBlocks[index].head" :rules="[...rules.required]"/>
           <q-btn class="closeBtn" round color="primary" icon="remove" @click="removeExtraBlock(index)"/>
          <div class="floating-label">
            <label>Text</label>
            <q-editor
              :rules="[...rules.required]"
              v-model="extraBlocks[index].text"
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
        <div class="col-6 imgDisplay">
          <div>
            <p>Banner</p>
            <div class="previewImg" :key="xx">
              <a :href="'/images'+bannerMediaId['fileURL']" target="_blank"><img :src="'/images'+bannerMediaId['fileURL']"/></a>
            </div>
          </div>
          <q-btn label="Change Banner" color="primary" @click="editMedia('Banner','single', bannerMediaId, '/property/banner/')"/>
        </div>
        <div class="col-6 imgDisplay">
          <div>
            <p>Pics</p>
            <div class="previewImg" :key="xx">
              <a :href="'/images'+i['fileURL']" target="_blank" v-for="i in picsMediaId"><img :src="'/images'+i['fileURL']"/></a>
            </div>
          </div>
          <q-btn label="Change Pics" color="primary" @click="editMedia('Pics', 'multiple', picsMediaId, '/property/pics/')"/>
        </div>
        <div class="col-6 imgDisplay">
          <div>
            <p>Brochure</p>
            <div class="previewImg" :key="xx">
              <a :href="'/images'+i['fileURL']" target="_blank" v-for="i in brochureMediaId"><img :src="'/images'+i['fileURL']"/></a>
            </div>
          </div>
          <q-btn label="Change Brochure Pics" color="primary" @click="editMedia('Brochure', 'multiple', brochureMediaId, '/property/brochure/')"/>
        </div>
        <div class="col-6 imgDisplay">
          <div>
            <p>Blocks</p>
            <div class="previewImg" :key="xx">
              <a :href="'/images'+i['fileURL']" target="_blank" v-for="i in blockMediaId"><img :src="'/images'+i['fileURL']"/></a>
            </div>
          </div>
          <q-btn label="Change Block Pics" color="primary" @click="editMedia('Block Pics', 'multiple', blockMediaId, '/property/blocks/')"/>
        </div>
      </div>
      <div><q-btn label="Update Property" type="submit" color="primary"/></div>
    </q-form>
    <!-- <div class="col-12 fourBtns">
      <q-btn label="Change Banner" color="primary" @click="editMedia('Banner','single', bannerMediaId, '/property/banner/')"/>
      <q-btn label="Change Pics" color="primary" @click="editMedia('Pics', 'multiple', picsMediaId, '/property/pics/')"/>
      <q-btn label="Change Brochure Pics" color="primary" @click="editMedia('Brochure', 'multiple', brochureMediaId, '/property/brochure/')"/>
      <q-btn label="Change Block Pics" color="primary" @click="editMedia('Block Pics', 'multiple', blockMediaId, '/property/blocks/')"/>
    </div> -->
    <q-dialog v-model="medium" persistent transition-show="scale" transition-hide="scale">
      <q-card style="width: 70vw; max-width: 80vw;">
        <q-card-section class="modalHead"><div class="text-h6">Update {{this.changeName}}</div><q-btn flat label="Close" color="primary" v-close-popup @click="resetData()"/></q-card-section>
        <q-card-section class="q-pt-none">
          <div class="row" v-if="this.changeType=='single'">
            <div class="col-2 q-pr-lg" :key="xx">
              <a :href="'/images'+changeMedia['fileURL']" target="_blank"><img :src="'/images'+changeMedia['fileURL']"/></a>
            </div>
            <div class="col-7 q-pr-lg">
              <q-file v-model="updateMedia[0]" label="Replace with"/>
            </div>
            <div class="col-3 q-pr-lg flex-hc" v-if="updateMedia[0]">
              <q-btn label="Update Image" color="primary" @click="updateImage(0)"/>
            </div>
          </div>
          <div v-if="this.changeType=='multiple'">
            <div class="row" v-for="(i, index) in changeMedia">
              <div class="col-2 q-pr-lg">
                <a :href="'/images'+i['fileURL']" target="_blank"><img :src="'/images'+i['fileURL']"/></a>
              </div>
              <div class="col-7 q-pr-lg">
                <q-file v-model="updateMedia[index]" label="Replace with"/>
              </div>
              <div class="col-3 q-pr-lg flex-hc" v-if="updateMedia[index]">
                <q-btn label="Update Image" color="primary" @click="updateImage(index)"/>
              </div>
            </div>
            <div class="row my-5" v-if="addMedia.length">
              <div class="col-9 q-pr-lg">
                <q-file v-model="addMedia[0]" label="Add an Image"/>
              </div>
              <div class="col-3 q-pr-lg flex-hc" v-if="addMedia[0]">
                <q-btn label="Update Image" color="primary" @click="addImage()"/>
              </div>
            </div>
            <q-btn label="Add an Image" color="primary" @click="newImage()"/>
          </div>
        </q-card-section>
      </q-card>
    </q-dialog>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
import { message, rules } from '../../store/functions'

export default {
  name: 'UpdateProperty',
  data() {
    return {
      rules : rules,
      financeOptions: [
        {text: 'Not Available', value: '0'},
        {text: 'Finance Available', value: '1'},
      ],
      id: '',
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
      video: '',
      finance: '',
      possession: '',
      why: [],
      faq: [],
      pics: [],
      brochure: [],
      blocks: [],
      blocksPic: [],
      oldBanner : [],
      oldPics : [],
      oldBrochure: [],
      oldBlocks: [],
      bannerMediaId: '',
      picsMediaId: [],
      brochureMediaId: [],
      blockMediaId: [],
      medium: false,
      changeName: '',
      changeMedia : [],
      changeType : '',
      updateMedia: [],
      addMedia: [],
      mediaPath: '',
      xx : true,
      extraBlocks: [],
      extraBlocksPic: [],
      builder: ''
    };
  },
  methods: {
    addFaq(){ this.faq.push({quest: '', ans: ''}) },
    removeFaq(index){ this.faq.splice(index, 1); },
    // addBlock(){ this.extraBlocks.push({ head: '', text: ''}); this.extraBlocksPic.push('') },
    removeBlock(index){ this.blocks.splice(index, 1); this.oldBlocks.splice(index, 1); },
    addExtraBlock(){ this.extraBlocks.push({ head: '', text: ''}); this.extraBlocksPic.push('') },
    removeExtraBlock(index){ this.extraBlocks.splice(index, 1); this.extraBlocksPic.splice(index, 1); },
    editMedia(name, type, media, path){
      this.medium = true
      this.changeMedia = media
      this.changeType = type
      this.changeName = name
      this.mediaPath = path
      this.updateMedia = new Array(media.length);
    },
    newImage(){
      if(this.addMedia.length<1){
        this.addMedia = new Array(1);
        message('Please add one at a time');
      }
    },
    async addImage(){
      const data = new FormData();
      data.append('id', this.id);
      data.append('image', this.addMedia[0]);
      data.append('mediaPath', this.mediaPath);
      data.append('field', this.changeName);
      data.append('pics', this.pics);
      data.append('brochure', this.brochure);
      await this.$store.dispatch('addMediaInProperty', data);
      this.setData()
      this.resetData()
    },
    resetData(){
      this.medium = false
      this.updateMedia = []
      this.changeMedia = []
      this.changeType = ''
      this.changeName = ''
      this.addMedia = []
    },
    async updateImage(index){
      const data = new FormData();
      data.append('mediaPath', this.mediaPath);
      data.append('id', this.id);
      data.append('newMedia', this.updateMedia[index]);
      if(this.changeType =='single'){
        data.append('changeMedia', JSON.stringify(this.changeMedia));
      }else{
        data.append('changeMedia',  JSON.stringify(this.changeMedia[index]));
      }
      await this.$store.dispatch('replacePropertyMedia', data);
      this.setData()
      this.resetData()
    },
    onSubmit(e) {
      e.preventDefault();
      const data = new FormData();
      if(this.extraBlocksPic){ for(const f of this.extraBlocksPic){ data.append('extraBlocksPic', f) } }
      data.append('extraBlocks', JSON.stringify(this.extraBlocks));
      data.append('id', this.id);
      data.append('name', this.name);
      data.append('url', this.url.replace(/ /g,"-").toLowerCase());
      data.append('type', this.type);
      data.append('banner', this.banner);
      data.append('oldBanner', this.banner);
      data.append('builder', this.builder);
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
      data.append('bannerMediaId', JSON.stringify(this.bannerMediaId));
      data.append('picsMediaId', JSON.stringify(this.picsMediaId));
      data.append('brochureMediaId', JSON.stringify(this.brochureMediaId));
      data.append('blockMediaId', JSON.stringify(this.blockMediaId));
      this.$store.dispatch('updateProperty', data); 
    },
    setData(){
      this.xx = !this.xx
      this.oldBanner = this.$store.getters.propertyForEdit.bannerPic;
      this.oldPics = this.$store.getters.propertyForEdit.picsArray;
      this.pics = this.$store.getters.propertyForEdit.pics;
      this.brochure = this.$store.getters.propertyForEdit.brochure;
      this.oldBrochure = this.$store.getters.propertyForEdit.brochureArray;
      this.oldBlocks = this.$store.getters.propertyForEdit.blocksArray;
      this.blocks = JSON.parse(this.$store.getters.propertyForEdit.blocks);
      this.blocksPic = new Array(JSON.parse(this.$store.getters.propertyForEdit.blocks).length);
      this.bannerMediaId = { id: this.$store.getters.propertyForEdit.bannerPic.id, image: this.$store.getters.propertyForEdit.bannerPic.image, fileURL: this.$store.getters.propertyForEdit.bannerPic.fileURL };
      var picsId = []; this.$store.getters.propertyForEdit.picsArray.forEach(i => { picsId.push({id: i.id, image: i.image, fileURL: i.fileURL}) }); this.picsMediaId = picsId;
      var brochureId = []; this.$store.getters.propertyForEdit.brochureArray.forEach(i => { brochureId.push({id: i.id, image: i.image, fileURL: i.fileURL}) }); this.brochureMediaId = brochureId;
      var blockId = []; this.$store.getters.propertyForEdit.blocksArray.forEach(i => { blockId.push({id: i.id, image: i.image, fileURL: i.fileURL}) }); this.blockMediaId = blockId;
    },
  },
  computed: {
    ...mapGetters(['propTypeOptions', 'amenityOptions', 'propTagOptions', 'propWhyOptions', 'propertyForEdit', 'builderOptions'])
  },
  created() {
    this.$store.dispatch('addPropInputs');
    const data={
      id: parseInt(this.$route.params.id),
    }
    this.$store.dispatch('getProperty', data);
    this.amenities = JSON.parse(this.$store.getters.propertyForEdit.amenities);
    this.longdesc = this.$store.getters.propertyForEdit.longdesc
    this.id = this.$store.getters.propertyForEdit.id;
    this.builder = this.$store.getters.propertyForEdit.builder;
    this.name = this.$store.getters.propertyForEdit.name;
    this.url = this.$store.getters.propertyForEdit.url;
    this.type = this.$store.getters.propertyForEdit.type;
    this.tags = JSON.parse(this.$store.getters.propertyForEdit.tags);
    this.shortdesc = this.$store.getters.propertyForEdit.shortdesc;
    this.longdesc = this.$store.getters.propertyForEdit.longdesc;
    this.price = this.$store.getters.propertyForEdit.price;
    this.discount = this.$store.getters.propertyForEdit.discount;
    this.bedroom = this.$store.getters.propertyForEdit.bedroom;
    this.bathroom = this.$store.getters.propertyForEdit.bathroom;
    this.units = this.$store.getters.propertyForEdit.units;
    this.area = this.$store.getters.propertyForEdit.area;
    this.state = JSON.parse(this.$store.getters.propertyForEdit.address)[1];
    this.city = JSON.parse(this.$store.getters.propertyForEdit.address)[2];
    this.address = JSON.parse(this.$store.getters.propertyForEdit.address)[3];
    this.landmark = JSON.parse(this.$store.getters.propertyForEdit.address)[4];
    this.video = this.$store.getters.propertyForEdit.video;
    this.finance = this.$store.getters.propertyForEdit.finance;
    this.possession = this.$store.getters.propertyForEdit.possession;
    this.why = JSON.parse(this.$store.getters.propertyForEdit.why);
    this.faq = JSON.parse(this.$store.getters.propertyForEdit.faq);
    this.setData()
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
  .fourBtns
    margin: 2em 0
    display: flex
    align-items: center
    justify-content: space-between
  .imgDisplay
    div
      margin-top: 1em
      display: flex
      align-items: center
      >p
        margin: 0 1em 0 0
</style>
