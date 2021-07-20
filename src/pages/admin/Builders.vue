<template>
  <div class="q-pa-md">
    <div v-if="showAddForm"><q-btn @click="hideForm()" class="q-mb-lg" rounded glossy color="accent">Hide Form</q-btn></div>
    <div v-else><q-btn @click="showForm()" class="q-mb-lg" rounded glossy color="primary">Add Builder</q-btn></div>
    <div v-if="showAddForm">
      <q-form class="q-gutter-md q-mb-lg" @submit="addSubmit">
        <div class="row">
          <div class="col-3 q-pr-lg"><q-input v-model="name" label="Name" :rules="[...rules.required]"/></div>
          <div class="col-3 q-pr-lg"><q-input v-model="url" label="URL" :rules="[...rules.required]"/></div>
          <div class="col-3 q-pr-lg"><q-input v-model="email" label="Email" :rules="[...rules.required]"/></div>
          <div class="col-3 q-pr-lg"><q-input v-model="phone" label="Phone" :rules="[...rules.required]"/></div>
          <div class="col-2 q-pr-lg"><q-file v-model="logo" label="Logo"/></div>
          <div class="col-2 q-pr-lg"><q-file v-model="brochure" label="Brochure"/></div>
          <div class="col-2 q-pr-lg"><q-input v-model="state" label="State" :rules="[...rules.required]"/></div>
          <div class="col-3 q-pr-lg"><q-input v-model="city" label="city" :rules="[...rules.required]"/></div>
          <div class="col-3 q-pr-lg"><q-input v-model="address" label="address" :rules="[...rules.required]"/></div>
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
        <div><q-btn label="Submit" type="submit" color="primary" class="q-mr-lg" /></div>
      </q-form>
    </div>
    <q-dialog v-model="medium" persistent transition-show="scale" transition-hide="scale">
      <q-card style="width: 70vw; max-width: 80vw;">
        <q-card-section class="modalHead"><div class="text-h6">Update Video</div><q-btn flat label="Close" color="primary" v-close-popup @click="resetData()"/></q-card-section>
        <q-card-section class="q-pt-none">
          <q-form class="q-gutter-md" @submit="updateSubmit">
            <div class="row">
              <div class="col-3 q-pr-lg"><q-input v-model="name" label="Name" :rules="[...rules.required]"/></div>
              <div class="col-3 q-pr-lg"><q-input v-model="url" label="URL" :rules="[...rules.required]"/></div>
              <div class="col-3 q-pr-lg"><q-input v-model="email" label="Email" :rules="[...rules.required]"/></div>
              <div class="col-3 q-pr-lg"><q-input v-model="phone" label="Phone" :rules="[...rules.required]"/></div>
              <div class="col-2 q-pr-lg previewImg">
                <q-file v-model="logo" label="Logo"/>
                <a :href="'/images/builder/logo/'+oldLogo" target="_blank"><img :src="'/images/builder/logo/'+oldLogo"/></a>
              </div>
              <div class="col-2 q-pr-lg previewImg">
                <q-file v-model="brochure" label="Brochure"/>
                <a :href="'/images/builder/brochure/'+oldBrochure" target="_blank"><img :src="'/images/builder/brochure/'+oldBrochure"/></a>
              </div>
              <div class="col-2 q-pr-lg"><q-input v-model="state" label="State" :rules="[...rules.required]"/></div>
              <div class="col-3 q-pr-lg"><q-input v-model="city" label="city" :rules="[...rules.required]"/></div>
              <div class="col-3 q-pr-lg"><q-input v-model="address" label="address" :rules="[...rules.required]"/></div>
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
            <div class="text-center"><q-btn label="Submit" type="submit" color="primary" class="q-mr-lg"/></div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>
    <q-table title="Meta Tags" :data="adminBuilders" :columns="columns" row-key="id" class="my-sticky-header-table" :pagination.sync="pagination">
      <template v-slot:header="props"><q-tr :props="props"><q-th v-for="col in props.cols" :key="col.name" :props="props">{{ col.label }}</q-th></q-tr></template>
      <template v-slot:body="props">
        <q-tr :props="props">
          <q-td key="id" :props="props">{{ props.row.id }}</q-td>
          <q-td key="name" :props="props">{{ props.row.name }}</q-td>
          <q-td key="name" :props="props">{{ props.row.name }}</q-td>
          <q-td key="status" :props="props">{{ props.row.status }}</q-td>
          <q-td key="updated_at" :props="props" v-html="refineDate(props.row.updated_at)"></q-td>
          <q-td class="edit"><q-icon name="edit" @click="updateDialog(props.row)"/></q-td>
        </q-tr>
      </template>
    </q-table>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
import {rules, refineDate} from '../../store/functions'

export default {
  data() {
    return {
      rules : rules,
      refineDate: refineDate,
      id: '',
      name: '',
      url: '',
      email: '',
      phone: '',
      logo: '',
      brochure: '',
      shortdesc: '',
      longdesc: '',
      state: '',
      city: '',
      address: '',
      oldLogo:'',
      oldLogoId:'',
      oldBrochure:'',
      oldBrochureId: '',
      showAddForm: false,
      medium: false,
      columns: [
        { name: 'id', label: 'Sl No.', align: 'left', field: 'Edit', },
        { name: 'name', label: 'Name', align: 'left', field: 'name', sortable: true, },
        { name: 'address', label: 'Address', align: 'left', field: 'address', sortable: true, },
        { name: 'status', label: 'Status', align: 'left', field: 'status', sortable: true, },
        { name: 'updated_at', label: 'Date', align: 'left', field: 'updated_at', sortable: true, },
        { name: 'id', label: 'Edit', align: 'left', field: 'id', sortable: true, },
      ],
      pagination: { rowsPerPage: 30 },
    };
  },
  methods: {
    showForm() { this.showAddForm = true; },
    hideForm() { this.showAddForm = false; },
    addSubmit(e) {
      e.preventDefault();
      const data = new FormData();
      data.append('name', this.name);
      data.append('url', this.url.replace(/ /g,"-").toLowerCase());
      data.append('email', this.email);
      data.append('phone', this.phone);
      data.append('logo', this.logo);
      data.append('brochure', this.brochure);
      data.append('shortdesc', this.shortdesc);
      data.append('longdesc', this.longdesc);
      data.append('address', JSON.stringify(["India", this.state, this.city, this.address]));
      this.$store.dispatch('addBuilder', data);
      this.resetData();
    },
    resetData() {
      this.id =''
      this.name =''
      this.url =''
      this.email =''
      this.phone =''
      this.logo =''
      this.brochure =''
      this.shortdesc =''
      this.longdesc =''
      this.state =''
      this.city =''
      this.address =''
      this.oldLogo = ''
      this.oldBrochure = ''
      this.showAddForm = false
      this.medium = false
    },
    updateDialog(data) {
      this.id = data.id
      this.name = data.name
      this.url =  data.url
      this.email =  data.email
      this.phone =  data.phone
      this.logo = data.logo
      this.brochure = data.brochure
      this.shortdesc =  data.shortdesc
      this.longdesc = data.longdesc
      this.state = JSON.parse(data.address)[1];
      this.city = JSON.parse(data.address)[2];
      this.address = JSON.parse(data.address)[3];
      this.oldLogo =  data.logoImage
      this.oldLogoId =  data.logo
      this.oldBrochure =  data.brochureImage
      this.oldBrochureId =  data.brochure
      this.medium = true;
    },
    updateSubmit(e) {
      e.preventDefault();
      const data = new FormData();
      data.append('id', this.id);
      data.append('name', this.name);
      data.append('url', this.url.replace(/ /g,"-").toLowerCase());
      data.append('email', this.email);
      data.append('phone', this.phone);
      data.append('logo', this.logo);
      data.append('oldLogo', this.oldLogo);
      data.append('oldLogoId', this.oldLogoId);
      data.append('brochure', this.brochure);
      data.append('oldBrochure', this.oldBrochure);
      data.append('oldBrochureId', this.oldBrochureId);
      data.append('shortdesc', this.shortdesc);
      data.append('longdesc', this.longdesc);
      data.append('address', JSON.stringify(["India", this.state, this.city, this.address]));
      this.$store.dispatch('updateBuilder', data);
      this.resetData();
    },
  },
  computed: {
    ...mapGetters(['adminBuilders']),
  },
  created() {
    this.$store.dispatch('adminBuilders');
  },
};
</script>
